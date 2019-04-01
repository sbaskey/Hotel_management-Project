/* stays table */
create table stays (customer_id varchar(10) not null,
check_in datetime not null, 
check_out date default null,
hotel_id varchar(10) not null,
room_no varchar(10) not null,
primary key(customer_id, check_in, check_out, hotel_id, room_no),
CONSTRAINT stays_ibfk_1 FOREIGN KEY (hotel_id,room_no) REFERENCES room (hotel_id,room_no) ON DELETE CASCADE,
CONSTRAINT stays_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

