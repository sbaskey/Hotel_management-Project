drop procedure if exists room_availaible;
delimiter $$
create procedure room_availaible(in indate DATE,in outdate DATE)
begin
declare x DATE;
if indate<'2001-1-1' and indate>'2000-3-6'then 
select *from student;
end if;
end;$$
delimiter ;