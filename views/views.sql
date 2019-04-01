
DROP VIEW IF EXISTS room_available;
DROP VIEW IF EXISTS review;


create view room_available as
select room_no, hotel_name, occupied, hotel_addres
from room, hotel
where room.hotel_id=hotel.hotel_id;

create view reviews as 
select hotel_name,review,rating
from hotel, feed_back
where hotel.hotel_id=feed_back.hotel_id;
