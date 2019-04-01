drop role if exists customer_role;
create role customer_role;
grant select on feed_back to customer_role;
grant select on room to customer_role;
grant select on hotel to customer_role;
grant select on bill to customer_role;
grant select on cab to customer_role;
grant select on vehicle_rent to customer_role;
grant select on facility to customer_role;
grant select on booking to customer_role;
grant select on food_order to customer_role;
grant select on food_service to customer_role;

set role customer_role;













