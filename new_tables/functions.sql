
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


