## Python3 and MSSQL Example
This is a simple program to use mssql with python3 

#### Start installing pymssql
    pip install pymssql
    

#### To connect database

    server = "SERVERNAME"
    user = "USER"
    password = "PASS"
    database = "DB_NAME"  
    conn = pymssql.connect(server, user, password, database)
    
#### To work with database
    
    cursor = conn.cursor()
    
    # list
    query = "SELECT * FROM TABLE_NAME"
    cursor.execute(query)
    for row in cursor():
      print("First Col = "+row[0],"Second Col = "+row[1],...)
      
    # insert
    query = "INSERT INTO TABLE_NAME (COL_1,COL_2) VALUES (%s,%s)"
    cursor.execute(query, "VAL_1","VAL_2")
    .
    .   
    .
    SO ON.


-----------------
| [Visit my website](http://semiworld.org/) 
-----------------
