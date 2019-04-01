drop user cust;
create user cust identified by "customer";
grant select on customer to cust;
grant select on hotel to cust;
grant select on room to cust;
grant select on feed_back to cust;
grant select on facility to cust;


