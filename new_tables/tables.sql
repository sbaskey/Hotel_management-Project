DROP TABLE IF EXISTS reservation;

DROP TABLE IF EXISTS bill;
DROP TABLE IF EXISTS cab;

DROP TABLE IF EXISTS food_order;
DROP TABLE IF EXISTS food_service;
DROP TABLE IF EXISTS vehicle_rent;


create table food_service(
customer_id varchar(10) not null,
food_service_id varchar(20) not null,
time_date datetime not null,
price int not null,
primary key(customer_id),
constraint foreign key f(customer_id) references customer (customer_id) on DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


create table food_order(
customer_id varchar(20) not null,
food varchar(30) not null,
quantity int   not null,
price int not null,
primary key(customer_id),
constraint foreign key(customer_id) references customer (customer_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


create table vehicle_rent(
customer_id varchar(10) not null,
time_date datetime not null,
vechicle_type varchar(20) not null,
vehicle_num varchar(20) not null,
charge_per_hour int not null,
primary key(customer_id,time_date),
constraint foreign key(customer_id) references customer (customer_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


create table cab(
customer_id varchar(10),
cab_type varchar(20),
booking_date DATE not null,
charge_per_distance int not null,
distance int not null,
primary key(customer_id,booking_date),
constraint foreign key(customer_id) references customer (customer_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

create table bill(
customer_id varchar(10) not null,
service_name varchar(20) not null,
total_bill int not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;







DROP TABLE IF EXISTS feed_back;
create table feed_back
(customer_id varchar(10) not null,
hotel_id varchar(10),
feed_back_date varchar(12) not null,
rating int,
review varchar(200),
primary key(customer_id,feed_back_date),
FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

