import pymssql

server = "L50\\OZCANYD"
user = "sa"
password = "Pass123"
database = "pythonDbTest"


def get_db():
    conn = pymssql.connect(server, user, password, database)
    cursor = conn.cursor()
    return conn, cursor
