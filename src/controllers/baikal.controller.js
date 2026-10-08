const ICAL = require('ical.js');

/**
 * Recupera gli eventi da Baïkal tramite query CalDAV REPORT diretta
 */
exports.getEventsFromBaikal = async (startDate, endDate, config = {}) => {
  try {
    const calendarUrl = config.calendarUrl || process.env.BAIKAL_CALENDAR_URL;
    const username = config.username || process.env.BAIKAL_USERNAME;
    const password = config.password || process.env.BAIKAL_PASSWORD;

    if (!calendarUrl || !username || !password) {
      throw new Error("Credenziali o URL del calendario Baïkal mancanti nelle configurazioni.");
    }

    // Gestione intervallo date in formato ISO 8601 compresso (YYYYMMDDTHHMMSSZ) richiesto da CalDAV
    const startObj = startDate ? new Date(startDate) : new Date();
    const endObj = endDate ? new Date(endDate) : new Date(Date.now() + 30 * 24 * 60 * 60 * 1000);

    const formatCalDAVDate = (date) => {
      return date.toISOString().replace(/[-:]/g, '').split('.')[0] + 'Z';
    };

    const startIso = formatCalDAVDate(startObj);
    const endIso = formatCalDAVDate(endObj);

    // Payload XML per la richiesta CalDAV REPORT
    const xmlQuery = `<?xml version="1.0" encoding="utf-8" ?>
<C:calendar-query xmlns:D="DAV:" xmlns:C="urn:ietf:params:xml:ns:caldav">
  <D:prop>
    <D:getetag />
    <C:calendar-data />
  </D:prop>
  <C:filter>
    <C:comp-filter name="VCALENDAR">
      <C:comp-filter name="VEVENT">
        <C:time-range start="${startIso}" end="${endIso}"/>
      </C:comp-filter>
    </C:comp-filter>
  </C:filter>
</C:calendar-query>`;

    // Intestazione per HTTP Basic Authentication
    const authHeader = 'Basic ' + Buffer.from(`${username}:${password}`).toString('base64');

    // Chiamata HTTP REPORT verso Baïkal
    const response = await fetch(calendarUrl, {
      method: 'REPORT',
      headers: {
        'Authorization': authHeader,
        'Content-Type': 'application/xml; charset=utf-8',
        'Depth': '1'
      },
      body: xmlQuery
    });

    if (!response.ok) {
      throw new Error(`Risposta server Baïkal fallita: ${response.status} ${response.statusText}`);
    }

    const xmlText = await response.text();

    // Estrazione dei blocchi VCALENDAR tramite Regex
    const icsMatches = xmlText.match(/BEGIN:VCALENDAR[\s\S]*?END:VCALENDAR/g) || [];

    // Parsing dei blocchi iCal tramite ical.js
    const events = icsMatches.map((icsData) => {
      try {
        const jcalData = ICAL.parse(icsData);
        const comp = new ICAL.Component(jcalData);
        const vevent = comp.getFirstSubcomponent('vevent');
        
        if (!vevent) return null;

        const event = new ICAL.Event(vevent);

        return {
          uid: event.uid,
          titolo: event.summary || 'Senza titolo',
          descrizione: event.description || '',
          start: event.startDate ? event.startDate.toJSDate() : null,
          stop: event.endDate ? event.endDate.toJSDate() : null,
          location: event.location || ''
        };
      } catch (err) {
        console.warn('Impossibile interpretare un evento iCal:', err);
        return null;
      }
    }).filter(Boolean); // Rimuove eventuali null

    return events;

  } catch (error) {
    console.error('Errore durante il recupero degli eventi da Baïkal:', error);
    throw error;
  }
};

/**
 * CREA O MODIFICA UN EVENTO (PUT)
 * Se passi un 'uid' esistente aggiorna l'evento, altrimenti ne genera uno nuovo.
 */
exports.saveEventToBaikal = async (eventData, config = {}) => {
  try {
    const calendarUrl = config.calendarUrl || process.env.BAIKAL_CALENDAR_URL;
    const username = config.username || process.env.BAIKAL_USERNAME;
    const password = config.password || process.env.BAIKAL_PASSWORD;

    if (!calendarUrl || !username || !password) {
      throw new Error("Credenziali o URL Baïkal mancanti.");
    }

    // Genera UID o usa quello esistente per la modifica
    const uid = eventData.uid || `${Date.now()}-${Math.random().toString(36).substring(2, 9)}@mushborg.it`;

    // 1. Costruzione della struttura iCalendar con ical.js
    const vcalendar = new ICAL.Component(['vcalendar', [], []]);
    vcalendar.addPropertyWithValue('version', '2.0');
    vcalendar.addPropertyWithValue('prodid', '-//Mushborg App//EN');

    const vevent = new ICAL.Component('vevent');
    const event = new ICAL.Event(vevent);

    event.uid = uid;
    event.summary = eventData.titolo || 'Senza titolo';
    event.description = eventData.descrizione || '';
    if (eventData.location) event.location = eventData.location;

    // Impostazione date (accetta oggetti Date, stringhe ISO o timestamp)
    if (eventData.start) {
      event.startDate = ICAL.Time.fromJSDate(new Date(eventData.start), true);
    }
    if (eventData.stop || eventData.end) {
      event.endDate = ICAL.Time.fromJSDate(new Date(eventData.stop || eventData.end), true);
    }

    vcalendar.addSubcomponent(vevent);
    const icsString = vcalendar.toString();

    // 2. Assicura che l'URL finisca con lo slash e aggiunge il nome del file .ics
    const baseUrl = calendarUrl.endsWith('/') ? calendarUrl : `${calendarUrl}/`;
    const eventUrl = `${baseUrl}${uid}.ics`;

    // 3. Invia la richiesta PUT a Baïkal
    const response = await fetch(eventUrl, {
      method: 'PUT',
      headers: {
        'Authorization': getAuthHeader(username, password),
        'Content-Type': 'text/calendar; charset=utf-8'
      },
      body: icsString
    });

    if (!response.ok && response.status !== 201 && response.status !== 204) {
      throw new Error(`Salvataggio fallito su Baïkal: ${response.status} ${response.statusText}`);
    }

    return {
      success: true,
      uid: uid,
      url: eventUrl
    };

  } catch (error) {
    console.error('Errore durante il salvataggio su Baïkal:', error);
    throw error;
  }
};

/**
 * 2. CANCELLA UN EVENTO (DELETE)
 * Richiede l'UID dell'evento da eliminare.
 */
const getAuthHeader = (username, password) => {
  return 'Basic ' + Buffer.from(`${username}:${password}`).toString('base64');
};

exports.deleteEventFromBaikal = async (uid, config = {}) => {
  try {
    const calendarUrl = config.calendarUrl || process.env.BAIKAL_CALENDAR_URL;
    const username = config.username || process.env.BAIKAL_USERNAME;
    const password = config.password || process.env.BAIKAL_PASSWORD;

    if (!calendarUrl || !username || !password) {
      throw new Error("Credenziali o URL Baïkal mancanti.");
    }

    if (!uid) {
      throw new Error("UID dell'evento mancante.");
    }

    // Garantisce l'estensione .ics nell'URL finale
    const fileName = uid.endsWith('.ics') ? uid : `${uid}.ics`;
    const baseUrl = calendarUrl.endsWith('/') ? calendarUrl : `${calendarUrl}/`;
    const eventUrl = `${baseUrl}${fileName}`;

    // Invia la richiesta DELETE a Baïkal
    const response = await fetch(eventUrl, {
      method: 'DELETE',
      headers: {
        'Authorization': getAuthHeader(username, password)
      }
    });

    if (!response.ok && response.status !== 204 && response.status !== 404) {
      throw new Error(`Cancellazione fallita su Baïkal: ${response.status} ${response.statusText}`);
    }

    return {
      success: true,
      uid: uid
    };

  } catch (error) {
    console.error('Errore durante la cancellazione da Baïkal:', error);
    throw error;
  }
};