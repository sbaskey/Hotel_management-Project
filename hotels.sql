DROP TABLE IF EXISTS stays;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS hotel;
DROP TABLE IF EXISTS facility;
DROP TABLE IF EXISTS customer;

/* hotel table */
create table hotel (hotel_id varchar(10) not null,
hotel_name varchar(50) not null,
hotel_desc varchar(100) not null,
hotel_city varchar(20) not null,
hotel_addres varchar(100) not null,
primary key(hotel_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* facility table */
create table facility (facility_id varchar(10) not null,
facility_name varchar(20) not null, 
facility_type varchar(20) not null,
facility_desc varchar(100) not null,
hotel_id varchar(10) not null,
room_no varchar(10) not null,
CONSTRAINT hotel_ibfk_1 FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id) ON DELETE CASCADE,
primary key(facility_id,hotel_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* room table */
create table room (room_no varchar(5) not null,
hotel_id varchar(10) not null,
facility_id varchar(10) not null, 
room_type varchar(10) not null,
room_rent varchar(10) not null,
room_desc varchar(100) not null,
occupied varchar(3) not null,
primary key(hotel_id,room_no),
CONSTRAINT room_ibfk_1 FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id) ON DELETE CASCADE,
CONSTRAINT room_ibfk_2 FOREIGN KEY (facility_id) REFERENCES facility (facility_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*  customer table */
create table customer (customer_id varchar(10) not null,
customer_name varchar(30) not null, 
customer_mobile varchar(12) not null,
customer_email varchar(40) not null,
customer_address varchar(50) not null,
passwd varchar (10) not null,
primary key(customer_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* booking table */
create table booking (booking_id varchar(10) not null,
hotel_id varchar(10) not null,
room_no varchar(10),
customer_id varchar(10) not null,
booking_type varchar(10) not null,
booking_date datetime not null,
primary key(booking_id),
CONSTRAINT booking_ibfk_1 FOREIGN KEY (hotel_id,room_no) REFERENCES room (hotel_id,room_no) ON DELETE CASCADE,
CONSTRAINT booking_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* payment table */
create table payment (payment_id varchar(10) not null,
booking_id varchar(10) not null,
payment_date datetime not null, 
payment_amount decimal(8,0) not null,
payment_desc varchar(100) not null,
primary key(payment_id),
CONSTRAINT payment_ibfk_1 FOREIGN KEY (booking_id) REFERENCES booking (booking_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* employee table */
create table employee (emp_id varchar(10) not null,
hotel_id varchar(10) not null,
emp_name varchar(20) not null, 
emp_contact varchar(12) not null,
emp_salary varchar(10) not null,
emp_address varchar(50) not null,
emp_role varchar (100) not null,
primary key(emp_id),
CONSTRAINT employee_ibfk_1 FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* stays table */
create table stays (customer_id varchar(10) not null,
check_in datetime not null, 
check_out datetime not null,
hotel_id varchar(10) not null,
room_no varchar(10) not null,
primary key(customer_id, check_in, check_out, hotel_id, room_no),
CONSTRAINT stays_ibfk_1 FOREIGN KEY (hotel_id,room_no) REFERENCES room (hotel_id,room_no) ON DELETE CASCADE,
CONSTRAINT stays_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

