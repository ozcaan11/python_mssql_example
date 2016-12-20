from database import get_db

conn, cursor = get_db()


def get_job_list():
    cursor.execute("SELECT * FROM dbo.Job")
    print("\t*-- JOB LIST --*")
    for row in cursor:
        print("\t{} - \t{}".format(str(row[0]), row[1]))


def insert_job_to_db(job_name):
    query = "INSERT INTO Job (Name) VALUES (%s)"
    cursor.execute(query, job_name)
    conn.commit()
