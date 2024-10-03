--TASK 3 Q1
SELECT event_name,AVG(ticket_price) as average_ticket_price  from Event
group by event_name

select * from Event


--TASK 3 Q2
--total revenue = num_ticket * ticket_price 
SELECT
  E.event_name,
    SUM(B.total_cost) AS total_revenue
FROM 
    Booking B
JOIN 
    Event E ON B.event_id = E.event_id
GROUP BY 
    E.event_name;


--Task 3  Q3

SELECT TOP 1
    E.event_name,
    SUM(B.num_tickets) AS total_tickets_sold
FROM 
    Booking B
JOIN 
    Event E ON B.event_id = E.event_id
GROUP BY 
    E.event_name
ORDER BY 
    total_tickets_sold DESC;


--TASK 3 Q4

SELECT 
    E.event_name,
    SUM(B.num_tickets) AS total_tickets_sold
FROM 
    Booking B
JOIN 
    Event E ON B.event_id = E.event_id
GROUP BY 
    E.event_name


--TASK 3 Q5
SELECT 
    E.event_name,
    E.ticket_price
FROM 
    Event E
LEFT JOIN 
    Booking B ON E.event_id = B.event_id
WHERE 
    B.booking_id IS NULL;

--TASK 3 Q6
Select TOP  1
	customer_name, 
	email,
	B.num_tickets
from 
	Customer C 
Join Booking B on B.customer_id = C.customer_id
Order By num_tickets desc


--Task 3 Q7

SELECT 
    E.event_name,
    DATEPART(YEAR, B.booking_date) AS year,
    DATEPART(MONTH, B.booking_date) AS month,
    SUM(B.num_tickets) AS total_tickets_sold
FROM 
    Booking B
JOIN 
    Event E ON B.event_id = E.event_id
GROUP BY 
    E.event_name,
    DATEPART(YEAR, B.booking_date),
    DATEPART(MONTH, B.booking_date)
ORDER BY 
    year, month;

--task 3 Q8
SELECT 
    v.venue_id,
    v.venue_name,
    AVG(e.ticket_price) AS average_ticket_price
FROM 
    Venu v
JOIN 
    Event e ON v.venue_id = e.venue_id
GROUP BY 
    v.venue_id, v.venue_name;

--task 3 Q9

SELECT 
    e.event_type,
    SUM(b.num_tickets) AS total_tickets_sold
FROM 
    Event e
JOIN 
    Booking b ON e.event_id = b.event_id
GROUP BY 
    e.event_type;

--task 3 Q10

SELECT 
    YEAR(e.event_date) AS event_year,
    SUM(b.num_tickets * e.ticket_price) AS total_revenue
FROM 
    Event e
JOIN 
    Booking b ON e.event_id = b.event_id
GROUP BY 
    YEAR(e.event_date)
ORDER BY 
    event_year;


--task 3  Q11
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(b.event_id) AS number_of_events_booked
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    COUNT(b.event_id) > 1;


--task 3 Q12

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(b.total_cost) AS total_revenue
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
JOIN 
    Event e ON b.event_id = e.event_id
GROUP BY 
    c.customer_id, c.customer_name
ORDER BY 
    total_revenue DESC;

--task 3 Q13

SELECT 
    e.event_type,
    v.venue_name,
    AVG(e.ticket_price) AS average_ticket_price
FROM 
    Event e
JOIN 
    Venu v ON e.venue_id = v.venue_id
GROUP BY 
    e.event_type, v.venue_name
ORDER BY 
    e.event_type, v.venue_name;


--task 3 Q14

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(b.num_tickets) AS total_tickets_purchased
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
WHERE 
    b.booking_date >= DATEADD(DAY, -30, GETDATE()) 
GROUP BY 
    c.customer_id, c.customer_name
ORDER BY 
    total_tickets_purchased DESC;

