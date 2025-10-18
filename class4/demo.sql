 create database practice;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| codeclimber        |
| dsabatch18         |
| information_schema |
| mysql              |
| performance_schema |
| practice           |
| selection          |
| sys                |
+--------------------+
8 rows in set (0.00 sec)

mysql> use practice;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table student(sid int primary key, age int not null, email varchar(20) unique, city varchar(30) default 'Indore');
Query OK, 0 rows affected (0.06 sec)

mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | int         | NO   | PRI | NULL    |       |
| age   | int         | NO   |     | NULL    |       |
| email | varchar(20) | YES  | UNI | NULL    |       |
| city  | varchar(30) | YES  |     | Indore  |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> alter table student add column name varchar(20) not null;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | int         | NO   | PRI | NULL    |       |
| age   | int         | NO   |     | NULL    |       |
| email | varchar(20) | YES  | UNI | NULL    |       |
| city  | varchar(30) | YES  |     | Indore  |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into student values (1,20,'rohan@gmail.com','Mumbai','Rohan Yadav'),
    -> (2,22,'manish@gmail.com','Delhi','Manish Thakur'),
    -> (3,26,'paritosh@gmail.com','jabalpur','Paritosh Sahu');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from student;
+-----+-----+--------------------+----------+---------------+
| sid | age | email              | city     | name          |
+-----+-----+--------------------+----------+---------------+
|   1 |  20 | rohan@gmail.com    | Mumbai   | Rohan Yadav   |
|   2 |  22 | manish@gmail.com   | Delhi    | Manish Thakur |
|   3 |  26 | paritosh@gmail.com | jabalpur | Paritosh Sahu |
+-----+-----+--------------------+----------+---------------+
3 rows in set (0.00 sec)

mysql> insert into student values (4,27,'niraj@gmail.com','Bhopal','Niraj Mahajan');
Query OK, 1 row affected (0.01 sec)

mysql> insert into student (sid,age,email,name) values (5,29,'mayank@gmail.com','Mayank Chouhan');
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+-----+-----+--------------------+----------+----------------+
| sid | age | email              | city     | name           |
+-----+-----+--------------------+----------+----------------+
|   1 |  20 | rohan@gmail.com    | Mumbai   | Rohan Yadav    |
|   2 |  22 | manish@gmail.com   | Delhi    | Manish Thakur  |
|   3 |  26 | paritosh@gmail.com | jabalpur | Paritosh Sahu  |
|   4 |  27 | niraj@gmail.com    | Bhopal   | Niraj Mahajan  |
|   5 |  29 | mayank@gmail.com   | Indore   | Mayank Chouhan |
+-----+-----+--------------------+----------+----------------+
5 rows in set (0.00 sec)

mysql> insert into student values (1,20,'mohan@gmail.com','Indore','Mohan');
ERROR 1062 (23000): Duplicate entry '1' for key 'student.PRIMARY'
mysql> insert into student values (6,27,'mohan@gmail.com','Indore','Mohan');
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+-----+-----+--------------------+----------+----------------+
| sid | age | email              | city     | name           |
+-----+-----+--------------------+----------+----------------+
|   1 |  20 | rohan@gmail.com    | Mumbai   | Rohan Yadav    |
|   2 |  22 | manish@gmail.com   | Delhi    | Manish Thakur  |
|   3 |  26 | paritosh@gmail.com | jabalpur | Paritosh Sahu  |
|   4 |  27 | niraj@gmail.com    | Bhopal   | Niraj Mahajan  |
|   5 |  29 | mayank@gmail.com   | Indore   | Mayank Chouhan |
|   6 |  27 | mohan@gmail.com    | Indore   | Mohan          |
+-----+-----+--------------------+----------+----------------+
6 rows in set (0.00 sec)

mysql> select * from student where city=Indore;
ERROR 1054 (42S22): Unknown column 'Indore' in 'where clause'
mysql> select * from student where city='Indore';
+-----+-----+------------------+--------+----------------+
| sid | age | email            | city   | name           |
+-----+-----+------------------+--------+----------------+
|   5 |  29 | mayank@gmail.com | Indore | Mayank Chouhan |
|   6 |  27 | mohan@gmail.com  | Indore | Mohan          |
+-----+-----+------------------+--------+----------------+
2 rows in set (0.00 sec)

mysql> select count(sid) * from student where city='Indore';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from student where city='Indore'' at line 1
mysql> select city, count(sid) from student group by city;
+----------+------------+
| city     | count(sid) |
+----------+------------+
| Mumbai   |          1 |
| Delhi    |          1 |
| jabalpur |          1 |
| Bhopal   |          1 |
| Indore   |          2 |
+----------+------------+
5 rows in set (0.01 sec)

mysql> select count(sid) from student;
+------------+
| count(sid) |
+------------+
|          6 |
+------------+
1 row in set (0.00 sec)

mysql> select city, count(sid) from student;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'practice.student.city'; this is incompatible with sql_mode=only_full_group_by
mysql> select name, count(sid) from student group by name;
+----------------+------------+
| name           | count(sid) |
+----------------+------------+
| Rohan Yadav    |          1 |
| Manish Thakur  |          1 |
| Paritosh Sahu  |          1 |
| Niraj Mahajan  |          1 |
| Mayank Chouhan |          1 |
| Mohan          |          1 |
+----------------+------------+
6 rows in set (0.00 sec)

mysql> select name  from student group by name;
+----------------+
| name           |
+----------------+
| Rohan Yadav    |
| Manish Thakur  |
| Paritosh Sahu  |
| Niraj Mahajan  |
| Mayank Chouhan |
| Mohan          |
+----------------+
6 rows in set (0.00 sec)

mysql> select name, age  from student group by age;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'practice.student.name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select name, age  from student group by name;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'practice.student.age' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | int         | NO   | PRI | NULL    |       |
| age   | int         | NO   |     | NULL    |       |
| email | varchar(20) | YES  | UNI | NULL    |       |
| city  | varchar(30) | YES  |     | Indore  |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select city, avg(age) from student where age >23 group by city having avg(age)>20;
+----------+----------+
| city     | avg(age) |
+----------+----------+
| jabalpur |  26.0000 |
| Bhopal   |  27.0000 |
| Indore   |  28.0000 |
+----------+----------+
3 rows in set (0.01 sec)

mysql> select city, avg(age) from student  group by city having avg(age)>20;
+----------+----------+
| city     | avg(age) |
+----------+----------+
| Delhi    |  22.0000 |
| jabalpur |  26.0000 |
| Bhopal   |  27.0000 |
| Indore   |  28.0000 |
+----------+----------+
4 rows in set (0.00 sec)

mysql> select * from student;
+-----+-----+--------------------+----------+----------------+
| sid | age | email              | city     | name           |
+-----+-----+--------------------+----------+----------------+
|   1 |  20 | rohan@gmail.com    | Mumbai   | Rohan Yadav    |
|   2 |  22 | manish@gmail.com   | Delhi    | Manish Thakur  |
|   3 |  26 | paritosh@gmail.com | jabalpur | Paritosh Sahu  |
|   4 |  27 | niraj@gmail.com    | Bhopal   | Niraj Mahajan  |
|   5 |  29 | mayank@gmail.com   | Indore   | Mayank Chouhan |
|   6 |  27 | mohan@gmail.com    | Indore   | Mohan          |
+-----+-----+--------------------+----------+----------------+
6 rows in set (0.00 sec)

mysql> select city, max(age) from student  group by city having max(age)>20;
+----------+----------+
| city     | max(age) |
+----------+----------+
| Delhi    |       22 |
| jabalpur |       26 |
| Bhopal   |       27 |
| Indore   |       29 |
+----------+----------+
4 rows in set (0.01 sec)

mysql> select city, avg(age) from student  group by city where avg(age)>20;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where avg(age)>20' at line 1
mysql> select count(sid) from student;





 show databases;
+--------------------+
| Database           |
+--------------------+
| codeclimber        |
| dsabatch18         |
| information_schema |
| mysql              |
| performance_schema |
| practice           |
| selection          |
| sys                |
+--------------------+
8 rows in set (0.01 sec)

mysql> use practice;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_practice |
+--------------------+
| student            |
+--------------------+
1 row in set (0.00 sec)

mysql> drop table student;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
Empty set (0.00 sec)

mysql> create table student (sid primary key, name varchar(20), age int not null, cid int);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key, name varchar(20), age int not null, cid int)' at line 1
mysql> create table student (sid int primary key, name varchar(20), age int not null, cid int);
Query OK, 0 rows affected (0.07 sec)

mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | int         | NO   | PRI | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | NO   |     | NULL    |       |
| cid   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table course  (cid int primary key, coursename varchar(20), courseDuration int not null);
Query OK, 0 rows affected (0.03 sec)

mysql> desc course;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| cid            | int         | NO   | PRI | NULL    |       |
| coursename     | varchar(20) | YES  |     | NULL    |       |
| courseDuration | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into student values(1,'Rohan',23,1),
    -> (2,'Mohan',24,2),
    -> (3,'Paritosh',21,1);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into course values(1,'Mern Stack',4),
    -> (2, 'Java Full Stack' 8),
    -> (3, 'Dot net' 10);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '8),
(3, 'Dot net' 10)' at line 2
mysql> insert into course values(1,'Mern Stack',4);
Query OK, 1 row affected (0.01 sec)

mysql> insert into course values(2,'Java full satck',8);
Query OK, 1 row affected (0.01 sec)

mysql> insert into course values(3,'dot net',10);
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+-----+----------+-----+------+
| sid | name     | age | cid  |
+-----+----------+-----+------+
|   1 | Rohan    |  23 |    1 |
|   2 | Mohan    |  24 |    2 |
|   3 | Paritosh |  21 |    1 |
+-----+----------+-----+------+
3 rows in set (0.00 sec)

mysql> select * from coursel
    -> ;
ERROR 1146 (42S02): Table 'practice.coursel' doesn't exist
mysql> select * from course;
+-----+-----------------+----------------+
| cid | coursename      | courseDuration |
+-----+-----------------+----------------+
|   1 | Mern Stack      |              4 |
|   2 | Java full satck |              8 |
|   3 | dot net         |             10 |
+-----+-----------------+----------------+
3 rows in set (0.00 sec)

mysql> select * from student;
+-----+----------+-----+------+
| sid | name     | age | cid  |
+-----+----------+-----+------+
|   1 | Rohan    |  23 |    1 |
|   2 | Mohan    |  24 |    2 |
|   3 | Paritosh |  21 |    1 |
+-----+----------+-----+------+
3 rows in set (0.00 sec)

mysql> select * from student inner join course;
+-----+----------+-----+------+-----+-----------------+----------------+
| sid | name     | age | cid  | cid | coursename      | courseDuration |
+-----+----------+-----+------+-----+-----------------+----------------+
|   3 | Paritosh |  21 |    1 |   1 | Mern Stack      |              4 |
|   2 | Mohan    |  24 |    2 |   1 | Mern Stack      |              4 |
|   1 | Rohan    |  23 |    1 |   1 | Mern Stack      |              4 |
|   3 | Paritosh |  21 |    1 |   2 | Java full satck |              8 |
|   2 | Mohan    |  24 |    2 |   2 | Java full satck |              8 |
|   1 | Rohan    |  23 |    1 |   2 | Java full satck |              8 |
|   3 | Paritosh |  21 |    1 |   3 | dot net         |             10 |
|   2 | Mohan    |  24 |    2 |   3 | dot net         |             10 |
|   1 | Rohan    |  23 |    1 |   3 | dot net         |             10 |
+-----+----------+-----+------+-----+-----------------+----------------+
9 rows in set (0.00 sec)

mysql> select * from student inner join course student.cid=course.cid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.cid=course.cid' at line 1
mysql> select * from student inner join course on student.cid=course.cid;
+-----+----------+-----+------+-----+-----------------+----------------+
| sid | name     | age | cid  | cid | coursename      | courseDuration |
+-----+----------+-----+------+-----+-----------------+----------------+
|   1 | Rohan    |  23 |    1 |   1 | Mern Stack      |              4 |
|   2 | Mohan    |  24 |    2 |   2 | Java full satck |              8 |
|   3 | Paritosh |  21 |    1 |   1 | Mern Stack      |              4 |
+-----+----------+-----+------+-----+-----------------+----------------+
3 rows in set (0.00 sec)

mysql> select * from student;
+-----+----------+-----+------+
| sid | name     | age | cid  |
+-----+----------+-----+------+
|   1 | Rohan    |  23 |    1 |
|   2 | Mohan    |  24 |    2 |
|   3 | Paritosh |  21 |    1 |
+-----+----------+-----+------+
3 rows in set (0.00 sec)

mysql> select * from course;
+-----+-----------------+----------------+
| cid | coursename      | courseDuration |
+-----+-----------------+----------------+
|   1 | Mern Stack      |              4 |
|   2 | Java full satck |              8 |
|   3 | dot net         |             10 |
+-----+-----------------+----------------+
3 rows in set (0.00 sec)

mysql> select name, age from student inner join course on student.cid=course.cid;
+----------+-----+
| name     | age |
+----------+-----+
| Rohan    |  23 |
| Mohan    |  24 |
| Paritosh |  21 |
+----------+-----+
3 rows in set (0.00 sec)

mysql> select name, age, coursename from student inner join course on student.cid=course.cid;
+----------+-----+-----------------+
| name     | age | coursename      |
+----------+-----+-----------------+
| Rohan    |  23 | Mern Stack      |
| Mohan    |  24 | Java full satck |
| Paritosh |  21 | Mern Stack      |
+----------+-----+-----------------+
3 rows in set (0.00 sec)

mysql> select name, age,cid, coursename from student inner join course on student.cid=course.cid;
ERROR 1052 (23000): Column 'cid' in field list is ambiguous
mysql> select name, age,student.cid, coursename from student inner join course on student.cid=course.cid;
+----------+-----+------+-----------------+
| name     | age | cid  | coursename      |
+----------+-----+------+-----------------+
| Rohan    |  23 |    1 | Mern Stack      |
| Mohan    |  24 |    2 | Java full satck |
| Paritosh |  21 |    1 | Mern Stack      |
+----------+-----+------+-----------------+
3 rows in set (0.00 sec)

mysql> select * from student  left join course on student.cid=course.cid;
+-----+----------+-----+------+------+-----------------+----------------+
| sid | name     | age | cid  | cid  | coursename      | courseDuration |
+-----+----------+-----+------+------+-----------------+----------------+
|   1 | Rohan    |  23 |    1 |    1 | Mern Stack      |              4 |
|   2 | Mohan    |  24 |    2 |    2 | Java full satck |              8 |
|   3 | Paritosh |  21 |    1 |    1 | Mern Stack      |              4 |
+-----+----------+-----+------+------+-----------------+----------------+
3 rows in set (0.00 sec)

mysql> select * from student  left join course;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select * from student  left join course on student.cid=course.cid;
+-----+----------+-----+------+------+-----------------+----------------+
| sid | name     | age | cid  | cid  | coursename      | courseDuration |
+-----+----------+-----+------+------+-----------------+----------------+
|   1 | Rohan    |  23 |    1 |    1 | Mern Stack      |              4 |
|   2 | Mohan    |  24 |    2 |    2 | Java full satck |              8 |
|   3 | Paritosh |  21 |    1 |    1 | Mern Stack      |              4 |
+-----+----------+-----+------+------+-----------------+----------------+
3 rows in set (0.00 sec)

mysql> select * from student  right join course on student.cid=course.cid;
+------+----------+------+------+-----+-----------------+----------------+
| sid  | name     | age  | cid  | cid | coursename      | courseDuration |
+------+----------+------+------+-----+-----------------+----------------+
|    3 | Paritosh |   21 |    1 |   1 | Mern Stack      |              4 |
|    1 | Rohan    |   23 |    1 |   1 | Mern Stack      |              4 |
|    2 | Mohan    |   24 |    2 |   2 | Java full satck |              8 |
| NULL | NULL     | NULL | NULL |   3 | dot net         |             10 |
+------+----------+------+------+-----+-----------------+----------------+
4 rows in set (0.00 sec)

mysql> select * from course  left join student on course.cid=student.cid;
+-----+-----------------+----------------+------+----------+------+------+
| cid | coursename      | courseDuration | sid  | name     | age  | cid  |
+-----+-----------------+----------------+------+----------+------+------+
|   1 | Mern Stack      |              4 |    3 | Paritosh |   21 |    1 |
|   1 | Mern Stack      |              4 |    1 | Rohan    |   23 |    1 |
|   2 | Java full satck |              8 |    2 | Mohan    |   24 |    2 |
|   3 | dot net         |             10 | NULL | NULL     | NULL | NULL |
+-----+-----------------+----------------+------+----------+------+------+
4 rows in set (0.00 sec)

mysql> select * from student   join course on student.cid=course.cid;
+-----+----------+-----+------+-----+-----------------+----------------+
| sid | name     | age | cid  | cid | coursename      | courseDuration |
+-----+----------+-----+------+-----+-----------------+----------------+
|   1 | Rohan    |  23 |    1 |   1 | Mern Stack      |              4 |
|   2 | Mohan    |  24 |    2 |   2 | Java full satck |              8 |
|   3 | Paritosh |  21 |    1 |   1 | Mern Stack      |              4 |
+-----+----------+-----+------+-----+-----------------+----------------+
3 rows in set (0.00 sec)

mysql> select * from student   join course;
+-----+----------+-----+------+-----+-----------------+----------------+
| sid | name     | age | cid  | cid | coursename      | courseDuration |
+-----+----------+-----+------+-----+-----------------+----------------+
|   3 | Paritosh |  21 |    1 |   1 | Mern Stack      |              4 |
|   2 | Mohan    |  24 |    2 |   1 | Mern Stack      |              4 |
|   1 | Rohan    |  23 |    1 |   1 | Mern Stack      |              4 |
|   3 | Paritosh |  21 |    1 |   2 | Java full satck |              8 |
|   2 | Mohan    |  24 |    2 |   2 | Java full satck |              8 |
|   1 | Rohan    |  23 |    1 |   2 | Java full satck |              8 |
|   3 | Paritosh |  21 |    1 |   3 | dot net         |             10 |
|   2 | Mohan    |  24 |    2 |   3 | dot net         |             10 |
|   1 | Rohan    |  23 |    1 |   3 | dot net         |             10 |
+-----+----------+-----+------+-----+-----------------+----------------+
9 rows in set (0.00 sec)

mysql>