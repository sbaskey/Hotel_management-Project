
drop procedure if exists room_avail_budget;
delimiter $$
create procedure room_avail_budget(in low_budget decimal(12,2), in high_budget decimal(12,2), in city varchar(20))  
begin
select distinct hotel_name,hotel_addres,room_no
from hotel natural join room
where room_rent between low_budget and high_budget and hotel_city=city and occupied="NO";
end;$$
delimiter ;




/*  Procedure to select the hotels based on rating values*/

drop procedure if exists rating_hotel;
delimiter $$
create procedure rating_hotel(in rate decimal(10,2))  
begin
select hotel_name from (select avg(rating) as avg_rate,hotel_name from feed_back natural join hotel group by hotel_name) as t1 where rate < avg_rate ;
end;$$
delimiter ;



/*  Procedure to select the hotel from a city*/

drop procedure if exists select_hotel;
delimiter $$
create procedure select_hotel(in city varchar(20))  
begin
select hotel_name,hotel_addres from hotel where hotel_city=city;
end;$$
delimiter ;


drop procedure if exists check_room_avail;
delimiter $$
create procedure check_room_avail(in hot_id varchar(20))  
begin
declare cnt int;
select count(*) into cnt from hotel natural join room where hotel_id=hot_id
and room.occupied="NO";
return cnt;
end;$$
delimiter ;



