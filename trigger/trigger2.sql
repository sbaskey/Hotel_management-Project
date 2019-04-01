/*Trigger for check in after booking*/
drop trigger if exists checkin_room;
DELIMITER $$
create trigger checkin_room
before insert on booking for each row
begin 
    insert into stays values(NEW.customer_id,NEW.booking_date,NULL,NEW.hotel_id,NEW.room_no);
end$$
DELIMITER ;




