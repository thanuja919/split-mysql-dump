# split-mysql-dump
This can be used to split a large mysql dump which consists all the databses into multiple sql files per database.

When we taking a mysql db dump we have different options of taking the single dump with all the databases, selected database, selected tables, etc.

However this script only focuses on spliting a large mysql dump into per database dumps.

There is a much simpler alternative way to achive this. First create the database and then execute this command.

mysql -u root -p --one-database database_name < all_databases-dump.sql

But if you don't know the database name or you are dealing with hundreds of databases this approach is inefficient.

Using this script you can split the file into multiple sql files. The file name will be the database name.

Running the script
------------------

./split-mysql-dump.sh <mysql-dump-file-path>

You need to execute the script with the parameter of main db dump file path. 
Make sure the main db dump file is not in the same directory. 

This script works successfully on Ubuntu 16.04 LTS.
