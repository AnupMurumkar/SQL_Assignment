--Task 2  Q1
 INSERT INTO Venu (venue_name, address)
VALUES 
('Royal Theater', '123 Broadway St, New York, NY'),
('Concert Hall', '456 Music Ave, Los Angeles, CA'),
('Cineplex Cinema', '789 Movie Rd, Chicago, IL'),
('Stadium 1', '101 Sports Blvd, Houston, TX'),
('ArtHouse Playhouse', '202 Theatre Ln, San Francisco, CA'),
('Arena Sports', '303 Arena Ave, Miami, FL'),
('City Concert Hall', '404 Concert St, Dallas, TX'),
('Outdoor Theatre', '505 Greenway St, Seattle, WA'),
('Multiplex 9', '606 Cinema Dr, Boston, MA'),
('Downtown Hall', '707 Center Rd, Atlanta, GA');


INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id)
VALUES 
('Avengers: Endgame', '2024-10-01', '19:00', 3, 200, 180, 1250, 'Movie', NULL),
('Coldplay Concert', '2024-10-05', '20:00', 2, 50000, 450, 1500, 'Concert', NULL),
('Football Championship', '2024-10-07', '18:00', 4, 600, 500, 7500, 'Sports', NULL),
('Hamlet Play', '2024-10-10', '19:30', 5, 150, 0, 500, 'Movie', NULL),
('Local Band Performance', '2024-10-15', '21:00', 6, 300, 0, 2500, 'Concert', NULL),
('Worldcup Finals', '2024-10-20', '18:00', 7, 80000, 0, 3000, 'Sports', NULL),
('Shakespeare in the Park', '2024-10-22', '17:00', 8, 100, 90, 350, 'Movie', NULL),
('Jazz Night', '2024-10-25', '20:30', 9, 200, 180, 400, 'Concert', NULL),
('Soccer League Match', '2024-10-28', '18:00', 10, 60000, 500, 7000, 'Sports', NULL),
('The Lion King', '2024-10-30', '19:00', 1, 250, 200, 600, 'Movie', NULL);


INSERT INTO Customer (customer_name, email, phone_number, booking_id)
VALUES 
('John Doe', 'john.doe@example.com', '123-456-7890', NULL),
('Jane Smith', 'jane.smith@example.com', '123-456-7891', NULL),
('Robert Brown', 'robert.brown@example.com', '123-456-7892', NULL),
('Emily White', 'emily.white@example.com', '123-456-7893', NULL),
('Michael Green', 'michael.green@example.com', '123-456-7894', NULL),
('Sarah Black', 'sarah.black@example.com', '123-456-7895', NULL),
('David Blue', 'david.blue@example.com', '123-456-0000', NULL),
('Sophia Red', 'sophia.red@example.com', '123-456-7897', NULL),
('James Gray', 'james.gray@example.com', '123-456-7898', NULL),
('Olivia Pink', 'olivia.pink@example.com', '123-466-0000', NULL);

INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date)
VALUES 
(1, 1, 2, 25.00, '2024-09-25'),
(2, 2, 3, 450.00, '2024-09-26'),
(3, 3, 4, 300.00, '2024-09-27'),
(4, 4, 2, 100.00, '2024-09-28'),
(5, 5, 1, 25.00, '2024-09-28'),
(6, 6, 5, 400.00, '2024-09-29'),
(7, 7, 3, 105.00, '2024-09-30'),
(8, 8, 2, 80.00, '2024-09-30'),
(9, 9, 4, 280.00, '2024-10-01'),
(10, 10, 3, 180.00, '2024-10-02');


UPDATE Customer
SET booking_id = (SELECT booking_id FROM Booking WHERE Booking.customer_id = Customer.customer_id);

-- Update booking_id in Event table
UPDATE Event
SET booking_id = (SELECT booking_id FROM Booking WHERE Booking.event_id = Event.event_id);



--task 2 Q2  
SELECT *FROM Event E

--Task 2  Q3 

SELECT *FROM Event E
WHERE 
    E.available_seats > 0;


-- Task 2 Q4

select * from Event
where event_name LIKE '%cup%';


-- Task 2 Q5

SELECT *FROM Event
WHERE 
    ticket_price BETWEEN 1000 AND 2500;

--Task 2 Q6

Select * from Event
where event_date between '2024-10-1' and '2024-10-20'

--Task 2 Q7

Select * from Event
where event_name LIKE '%Concert%' and available_seats > 0;

-- task 2 Q8
SELECT * FROM Customer
ORDER BY 
    customer_id
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

--task 2 Q9

select * from Booking
where num_tickets > 4;


--task 2 Q10

Select  * from Customer
where phone_number Like '%000'


--Task 2 Q11

Select * from Event 
where total_seats > 15000
order by total_seats

--task 2 Q12
Select * from Event
where event_name  Not Like 'x%' and  event_name  Not Like 'y%' and  event_name  Not Like 'z%'

