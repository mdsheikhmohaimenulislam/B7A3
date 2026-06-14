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

CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(300) not null,
    tournament_category varchar(200) not null,
    base_ticket_price decimal(10,2) not null,
    match_status varchar(200) not null,

    check(match_status in ('Available','Selling Fast','Sold Out','Postponed'))
);


CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id int not null references users (user_id),
    match_id int not null references matches (match_id),
    seat_number varchar(30),
    payment_status varchar(50),
    total_cost decimal(10,2) not null,
    
    check(payment_status in ('Pending','Confirmed','Cancelled','Refunded')),
    check(total_cost >= 0) 
);