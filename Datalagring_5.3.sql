CREATE TABLE genre (
 genres_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre VARCHAR(50)
);

ALTER TABLE genre ADD CONSTRAINT PK_genre PRIMARY KEY (genres_id);


CREATE TABLE locales (
 locales_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 room_name VARCHAR(50),
 capacity INT
);

ALTER TABLE locales ADD CONSTRAINT PK_locales PRIMARY KEY (locales_id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 ssn VARCHAR(12) NOT NULL,
 name VARCHAR(50) NOT NULL,
 email VARCHAR(350) NOT NULL,
 phone_number VARCHAR(12) NOT NULL,
 street_adress VARCHAR(50),
 zip_code VARCHAR(5),
 city VARCHAR(50)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE skill_levels_available (
 skill_levels_available_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(50) NOT NULL
);

ALTER TABLE skill_levels_available ADD CONSTRAINT PK_skill_levels_available PRIMARY KEY (skill_levels_available_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_payment (
 student_id INT NOT NULL,
 bill FLOAT
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (student_id);


CREATE TABLE time_slot (
 timeslot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIMESTAMP(6),
 end_time TIMESTAMP(6)
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (timeslot_id);


CREATE TABLE type_of_instruments (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(50) NOT NULL
);

ALTER TABLE type_of_instruments ADD CONSTRAINT PK_type_of_instruments PRIMARY KEY (id);


CREATE TABLE contact_person (
 person_id INT NOT NULL,
 relation_to_student VARCHAR(50)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (person_id);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_salary (
 instructor_id INT NOT NULL,
 salary FLOAT
);

ALTER TABLE instructor_salary ADD CONSTRAINT PK_instructor_salary PRIMARY KEY (instructor_id);


CREATE TABLE instructor_schedule (
 instructor_schedule_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_schedule ADD CONSTRAINT PK_instructor_schedule PRIMARY KEY (instructor_schedule_id);


CREATE TABLE instructor_schedule_time_slot (
 instructor_schedule_id INT NOT NULL,
 timeslot_id INT NOT NULL
);

ALTER TABLE instructor_schedule_time_slot ADD CONSTRAINT PK_instructor_schedule_time_slot PRIMARY KEY (instructor_schedule_id,timeslot_id);


CREATE TABLE lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT,
 lesson_type VARCHAR(50) NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE lesson_instrument (
 lesson_id INT NOT NULL,
 type_of_instruments_id INT NOT NULL,
 skill_levels_available_id INT NOT NULL
);

ALTER TABLE lesson_instrument ADD CONSTRAINT PK_lesson_instrument PRIMARY KEY (lesson_id);


CREATE TABLE lesson_student (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE lesson_student ADD CONSTRAINT PK_lesson_student PRIMARY KEY (student_id,lesson_id);


CREATE TABLE list_of_instruments (
 instructor_id INT NOT NULL,
 type_of_instruments_id INT NOT NULL,
 skill_levels_available_id INT NOT NULL
);

ALTER TABLE list_of_instruments ADD CONSTRAINT PK_list_of_instruments PRIMARY KEY (instructor_id);


CREATE TABLE locale_availability (
 locales_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE locale_availability ADD CONSTRAINT PK_locale_availability PRIMARY KEY (locales_id,lesson_id);


CREATE TABLE locale_availability_time_slot (
 locales_id INT NOT NULL,
 lesson_id INT NOT NULL,
 timeslot_id INT NOT NULL
);

ALTER TABLE locale_availability_time_slot ADD CONSTRAINT PK_locale_availability_time_slot PRIMARY KEY (locales_id,lesson_id,timeslot_id);


CREATE TABLE pricing_scheme (
 lesson_id INT NOT NULL,
 lesson_price FLOAT NOT NULL
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (lesson_id);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE solo_lesson (
 lesson_id INT NOT NULL
);

ALTER TABLE solo_lesson ADD CONSTRAINT PK_solo_lesson PRIMARY KEY (lesson_id);


CREATE TABLE stocked_instrument (
 stocked_instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type_of_instrument_id INT NOT NULL,
 brand VARCHAR(50),
 rent_price FLOAT
);

ALTER TABLE stocked_instrument ADD CONSTRAINT PK_stocked_instrument PRIMARY KEY (stocked_instrument_id);


CREATE TABLE student_contact_person (
 person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_contact_person ADD CONSTRAINT PK_student_contact_person PRIMARY KEY (person_id,student_id);


CREATE TABLE ensamble (
 lesson_id INT NOT NULL,
 genres_id INT NOT NULL,
 min_nunmber_of_students INT,
 max_number_of_students INT
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (lesson_id);


CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 min_nunmber_of_students INT,
 max_number_of_students INT
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE instrument_rental (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 stocked_instrument_id INT NOT NULL,
 rent_date TIMESTAMP(6),
 return_date TIMESTAMP(6),
 rent_fee FLOAT
);

ALTER TABLE instrument_rental ADD CONSTRAINT PK_instrument_rental PRIMARY KEY (id);


CREATE TABLE rented_instruments (
 student_id INT NOT NULL,
 instrument_renatl_id INT NOT NULL
);

ALTER TABLE rented_instruments ADD CONSTRAINT PK_rented_instruments PRIMARY KEY (student_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor_salary ADD CONSTRAINT FK_instructor_salary_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instructor_schedule ADD CONSTRAINT FK_instructor_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instructor_schedule_time_slot ADD CONSTRAINT FK_instructor_schedule_time_slot_0 FOREIGN KEY (instructor_schedule_id) REFERENCES instructor_schedule (instructor_schedule_id);
ALTER TABLE instructor_schedule_time_slot ADD CONSTRAINT FK_instructor_schedule_time_slot_1 FOREIGN KEY (timeslot_id) REFERENCES time_slot (timeslot_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE lesson_instrument ADD CONSTRAINT FK_lesson_instrument_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
ALTER TABLE lesson_instrument ADD CONSTRAINT FK_lesson_instrument_1 FOREIGN KEY (type_of_instruments_id) REFERENCES type_of_instruments (id);
ALTER TABLE lesson_instrument ADD CONSTRAINT FK_lesson_instrument_2 FOREIGN KEY (skill_levels_available_id) REFERENCES skill_levels_available (skill_levels_available_id);


ALTER TABLE lesson_student ADD CONSTRAINT FK_lesson_student_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE lesson_student ADD CONSTRAINT FK_lesson_student_1 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE list_of_instruments ADD CONSTRAINT FK_list_of_instruments_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE list_of_instruments ADD CONSTRAINT FK_list_of_instruments_1 FOREIGN KEY (type_of_instruments_id) REFERENCES type_of_instruments (id);
ALTER TABLE list_of_instruments ADD CONSTRAINT FK_list_of_instruments_2 FOREIGN KEY (skill_levels_available_id) REFERENCES skill_levels_available (skill_levels_available_id);


ALTER TABLE locale_availability ADD CONSTRAINT FK_locale_availability_0 FOREIGN KEY (locales_id) REFERENCES locales (locales_id);
ALTER TABLE locale_availability ADD CONSTRAINT FK_locale_availability_1 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE locale_availability_time_slot ADD CONSTRAINT FK_locale_availability_time_slot_0 FOREIGN KEY (locales_id,lesson_id) REFERENCES locale_availability (locales_id,lesson_id);
ALTER TABLE locale_availability_time_slot ADD CONSTRAINT FK_locale_availability_time_slot_1 FOREIGN KEY (timeslot_id) REFERENCES time_slot (timeslot_id);


ALTER TABLE pricing_scheme ADD CONSTRAINT FK_pricing_scheme_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (student_id);


ALTER TABLE solo_lesson ADD CONSTRAINT FK_solo_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson_instrument (lesson_id);


ALTER TABLE stocked_instrument ADD CONSTRAINT FK_stocked_instrument_0 FOREIGN KEY (type_of_instrument_id) REFERENCES type_of_instruments (id);


ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_0 FOREIGN KEY (person_id) REFERENCES contact_person (person_id);
ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_1 FOREIGN KEY (genres_id) REFERENCES genre (genres_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson_instrument (lesson_id);


ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_0 FOREIGN KEY (stocked_instrument_id) REFERENCES stocked_instrument (stocked_instrument_id);


ALTER TABLE rented_instruments ADD CONSTRAINT FK_rented_instruments_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE rented_instruments ADD CONSTRAINT FK_rented_instruments_1 FOREIGN KEY (instrument_renatl_id) REFERENCES instrument_rental (id);


