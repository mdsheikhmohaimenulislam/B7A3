create database Football_Ticket_Booking_System

CREATE TABLE Users (
    user_id serial,
    full_name varchar(100) not null,
    email varchar(250) not null,
    role varchar(150) default 'Football Fan',
    phone_number varchar(20),

   primary key(user_id),
   unique(email),
   check(role in ('Ticket Manager','Football Fan'))
);