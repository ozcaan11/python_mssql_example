"""
    To connect mssql via python you must install pymssql modul
    To install the modulu 'pip install pymssql'
    Now, I'm in windows 8.1 and i have already install MSSQLServer 2014
    I have a database named pythonDbTest contains one table, Person
"""
from job import get_job_list, insert_job_to_db
from person import get_person_with_job, insert_person_to_db
import os
import platform


def clear():
    if platform.system() == "Windows":
        os.system("cls")
    else:
        os.system("clear")


def person_list():
    get_person_with_job()


def job_list():
    get_job_list()


def add_person():
    get_job_list()
    f_name = input('firstname: ')
    l_name = input('lastname: ')
    birth = input('birthday: ')
    job = input('job: ')
    insert_person_to_db(f_name, l_name, birth, job)


def add_job():
    j_name = input("Name: ")
    insert_job_to_db(j_name)


if __name__ == '__main__':
    clear()
    print("""
    What would you like to do ?

    1 - Person List
    2 - Job List
    3 - Add Person
    4 - Add Job
    """)
    choice = input("select an option > ")
    try:
        if int(choice) == 1:
            person_list()
        elif int(choice) == 2:
            job_list()
        elif int(choice) == 3:
            add_person()
        elif int(choice) == 4:
            add_job()
        else:
            print("wrong choices")
            exit(0)
    except:
        print("wrong choices ")
        exit(0)
