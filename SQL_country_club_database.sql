rolodex=# CREATE DATABASE club_members;
CREATE DATABASE
rolodex=# \c club_members;
You are now connected to database "club_members" as user "learn".
club_members=# drop database rolodex
club_members-# ;
DROP DATABASE
club_members=# clear
club_members-# ^C
club_members=# CREATE TABLE members (
club_members(#   id serial PRIMARY KEY,
club_members(#   surname varchar,
club_members(#   first_name varchar,
club_members(#   address varchar,
club_members(#   zipcode integer,
club_members(#   telephone varchar,
club_members(#   recommended_by integer REFERENCES members(id),
club_members(#   join_date timestamp without time zone
club_members(#   );
CREATE TABLE
club_members=# select * from members
club_members-# ;
 id | surname | first_name | address | zipcode | telephone | recommended_by | join_date
----+---------+------------+---------+---------+-----------+----------------+-----------
(0 rows)

club_members=# CREATE TABLE facilities (
club_members(#   id serial PRIMARY KEY,
club_members(#   name varchar,
club_members(#   members_cost numeric,
club_members(#   guest_cost numeric,
club_members(#   initial_out_lay numeric,
club_members(#   monthly_maintenance numeric);
CREATE TABLE
club_members=# select * from facilities
;
 id | name | members_cost | guest_cost | initial_out_lay | monthly_maintenance
----+------+--------------+------------+-----------------+---------------------
(0 rows)

club_members=# CREATE TABLE bookings (
club_members(#     id serial PRIMARY KEY,
club_members(#     facility_id integer REFERENCES facilities(id),
club_members(#     member_id integer REFERENCES members(id),
club_members(#     start_time timestamp,
club_members(#     slots integer);
CREATE TABLE
club_members=# select * from facilities
;
 id | name | members_cost | guest_cost | initial_out_lay | monthly_maintenance
----+------+--------------+------------+-----------------+---------------------
(0 rows)

club_members=# select * from bookings
;
 id | facility_id | member_id | start_time | slots
----+-------------+-----------+------------+-------
(0 rows)


--Produce a list of start times for bookings by members named 'David Farrell'?

select b.start_time from members m JOIN bookings b ON (m.id = b.member_id) JOIN facilities f ON (f.id = b.facility_id) where m.first_name = 'David' AND m.surname = 'Farrell';

--Produce a list of the start times for bookings for tennis courts, for the date '2016-09-21'? Return a list of start time and facility name pairings, ordered by the time.

select b.start_time AS start, f.name AS name
from
members m JOIN
bookings b ON (m.id = b.member_id) JOIN
facilities f ON (f.id = b.facility_id)
WHERE b.start_time in
  (select start_time from bookings where start_time between '2016-09-21 00:00:00' and '2016-09-21 23:59:59')
AND f.name like '%Tennis Court%';

--Produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as first name, surname. Ensure no duplicate data, and order by the first name.

select distinct m.first_name, m.surname, f.name
from
members m JOIN
bookings b ON (m.id = b.member_id) JOIN
facilities f ON (f.id = b.facility_id)
where f.name in
(select name from facilities where name like '%Tennis Court%')
and b.member_id = m.id
order by m.first_name;

--Produce a number of how many times Nancy Dare has used the pool table facility?

select m.first_name, m.surname, f.name, count(f.name) as times_visited
from
members m JOIN
bookings b ON (m.id = b.member_id) JOIN
facilities f ON (f.id = b.facility_id)
where
b.member_id = m.id and m.first_name = 'Nancy' and m.surname = 'Dare' and f.name like '%Pool%'
group by
m.first_name, m.surname, f.name;

--Produce a list of how many times Nancy Dare has visited each country club facility.
select m.first_name, m.surname, f.name, count(f.name) as times_visited
from
members m JOIN
bookings b ON (m.id = b.member_id) JOIN
facilities f ON (f.id = b.facility_id)
where
b.member_id = m.id and m.first_name = 'Nancy' and m.surname = 'Dare'
group by
m.first_name, m.surname, f.name
order by
times_visited desc;

--Produce a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
select distinct mem.first_name, mem.surname
from members mem
  JOIN members rec
    ON (rec.recommended_by = mem.id)
--where mem.recommended_by in
--    (select recommended_by from members where not --recommended_by is NULL) -- This part makes sure not to add in any member who was not recommended by another member// doesn't include the very first member
order by mem.surname;

--Output a list of all members, including the individual who recommended them (if any), without using any JOINs? Ensure that there are no duplicates in the list, and that member is formatted as one column and ordered by member.

select distinct mem.first_name || ' ' || mem.surname AS member,
  (select rec.first_name || ' ' || rec.surname as recommender
    from members rec
      where rec.id = mem.recommended_by )
from members mem
order by member;
