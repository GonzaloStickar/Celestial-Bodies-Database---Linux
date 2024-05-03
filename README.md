  Required:
  
    Install psql:
      $ sudo apt-get install psql
    To Initialize psql ( Problems to initialize psql might probably be solved on solution B) ):
      psql --username=username --dbname=databasename
        Replace "username" with your username that you are using, or you will use.
        Replace "database" with your databasename that you are using, or you will use.



  Problems related with opening psql:
  
  A) Connection refused.
  
    psql: error: connection to server at "<host_ip>", port "port" failed: Connection refused
    Is the server running on that host and accepting TCP/IP connections?
  
    Solution: 
    Credit: https://stackoverflow.com/questions/32439167/psql-could-not-connect-to-server-connection-refused-error-when-connecting-to
    Step by step:
    
      1- Open file named "postgresql.conf"
      
        1.1) Located "/etc/postgresql/<version>/main/"
          1.1.1) How to find the route to the file ( if we wouldn't know 1.1) ):
            $ sudo find / -type f -name "name_of_file"
        1.2) Open file named "postgresql.conf" by going to 1.3)
        1.3) $ sudo vi postgresql.conf
        Using "vi" to edit (We can also use "nano" if we want)
          1.3.1) To find it:
            $ sudo find / -type f -name "postgresql.conf"
          1.3.2) Once it is found, you must open it ( Copy and Paste the exact location (Folders) ):
            $ sudo vi /etc/postgresql/<version>/main/postgresql.conf
        1.4) Once opened, scroll down to the bottom and add this line (Without modifying anything else)
            listen_addresses = '*'
          1.4.1) To add it:
            Press key "i" to insert a line where you are selecting.
            It should look something like this: 
              Data
              listen_addresses = '*'
          1.4.2) To save the file
            1.4.1) Press "ESC"
            1.4.2) Press ":wq"
            1.4.3) Press "ENTER"
        
      2- Open file named "pg_hba.conf"
      
        2.1) Located /etc/postgresql/<version>/main/pg_hba.conf
          2.1.1) How to find the route to the file ( if we wouldn't know 1.1) ):
            $ sudo find / -type f -name "name_of_file"
        2.2) Open file named "pg_hba.conf" by going 2.3)
        2.3) $ sudo vi pg_hba.conf
          Using "vi" to edit (We can also use "nano" if we want)
          2.3.1) To find it:
            $ sudo find / -type f -name "pg_hba.conf"
          2.3.2) Once it is found, you must open it ( Copy and Paste the exact location (Folders) ):
            $ sudo vi /etc/postgresql/<version>/main/pg_hba.conf
        2.4) Once opened, scroll down to the bottom and add this line (Without modifying anything else)
            host  all  all 0.0.0.0/0 md5
          2.4.1) To add it:
            Press key "i" to insert a line where you are selecting.
            It should look something like this: 
              Data...
              host  all  all 0.0.0.0/0 md5
          2.4.2) To save the file
            2.4.1) Press "ESC"
            2.4.2) Press ":wq"
            2.4.3) Press "ENTER"
          2.4.3) Extra - Explanation of added line:
            host: Indicates that we are configuring an access rule for connections via TCP/IP. 
            all: Indicates that the rule applies to all databases. 
            all: Indicates that the rule applies to all users. 
            0.0.0.0/0: Indicates that the rule allows connections from any IP address. 
            md5: Indicates that authentication is performed using the MD5 authentication method, which is a secure authentication method using encrypted passwords.
            
      3- Restart psql server
      
        $ sudo /etc/init.d/postgresql restart
  
  
    
  B) Role of user does not exist in your psql server.
  
    psql --username=username --dbname=databasename
    psql: error: connection to server at <host_ip>, port "port" failed: FATAL:  role "username" does not exist
    
    Solution:
    Step by step:
    
      1) Copy and Paste this line in your terminal / console
          1.1) Initialize psql
            $ psql -U postgres
          1.2) You can create a database:
            CREATE DATABASE databasename;
      2) Copy and Paste this line in your terminal / console (your_password ( Generate a password that you will remember) )
        CREATE ROLE username WITH LOGIN PASSWORD 'your_password';
      3) Connect to your database with:
        $ psql --username=username --dbname=databasename
          Replace "username" with your username that you are using, or you will use.
          Replace "database" with your databasename that you are using, or you will use.
      4) Extra - Give all privileges to your "username"
        GRANT ALL PRIVILEGES ON DATABASE databasename TO username;
      5) Extra - To exit psql, type in terminal / console
          \q



Requirements for this project assigned:

- You should create a database named universe
- Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon
- Each table should have a primary key
- Each primary key should automatically increment
- Each table should have a name column
- You should use the INT data type for at least two columns that are not a primary or foreign key
- You should use the NUMERIC data type at least once
- You should use the TEXT data type at least once
- You should use the BOOLEAN data type on at least two columns
- Each "star" should have a foreign key that references one of the rows in galaxy
- Each "planet" should have a foreign key that references one of the rows in star
- Each "moon" should have a foreign key that references one of the rows in planet
- Your database should have at least five tables
- Each table should have at least three rows
- The galaxy and star tables should each have at least six rows
- The planet table should have at least 12 rows
- The moon table should have at least 20 rows
- Each table should have at least three columns
- The galaxy, star, planet, and moon tables should each have at least five columns
- At least two columns per table should not accept NULL values
- At least one column from each table should be required to be UNIQUE
- All columns named name should be of type VARCHAR
- Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id
- Each foreign key column should have the same name as the column it is referencing
