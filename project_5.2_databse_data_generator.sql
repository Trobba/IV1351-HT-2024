-- Sample data for person table (Swedish citizens)
INSERT INTO person (ssn, name, email, phone_number, street_adress, zip_code, city)
VALUES
('19900101-1234', 'Erik Johansson', 'erik.johansson@example.se', '+46 70 123 45 67', 'Vasagatan 1', '11120', 'Stockholm'),
('19850215-5678', 'Anna Andersson', 'anna.andersson@example.se', '+46 70 234 56 78', 'Drottninggatan 2', '11121', 'Stockholm'),
('19931211-1357', 'Lars Svensson', 'lars.svensson@example.se', '+46 70 345 67 89', 'Sveavägen 3', '11122', 'Stockholm'),
('19900719-2468', 'Karin Eriksson', 'karin.eriksson@example.se', '+46 70 456 78 90', 'Birger Jarlsgatan 4', '11123', 'Stockholm'),
('19871125-3690', 'Olof Nilsson', 'olof.nilsson@example.se', '+46 70 567 89 01', 'Götgatan 5', '11124', 'Stockholm'),
('19950110-9876', 'Emma Karlsson', 'emma.karlsson@example.se', '+46 70 678 90 12', 'Folkungagatan 6', '11125', 'Stockholm'),
('19880530-1122', 'Johanna Gustafsson', 'johanna.gustafsson@example.se', '+46 70 789 01 23', 'Hornsgatan 7', '11126', 'Stockholm'),
('19930402-2233', 'Fredrik Pettersson', 'fredrik.pettersson@example.se', '+46 70 890 12 34', 'Torkel Knutssonsgatan 8', '11127', 'Stockholm'),
('19951218-3344', 'Maja Lindberg', 'maja.lindberg@example.se', '+46 70 901 23 45', 'Södermannagatan 9', '11128', 'Stockholm'),
('19821201-4455', 'Anders Johansson', 'anders.johansson@example.se', '+46 70 012 34 56', 'Kungsholmsgatan 10', '11129', 'Stockholm');

-- Sample data for skill_levels_available table (only 3 levels)
INSERT INTO skill_levels_available (skill_level)
VALUES
('Beginner'),
('Intermediate'),
('Advanced');

-- Sample data for student table (20 students)
INSERT INTO student (person_id)
VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

-- Sample data for student_payment table (with bill set to 0)
INSERT INTO student_payment (student_id, bill)
VALUES
(1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0),
(8, 0), (9, 0), (10, 0),(11, 0), (12, 0), (13, 0), (14, 0),
(15, 0), (16, 0), (17, 0), (18, 0), (19, 0), (20, 0);

-- Sample data for time_slot table
INSERT INTO time_slot (start_time, end_time)
VALUES
('2024-11-21 09:00:00', '2024-11-21 10:00:00'),
('2024-11-21 10:00:00', '2024-11-21 11:00:00'),
('2024-11-21 11:00:00', '2024-11-21 12:00:00'),
('2024-11-21 12:00:00', '2024-11-21 13:00:00'),
('2024-11-21 13:00:00', '2024-11-21 14:00:00');

-- Sample data for type_of_instruments table
INSERT INTO type_of_instruments (instrument_type)
VALUES
('Piano'),
('Guitar'),
('Violin'),
('Drums'),
('Flute');

-- Sample data for contact_person table (5 contact people)
INSERT INTO contact_person (person_id, relation_to_student)
VALUES
(1, 'Mother'),
(2, 'Father'),
(3, 'Guardian'),
(4, 'Mother'),
(5, 'Father');

-- Sample data for instructor table (5 instructors)
INSERT INTO instructor (person_id)
VALUES
(6), (7), (8), (9), (10);

-- Sample data for instructor_salary table (with salary set to 0)
INSERT INTO instructor_salary (instructor_id, salary)
VALUES
(1, 0), (2, 0), (3, 0), (4, 0), (5, 0);

-- Sample data for instructor_schedule table
INSERT INTO instructor_schedule (instructor_id)
VALUES
(1), (2), (3), (4), (5);

-- Sample data for lesson table
INSERT INTO lesson (instructor_id, lesson_type)
VALUES
(1, 'Private'), (2, 'Private'), (3, 'Group'), (4, 'Private'), (5, 'Group');

-- Sample data for lesson_instrument table
INSERT INTO lesson_instrument (lesson_id, type_of_instruments_id, skill_levels_available_id)
VALUES
(1, 1, 1), (2, 2, 2), (3, 3, 1), (4, 4, 2), (5, 5, 3);

-- Sample data for lesson_student table
INSERT INTO lesson_student (student_id, lesson_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 1), (7, 2),
(8, 3), (9, 4), (10, 5),(11, 1), (12, 2), (13, 3), (14, 4),
(15, 5), (16, 1), (17, 2), (18, 3), (19, 4), (20, 5);

-- Sample data for stocked_instrument table
INSERT INTO stocked_instrument (type_of_instrument_id, brand, rent_price)
VALUES
(1, 'Yamaha', 150.00),
(2, 'Fender', 100.00),
(3, 'Stradivarius', 500.00),
(4, 'Pearl', 250.00),
(5, 'Gemeinhardt', 200.00);

-- Sample data for instrument_rental table
INSERT INTO instrument_rental (stocked_instrument_id, rent_date, return_date, rent_fee)
VALUES
(1, '2024-11-01 09:00:00', '2024-11-07 09:00:00', 150.00),
(2, '2024-11-01 10:00:00', '2024-11-07 10:00:00', 100.00),
(3, '2024-11-02 09:00:00', '2024-11-09 09:00:00', 500.00),
(4, '2024-11-02 10:00:00', '2024-11-09 10:00:00', 250.00),
(5, '2024-11-03 09:00:00', '2024-11-10 09:00:00', 200.00);

-- Sample data for rented_instruments table
INSERT INTO rented_instruments (student_id, instrument_renatl_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

INSERT INTO sibling (student_id, sibling_id)
VALUES
(1, 2), (3, 4), (5, 6), (7, 8), (9, 10), (3, 2),
(11, 12), (13, 14), (15, 16), (17, 18),(19, 20);
