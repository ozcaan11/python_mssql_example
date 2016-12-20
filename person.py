from database import get_db

con, cursor = get_db()


def get_person_with_job():
    cursor.execute("""SELECT  dbo.Person.Firstname,
                              dbo.Person.Lastname,
                              dbo.Person.Birthday,
                              dbo.Job.Name
                      FROM    dbo.Person
                      INNER JOIN dbo.Job
                      ON      dbo.Person.JobId = dbo.Job.Id
                            """)
    for row in cursor:
        print("""
        First Name  = {}
        Last Name   = {}
        Birthday    = {}
        Job         = {}
        """.format(row[0], row[1], row[2].strftime('%d/%m/%Y'), row[3])
              )


def insert_person_to_db(firstname, lastname, birthday, jobId):
    query = "INSERT INTO Person (Firstname, Lastname, Birthday, JobId) VALUES (%s,%s,%s ,%d)"
    cursor.execute(query, (str(firstname), str(lastname), birthday, int(jobId)))
    con.commit()
