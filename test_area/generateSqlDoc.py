import mariadb
import sys
import json

# 🔧 Configurazione database
CONFIG = {
    "user": "admin",
    "password": "canonmkII0x0",
    "host": "localhost",
    "database": "mushborg",
    "port": 3306,
}

def connect_db():
    try:
        conn = mariadb.connect(**CONFIG)
        print("✅ Connessione a MariaDB stabilita.")
        return conn
    except mariadb.Error as e:
        print(f"❌ Errore di connessione a MariaDB: {e}")
        sys.exit(1)

def get_tables(cursor, db_name):
    query = f"""
        SELECT TABLE_NAME, TABLE_COMMENT
        FROM information_schema.TABLES
        WHERE TABLE_SCHEMA = '{db_name}'
        ORDER BY TABLE_NAME;
    """
    cursor.execute(query)
    return cursor.fetchall()

def get_columns(cursor, db_name, table_name):
    query = f"""
        SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY,
               COLUMN_DEFAULT, EXTRA, COLUMN_COMMENT
        FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = '{db_name}' AND TABLE_NAME = '{table_name}'
        ORDER BY ORDINAL_POSITION;
    """
    cursor.execute(query)
    return cursor.fetchall()

def generate_markdown(db_name, tables):
    markdown = f"# 📘 Documentazione Database `{db_name}`\n\n"

    for table_name, table_comment, columns in tables:
        markdown += f"## Tabella `{table_name}`\n"
        if table_comment:
            markdown += f"**Commento:** {table_comment}\n\n"
        else:
            markdown += "\n"

        markdown += "| Campo | Tipo | Commento |\n"
        markdown += "|-------|------|----------|\n"

        for col in columns:
            name, ctype, nullable, key, default, extra, comment = col
            markdown += f"| {name} | {ctype} | {comment or ''} |\n"

        markdown += "\n"
    return markdown

def main():
    conn = connect_db()
    cursor = conn.cursor()
    db_name = CONFIG["database"]

    # 📋 Recupera tabelle e relativi commenti
    tables_raw = get_tables(cursor, db_name)
    tables = []

    for table_name, table_comment in tables_raw:
        columns = get_columns(cursor, db_name, table_name)
        tables.append((table_name, table_comment, columns))

    conn.close()

    # 💾 Salva JSON
    doc_json = {
        table_name: {
            "comment": table_comment,
            "columns": [
                {
                    "Field": col[0],
                    "Type": col[1],
                    "Null": col[2],
                    "Key": col[3],
                    "Default": col[4],
                    "Extra": col[5],
                    "Comment": col[6],
                }
                for col in columns
            ],
        }
        for table_name, table_comment, columns in tables
    }

    with open("db_structure.json", "w", encoding="utf-8") as f:
        json.dump(doc_json, f, indent=2, ensure_ascii=False)
        print("✅ File JSON generato: db_structure.json")

    # 📝 Genera Markdown
    markdown = generate_markdown(db_name, tables)
    with open("db_documentation.md", "w", encoding="utf-8") as f:
        f.write(markdown)
        print("✅ File Markdown generato: db_documentation.md")

if __name__ == "__main__":
    main()