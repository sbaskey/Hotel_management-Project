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

drop procedure if exists check_room_reserve;
delimiter $$
create procedure check_room_reserve(in hot_id varchar(20),in type varchar(10),in startdate DATE,in enddate DATE)  

returns int
deterministic
begin
declare cnt int;
declare cnt1 int;
select check_room_avail(hot_id,type) into cnt;
select count(*) into cnt1 from reservation where reservation.room_type=type
and start not in between reservation.start_date and reservation.end_date or 
enddate not in between reservation.start_date and reservation.end_date;
if cnt=cnt1 
end if;
return 1;
end;$$
delimiter ;
