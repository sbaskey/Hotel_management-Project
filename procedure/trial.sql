drop procedure if exists room_availaible;
delimiter $$
create procedure room_availaible(in d DATE,in dat DATE)
begin
declare x DATE;
if d>'2008-10-10' then 
select *from hotel;
end if;
end;$$
delimiter ;
