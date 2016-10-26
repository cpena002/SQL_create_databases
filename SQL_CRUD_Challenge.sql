--Last login: Wed Oct 26 09:00:00 on console
--learn14:~ learn$ psql postgres
--psql (9.5.2)
--Type "help" for help.

postgres=# CREATE DATABASE rolodex
postgres-# ;
CREATE DATABASE
postgres=# \c rolodex
You are now connected to database "rolodex" as user "learn".
rolodex=# CREATE TABLE persons ( id serial PRIMARY KEY, given_name varchar, family_name varchar, address varchar, dob date, email varchar);
CREATE TABLE
rolodex=# select * from rolodex
rolodex-# ;
ERROR:  relation "rolodex" does not exist
LINE 1: select * from rolodex
                      ^
rolodex=# select * persons
rolodex-# ;
ERROR:  syntax error at or near "persons"
LINE 1: select * persons
                 ^
rolodex=# select * from persons;
 id | given_name | family_name | address | dob | email
----+------------+-------------+---------+-----+-------
(0 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
rolodex-# VALUES ('Anya', 'Sinha', '123 UCSD street', 1998-08-29, 'anyas@learn.com')
rolodex-# ;
ERROR:  column "dob" is of type date but expression is of type integer
LINE 2: VALUES ('Anya', 'Sinha', '123 UCSD street', 1998-08-29, 'any...
                                                    ^
HINT:  You will need to rewrite or cast the expression.
rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Anya', 'Sinha', '123 UCSD street', '1998-08-29', 'anyas@learn.com')
;
INSERT 0 1
rolodex=# select * from persons
rolodex-# ;
 id | given_name | family_name |     address     |    dob     |      email
----+------------+-------------+-----------------+------------+-----------------
  1 | Anya       | Sinha       | 123 UCSD street | 1998-08-29 | anyas@learn.com
(1 row)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Lucy', 'Pena', '123 risco st.', '1983_12_21', 'lucy@fake.com')
;
INSERT 0 1
rolodex=# select * from persons
;
 id | given_name | family_name |     address     |    dob     |      email
----+------------+-------------+-----------------+------------+-----------------
  1 | Anya       | Sinha       | 123 UCSD street | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.   | 1983-12-21 | lucy@fake.com
(2 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Barun', 'Sinha', '123 Musician's Lane', '1995_08_04', 'browniepants@fake.com')
;
rolodex'# select * from persons
;
rolodex'# select * from persons
;
rolodex'#
rolodex'# ;
rolodex'# select * from persons;
rolodex'# select * from persons
;^C
rolodex=# select * from persons
;
 id | given_name | family_name |     address     |    dob     |      email
----+------------+-------------+-----------------+------------+-----------------
  1 | Anya       | Sinha       | 123 UCSD street | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.   | 1983-12-21 | lucy@fake.com
(2 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Barun', 'Sinha', '123 Musician st.', '1995_08_04', 'browniepants@fake.com');
INSERT 0 1
rolodex=# select * from persons
;
 id | given_name | family_name |     address      |    dob     |         email
----+------------+-------------+------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street  | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.    | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st. | 1995-08-04 | browniepants@fake.com
(3 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Julyanna', 'Pena', '321 Other st.', '1988_12_27', 'Julyanna@fake.com');
INSERT 0 1
rolodex=# select * from persons
;
 id | given_name | family_name |     address      |    dob     |         email
----+------------+-------------+------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street  | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.    | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st. | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.    | 1988-12-27 | Julyanna@fake.com
(4 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Bonita', 'Baruah', '964 Mother st.', '1965_04_23', 'mother@fake.com');
INSERT 0 1
rolodex=# select * from persons
;
 id | given_name | family_name |     address      |    dob     |         email
----+------------+-------------+------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street  | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.    | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st. | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.    | 1988-12-27 | Julyanna@fake.com
  5 | Bonita     | Baruah      | 964 Mother st.   | 1965-04-23 | mother@fake.com
(5 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Angelica', 'Torres', '965 Mother st.', '1964_02_20', 'othermother@fake.com');
INSERT 0 1
rolodex=# select * from persons
;
 id | given_name | family_name |     address      |    dob     |         email
----+------------+-------------+------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street  | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.    | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st. | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.    | 1988-12-27 | Julyanna@fake.com
  5 | Bonita     | Baruah      | 964 Mother st.   | 1965-04-23 | mother@fake.com
  6 | Angelica   | Torres      | 965 Mother st.   | 1964-02-20 | othermother@fake.com
(6 rows)

rolodex=# select count(given_name) from persons where given_name= 'Sinha'
rolodex-# ;
 count
-------
     0
(1 row)

rolodex=# select count(family_name) from persons where family_name= 'Sinha'
;
 count
-------
     2
(1 row)

rolodex=# select count(family_name) from persons where family_name= 'Pena';
 count
-------
     2
(1 row)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Carlos', 'Pena', '123 Sunshine Ave.', '1987-11-30', 'bullied@fake.com');
INSERT 0 1
rolodex=# select count(family_name) from persons where family_name= 'Pena';
 count
-------
     3
(1 row)

rolodex=# select * from persons
;
 id | given_name | family_name |      address      |    dob     |         email
----+------------+-------------+-------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street   | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.     | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st.  | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.     | 1988-12-27 | Julyanna@fake.com
  5 | Bonita     | Baruah      | 964 Mother st.    | 1965-04-23 | mother@fake.com
  6 | Angelica   | Torres      | 965 Mother st.    | 1964-02-20 | othermother@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave. | 1987-11-30 | bullied@fake.com
(7 rows)

rolodex=# INSERT INTO persons (given_name, family_name, address, dob, email)
VALUES ('Mrinalini', 'Sinha', '123 Blackhole Ave.', '1993-02-05', 'bully@fake.com');
INSERT 0 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street    | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.      | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st.   | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.      | 1988-12-27 | Julyanna@fake.com
  5 | Bonita     | Baruah      | 964 Mother st.     | 1965-04-23 | mother@fake.com
  6 | Angelica   | Torres      | 965 Mother st.     | 1964-02-20 | othermother@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
(8 rows)

rolodex=# update persons set family_name = 'Sinha' where family_name = 'Baruah'
rolodex-# ;
UPDATE 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street    | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.      | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st.   | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.      | 1988-12-27 | Julyanna@fake.com
  6 | Angelica   | Torres      | 965 Mother st.     | 1964-02-20 | othermother@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  5 | Bonita     | Sinha       | 964 Mother st.     | 1965-04-23 | mother@fake.com
(8 rows)

rolodex=# update persons set family_name = 'Pena' where family_name = 'Torres'
;
UPDATE 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street    | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.      | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st.   | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.      | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  5 | Bonita     | Sinha       | 964 Mother st.     | 1965-04-23 | mother@fake.com
  6 | Angelica   | Pena        | 965 Mother st.     | 1964-02-20 | othermother@fake.com
(8 rows)

rolodex=# update persons set family_name = 'Baruah' where given_name = 'Bonita'
;
UPDATE 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 UCSD street    | 1998-08-29 | anyas@learn.com
  2 | Lucy       | Pena        | 123 risco st.      | 1983-12-21 | lucy@fake.com
  3 | Barun      | Sinha       | 123 Musician st.   | 1995-08-04 | browniepants@fake.com
  4 | Julyanna   | Pena        | 321 Other st.      | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  6 | Angelica   | Pena        | 965 Mother st.     | 1964-02-20 | othermother@fake.com
  5 | Bonita     | Baruah      | 964 Mother st.     | 1965-04-23 | mother@fake.com
(8 rows)

rolodex=# update persons set address = '123 Blackhole Ave.' where given_name = 'Sinha' AND given_name = 'Baruah'
;
UPDATE 0
rolodex=# update persons set address = '123 Blackhole Ave.' where given_name = 'Sinha'           ;
UPDATE 0
rolodex=# update persons set address = '123 Blackhole Ave.' where family_name = 'Sinha' AND family_name = 'Baruah';
UPDATE 0
rolodex=# update persons set address = '123 Blackhole Ave.' where family_name = 'Sinha';
UPDATE 3
rolodex=# update persons set address = '123 Blackhole Ave.' where family_name = 'Baruah';
UPDATE 1
rolodex=# select * from persons                                                                  ;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  2 | Lucy       | Pena        | 123 risco st.      | 1983-12-21 | lucy@fake.com
  4 | Julyanna   | Pena        | 321 Other st.      | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  6 | Angelica   | Pena        | 965 Mother st.     | 1964-02-20 | othermother@fake.com
  1 | Anya       | Sinha       | 123 Blackhole Ave. | 1998-08-29 | anyas@learn.com
  3 | Barun      | Sinha       | 123 Blackhole Ave. | 1995-08-04 | browniepants@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  5 | Bonita     | Baruah      | 123 Blackhole Ave. | 1965-04-23 | mother@fake.com
(8 rows)

rolodex=# update persons set family_name = 'Pena' where given_name = 'Angelica'
;
UPDATE 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  2 | Lucy       | Pena        | 123 risco st.      | 1983-12-21 | lucy@fake.com
  4 | Julyanna   | Pena        | 321 Other st.      | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  1 | Anya       | Sinha       | 123 Blackhole Ave. | 1998-08-29 | anyas@learn.com
  3 | Barun      | Sinha       | 123 Blackhole Ave. | 1995-08-04 | browniepants@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  5 | Bonita     | Baruah      | 123 Blackhole Ave. | 1965-04-23 | mother@fake.com
  6 | Angelica   | Pena        | 965 Mother st.     | 1964-02-20 | othermother@fake.com
(8 rows)

rolodex=# update persons set address = '123 Sunshine Ave.' where family_name = 'Pena';
UPDATE 4
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 Blackhole Ave. | 1998-08-29 | anyas@learn.com
  3 | Barun      | Sinha       | 123 Blackhole Ave. | 1995-08-04 | browniepants@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  5 | Bonita     | Baruah      | 123 Blackhole Ave. | 1965-04-23 | mother@fake.com
  2 | Lucy       | Pena        | 123 Sunshine Ave.  | 1983-12-21 | lucy@fake.com
  4 | Julyanna   | Pena        | 123 Sunshine Ave.  | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  6 | Angelica   | Pena        | 123 Sunshine Ave.  | 1964-02-20 | othermother@fake.com
(8 rows)

rolodex=# update persons set family_name = 'Torres' where given_name = 'Angelica'
;
UPDATE 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 Blackhole Ave. | 1998-08-29 | anyas@learn.com
  3 | Barun      | Sinha       | 123 Blackhole Ave. | 1995-08-04 | browniepants@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  5 | Bonita     | Baruah      | 123 Blackhole Ave. | 1965-04-23 | mother@fake.com
  2 | Lucy       | Pena        | 123 Sunshine Ave.  | 1983-12-21 | lucy@fake.com
  4 | Julyanna   | Pena        | 123 Sunshine Ave.  | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  6 | Angelica   | Torres      | 123 Sunshine Ave.  | 1964-02-20 | othermother@fake.com
(8 rows)

rolodex=# delete from persons where family_name = 'Baruah'
rolodex-# ;
DELETE 1
rolodex=# select * from persons
;
 id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
  1 | Anya       | Sinha       | 123 Blackhole Ave. | 1998-08-29 | anyas@learn.com
  3 | Barun      | Sinha       | 123 Blackhole Ave. | 1995-08-04 | browniepants@fake.com
  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
  2 | Lucy       | Pena        | 123 Sunshine Ave.  | 1983-12-21 | lucy@fake.com
  4 | Julyanna   | Pena        | 123 Sunshine Ave.  | 1988-12-27 | Julyanna@fake.com
  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
  6 | Angelica   | Torres      | 123 Sunshine Ave.  | 1964-02-20 | othermother@fake.com
(7 rows)

rolodex=# delete from persons where family_name = 'Torres'
;
DELETE 1
rolodex=# select * from persons
;
 --id | given_name | family_name |      address       |    dob     |         email
----+------------+-------------+--------------------+------------+-----------------------
--  1 | Anya       | Sinha       | 123 Blackhole Ave. | 1998-08-29 | anyas@learn.com
--  3 | Barun      | Sinha       | 123 Blackhole Ave. | 1995-08-04 | browniepants@fake.com
--  8 | Mrinalini  | Sinha       | 123 Blackhole Ave. | 1993-02-05 | bully@fake.com
--  2 | Lucy       | Pena        | 123 Sunshine Ave.  | 1983-12-21 | lucy@fake.com
--  4 | Julyanna   | Pena        | 123 Sunshine Ave.  | 1988-12-27 | Julyanna@fake.com
--  7 | Carlos     | Pena        | 123 Sunshine Ave.  | 1987-11-30 | bullied@fake.com
--(6 rows)
