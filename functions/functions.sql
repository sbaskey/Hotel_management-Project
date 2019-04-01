
/*Function to count the no. of available rooms in a given hotel*/

drop function if exists no_room_avail;
DELIMITER $$
create function no_room_avail(name varchar(20)) 
returns int
deterministic
begin 
declare cnt_room int;
select count(*) into cnt_room
from room natural join hotel
where hotel_name=name and occupied='NO';
return cnt_room;
end; $$
DELIMITER ;


/*Function for calculating average rating of a hotel*/
drop function if exists avg_rating;
DELIMITER $$
create function avg_rating(id varchar(10))
returns decimal(10,2)
deterministic
begin
declare avg_rate decimal(10,2);
	select avg(rating) into avg_rate
	from feed_back where hotel_id=id;
return avg_rate;
end; $$
DELIMITER ;


/*Function to Count number of hotels in a particular city.*/

drop function if exists num_hotels_city;
delimiter $$
create function num_hotels_city(city varchar(20))
returns int
deterministic
begin
declare cnt_hotel int;
select count(*) into cnt_hotel
from hotel where hotel_city = city;
return cnt_hotel;
end;$$
delimiter ;


/*Function to Count number of employees working in a hotel*/

drop function if exists num_employe;
delimiter $$
create function num_employe(name varchar(20))
returns int
deterministic
begin
declare cnt_emp int;
select count(*) into cnt_emp
from employee natural join hotel
where hotel_name = name;
return cnt_emp;
end;$$
delimiter ;


drop function if exists check_room_avail;
delimiter $$
create function check_room_avail(hot_id varchar(20),type varchar(10))  
returns int
deterministic
begin
declare cnt int;
select count(*) into cnt from hotel natural join room where hotel_id=hot_id
and room.occupied="NO" and room.room_type=type;
return cnt;
end;$$
delimiter ;

