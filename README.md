# ⚽ Football Ticket Booking System - Database Design

## 📌 Overview

This project demonstrates a simplified Football Ticket Booking System using relational database design and ERD concepts. It focuses on how users book tickets for football matches and how the system manages bookings efficiently.

---

## 🎯 Objectives

- Design relational database schema
- Understand ERD relationships (1–M, M–1)
- Use Primary Key and Foreign Key concepts
- Model real-world booking system structure

---

## 🧠 Business Logic

The system includes three main entities:

- Users (Football fans & Ticket managers)
- Matches (Football fixtures)
- Bookings (Ticket reservations)

A single user can make multiple bookings, and each match can have multiple bookings.

---

# 🗄️ Database Tables

---

## 1. Users Table

| Field        | Description    |
| ------------ | -------------- |
| user_id      | Unique ID      |
| full_name    | User name      |
| email        | Login email    |
| role         | User role      |
| phone_number | Contact number |

---

## 2. Matches Table

| Field               | Description         |
| ------------------- | ------------------- |
| match_id            | Unique match ID     |
| fixture             | Teams playing       |
| tournament_category | League name         |
| base_ticket_price   | Ticket price        |
| match_status        | Availability status |

---

## 3. Bookings Table

| Field          | Description           |
| -------------- | --------------------- |
| booking_id     | Unique booking ID     |
| user_id        | Foreign key (Users)   |
| match_id       | Foreign key (Matches) |
| seat_number    | Seat number           |
| payment_status | Payment status        |
| total_cost     | Final price           |

---

# 🔗 ERD Relationships

- One User → Many Bookings
- One Match → Many Bookings
- Each Booking belongs to:
  - One User
  - One Match

### ERD Requirements:

- Primary Keys (PK)
- Foreign Keys (FK)
- Crow’s Foot notation

---

# 📊 Sample Data

## Users

| user_id | full_name     | email           | role           | phone_number   |
| ------- | ------------- | --------------- | -------------- | -------------- |
| 1       | Tanvir Rahman | tanvir@mail.com | Football Fan   | +8801711111111 |
| 2       | Asif Haque    | asif@mail.com   | Football Fan   | +8801722222222 |
| 3       | Sajjad Rahman | sajjad@mail.com | Ticket Manager | +8801733333333 |
| 4       | Jannat Ara    | jannat@mail.com | Football Fan   | NULL           |

---

## Matches

| match_id | fixture                  | tournament_category | base_ticket_price | match_status |
| -------- | ------------------------ | ------------------- | ----------------- | ------------ |
| 101      | Real Madrid vs Barcelona | Champions League    | 150               | Available    |
| 102      | Man City vs Liverpool    | Premier League      | 120               | Selling Fast |
| 103      | Bayern Munich vs PSG     | Champions League    | 130               | Available    |
| 104      | AC Milan vs Inter Milan  | Serie A             | 90                | Sold Out     |
| 105      | Juventus vs Roma         | Serie A             | 80                | Available    |

---

## Bookings

| booking_id | user_id | match_id | seat_number | payment_status | total_cost |
| ---------- | ------- | -------- | ----------- | -------------- | ---------- |
| 501        | 1       | 101      | A-12        | Confirmed      | 150        |
| 502        | 1       | 102      | B-04        | Confirmed      | 120        |
| 503        | 2       | 101      | A-13        | Confirmed      | 150        |
| 504        | 2       | 101      | NULL        | NULL           | 150        |
| 505        | 3       | 102      | C-20        | Pending        | 120        |

---
---

# 🧾 SQL QUERIES

---
---

# 🗂️ 2. QUERY.sql (FILE)

```sql


-- Query 1
SELECT match_id, fixture, base_ticket_price
FROM Matches
WHERE tournament_category = 'Champions League'
AND match_status = 'Available';

-- Query 2
SELECT user_id, full_name, email
FROM Users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';

-- Query 3
SELECT booking_id,
       user_id,
       match_id,
       COALESCE(payment_status, 'Action Required') AS systematic_status
FROM Bookings
WHERE payment_status IS NULL;

-- Query 4
SELECT b.booking_id, u.full_name, m.fixture, b.total_cost
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Matches m ON b.match_id = m.match_id;

-- Query 5
SELECT u.user_id, u.full_name, b.booking_id
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id;

-- Query 6
SELECT booking_id, match_id, total_cost
FROM Bookings
WHERE total_cost > (
    SELECT AVG(total_cost) FROM Bookings
);

-- Query 7
SELECT match_id, fixture, base_ticket_price
FROM Matches
ORDER BY base_ticket_price DESC
OFFSET 1
LIMIT 2;
```
# 🚀 Conclusion

This project demonstrates how a real-world football ticket booking system can be structured using relational database design principles.


## 👨‍💻 Author
This project was developed as part of a database design assignment.

## 📌 Note
This is an academic project for learning purposes only.