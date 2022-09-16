-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-09-16 07:54:36.252

-- tables
-- Table: client
CREATE TABLE client (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(45) NULL,
    surname varchar(45) NULL,
    phone_number varchar(12) NULL,
    email varchar(20) NOT NULL,
    gender varchar(20) NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id)
);

-- Table: hotel
CREATE TABLE hotel (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NULL,
    phone varchar(12) NULL,
    hotel_code varchar(45) NOT NULL,
    CONSTRAINT hotel_pk PRIMARY KEY (id)
);

-- Table: location
CREATE TABLE location (
    id int NOT NULL AUTO_INCREMENT,
    street varchar(45) NULL,
    city varchar(50) NULL,
    hotel_id int NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table: payment
CREATE TABLE payment (
    id int NOT NULL AUTO_INCREMENT,
    date int NULL,
    suma decimal(10,8) NOT NULL,
    reserved_id int NOT NULL,
    CONSTRAINT payment_pk PRIMARY KEY (id)
);

-- Table: price
CREATE TABLE price (
    id int NOT NULL AUTO_INCREMENT,
    begin_date int NULL,
    end_date int NULL,
    price numeric(10,8) NULL,
    type int NULL,
    CONSTRAINT price_pk PRIMARY KEY (id)
);

-- Table: reserved
CREATE TABLE reserved (
    id int NOT NULL AUTO_INCREMENT,
    form_date date NULL,
    to_date date NULL,
    room_id int NOT NULL,
    client_id int NOT NULL,
    CONSTRAINT reserved_pk PRIMARY KEY (id)
);

-- Table: review
CREATE TABLE review (
    id int NOT NULL AUTO_INCREMENT,
    raiting varchar(35) NOT NULL,
    description varchar(500) NOT NULL,
    date date NOT NULL,
    client_id int NOT NULL,
    hotel_id int NOT NULL,
    CONSTRAINT review_pk PRIMARY KEY (id)
);

-- Table: room
CREATE TABLE room (
    id int NOT NULL AUTO_INCREMENT,
    number varchar(1000) NULL,
    type varchar(45) NULL,
    floor int NOT NULL,
    hotel_id int NOT NULL,
    price_id int NOT NULL,
    CONSTRAINT room_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: location_hotel (table: location)
ALTER TABLE location ADD CONSTRAINT location_hotel FOREIGN KEY location_hotel (hotel_id)
    REFERENCES hotel (id);

-- Reference: payment_reserved (table: payment)
ALTER TABLE payment ADD CONSTRAINT payment_reserved FOREIGN KEY payment_reserved (reserved_id)
    REFERENCES reserved (id);

-- Reference: reserved_client (table: reserved)
ALTER TABLE reserved ADD CONSTRAINT reserved_client FOREIGN KEY reserved_client (client_id)
    REFERENCES client (id);

-- Reference: reserved_room (table: reserved)
ALTER TABLE reserved ADD CONSTRAINT reserved_room FOREIGN KEY reserved_room (room_id)
    REFERENCES room (id);

-- Reference: review_client (table: review)
ALTER TABLE review ADD CONSTRAINT review_client FOREIGN KEY review_client (client_id)
    REFERENCES client (id);

-- Reference: review_hotel (table: review)
ALTER TABLE review ADD CONSTRAINT review_hotel FOREIGN KEY review_hotel (hotel_id)
    REFERENCES hotel (id);

-- Reference: room_hotel (table: room)
ALTER TABLE room ADD CONSTRAINT room_hotel FOREIGN KEY room_hotel (hotel_id)
    REFERENCES hotel (id);

-- Reference: room_price (table: room)
ALTER TABLE room ADD CONSTRAINT room_price FOREIGN KEY room_price (price_id)
    REFERENCES price (id);

-- End of file.

