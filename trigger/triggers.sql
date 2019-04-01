/*Trigger for allocating room to customer after booking*/
drop trigger if exists allot_room;
DELIMITER $$
create trigger allot_room
before insert on booking for each row
begin 
	update room set occupied='YES' where room.room_no=NEW.room_no;
end$$
DELIMITER ;


/*Trigger for deallote room */
drop trigger if exists vacate_room;
DELIMITER $$
create trigger vacate_room
before delete on booking for each row
begin 
	update room set occupied='NO' where room.room_no=old.room_no;
end$$
DELIMITER ;

/*Trigger for non-availability of room*/
drop trigger if exists room_not_avail;
DELIMITER $$
create trigger room_not_avail
before insert on booking for each row
begin 
        declare no_of_room integer;
	select count(occupied) into no_of_room from room where occupied='NO';
	if no_of_room=0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT='ERROR:
	  room not available';
        end if;
end$$
DELIMITER ;

/*Trigger for feed_back*/

drop trigger if exists give_feedback;
DELIMITER $$
create trigger give_feedback
before insert on feed_back for each row
begin 
        declare id char(20);
        set id=NEW.customer_id;
        if id not in (select customer_id from customer ) then
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT='ERROR:
	  not a valid customer';
        end if;
end$$
DELIMITER ;


