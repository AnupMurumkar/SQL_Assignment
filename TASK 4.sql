use TicketBookingSystem
go

--TASK 4 Q1
SELECT 
    venue_id,
    (SELECT AVG(ticket_price) 
     FROM Event e 
     WHERE e.venue_id = v.venue_id) AS avg_ticket_price
FROM Venu v;


--TASK 4 Q2
SELECT event_id, event_name, total_seats, available_seats, 
       (total_seats - available_seats) AS tickets_sold
FROM Event
WHERE (total_seats - available_seats) > 
      (SELECT 0.5 * total_seats FROM Event e WHERE e.event_id = Event.event_id);


--TASK 4 Q3
SELECT event_id, event_name, 
       (SELECT total_seats - available_seats 
        FROM Event e 
        WHERE e.event_id = Event.event_id) AS tickets_sold
FROM Event;


-- TASK 4 Q4
SELECT *
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Booking b
    WHERE b.customer_id = c.customer_id
);

--TASK 4 Q5

SELECT *
FROM Event e
WHERE e.event_id NOT IN (
    SELECT b.event_id
    FROM Booking b
);

--TASK 4 Q6

SELECT 
    event_type,
    SUM(num_tickets) AS total_tickets_sold
FROM 
    (SELECT 
         e.event_type,
         b.num_tickets
     FROM 
         Event e
     JOIN 
         Booking b ON e.event_id = b.event_id) AS ticket_sales
GROUP BY 
    event_type;



--TASK 4 Q7
SELECT 
    event_id,
    event_name,
    ticket_price,
    event_type
FROM 
    Event
WHERE 
    ticket_price > (SELECT AVG(ticket_price) FROM Event);

--TASK 4 Q8
SELECT 
    C.customer_id,
    C.customer_name,
    SUM(B.total_cost) AS total_revenue
FROM 
    Customer C
LEFT JOIN 
    Booking B ON C.customer_id = B.customer_id
GROUP BY 
    C.customer_id, C.customer_name;


--TASK 4 Q9

SELECT 
    C.customer_id,
    C.customer_name,
    C.email,
    C.phone_number
FROM 
    Customer C
WHERE 
    C.customer_id IN (
        SELECT B.customer_id
        FROM Booking B
        JOIN Event E ON B.event_id = E.event_id
        WHERE E.venue_id = 4
    );

--TASK 4 Q10
SELECT 
    event_type,
    (SELECT SUM(num_tickets) 
     FROM Booking B 
     JOIN Event E ON B.event_id = E.event_id 
     WHERE E.event_type = ET.event_type) AS total_tickets_sold
FROM 
    (SELECT DISTINCT event_type FROM Event) ET
ORDER BY 
    event_type;


--TASK 4 Q11
SELECT DISTINCT
    C.customer_id,
    C.customer_name,
    FORMAT(B.booking_date, 'MMMM yyyy') AS booking_month
FROM 
    Customer C
JOIN 
    Booking B ON C.customer_id = B.customer_id
WHERE 
    B.event_id IN (
        SELECT E.event_id
        FROM Event E
    )
ORDER BY 
    booking_month;

--TASK 4 Q12
SELECT 
    V.venue_id,
    V.venue_name,
    (SELECT AVG(E.ticket_price)
     FROM Event E
     WHERE E.venue_id = V.venue_id) AS average_ticket_price
FROM 
    Venu V
WHERE 
    EXISTS (SELECT 1 FROM Event E WHERE E.venue_id = V.venue_id) 
ORDER BY 
    V.venue_id;
