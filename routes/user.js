const express = require('express');
const bcrypt = require('bcryptjs');
const db = require("../models");
const User= db.user
const router = express.Router();
const authMiddleware = require('../middleware/authMiddleware');
// Registrazione utente
router.post('/register', async (req, res) => {
  const { username, password } = req.body;

  try {
    const user = await User.create({ username, password });
    res.status(201).json({ message: 'Utente registrato con successo', user });
  } catch (err) {
    console.log(err)
    res.status(500).json({ error: 'Errore nella registrazione' });
  }
});

// Login utente
router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  try {
    const user = await User.findOne({ where: { username } });
    if (!user) {
      return res.status(401).json({ error: 'Credenziali non valide' });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ error: 'Credenziali non valide' });
    }

    req.session.userId = user.id;
    res.json({ message: 'Login effettuato con successo' });
  } catch (err) {
    res.status(500).json({ error: 'Errore durante il login' });
  }
});

// Logout utente
router.post('/logout', (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      return res.status(500).json({ error: 'Errore durante il logout' });
    }
    res.clearCookie('connect.sid');
    res.json({ message: 'Logout effettuato con successo' });
  });
});

router.get('/test',authMiddleware,(req,res)=>{
    res.json({ message: 'Accesso ok' })
})
module.exports = router;