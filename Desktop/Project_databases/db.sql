CREATE TABLE hotel_chain (
    chain_id INT PRIMARY KEY AUTO_INCREMENT,
    central_office_address VARCHAR(255) NOT NULL,
    central_office_city VARCHAR(255) NOT NULL,
    number_of_hotels INT NOT NULL,
    email_addresses VARCHAR(255),
    phone_numbers VARCHAR(255),
    chain_name VARCHAR(255) NOT NULL
);

CREATE TABLE hotel (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    stars INT NOT NULL CHECK (Stars > 0 AND Stars <= 5),
    number_of_rooms INT NOT NULL CHECK (number_of_rooms >= 0),
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_numbers VARCHAR(255),
    hotel_name VARCHAR(255) NOT NULL,
    manager_id INT,
    chain_id INT,
    FOREIGN KEY (chain_id) REFERENCES hotel_chain(chain_id) ON DELETE CASCADE
);

CREATE TABLE room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    amenities VARCHAR(255),
    capacity INT NOT NULL CHECK (Capacity > 0),
    view VARCHAR(255),
    extendable BOOLEAN,
    problems VARCHAR(255),
    hotel_id INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    ssn VARCHAR(255) UNIQUE NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_Name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(255),
    ssn VARCHAR(255) UNIQUE NOT NULL,
    employee_role VARCHAR(255),
    hotel_id INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);

CREATE TABLE booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price DECIMAL(10,2),
    room_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

CREATE TABLE renting (
    renting_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    paid BOOLEAN,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

INSERT INTO hotel_chain (central_office_address, central_office_city, number_of_hotels, email_addresses, phone_numbers, chain_name)
VALUES 
    ('10400 Fernwood Road, Bethesda, Maryland 20817, USA', 'Bethesda', 8, 'guestservices@marriott.com', '+1-301-380-3000', 'Marriott International'),
    ('7930 Jones Branch Drive, McLean, Virginia 22102, USA', 'McLean', 10, 'guestassistance@hilton.com', '+1-703-883-1000', 'Hilton Worldwide Holdings Inc.'),
    ('Broadwater Park, Denham, Buckinghamshire, UB9 5HR, United Kingdom', 'Denham', 12, 'customer.care@ihg.com', '+44-370-400-9099', 'InterContinental Hotels Group'),
    ('82 rue Henri Farman, 92130 Issy-les-Moulineaux, France', 'Issy-les-Moulineaux', 9, 'contact@accor.com', '+33-1-45-38-86-00', 'Accor'),
    ('22 Sylvan Way, Parsippany, New Jersey 07054, USA', 'Parsippany', 11, 'whgcorporateaffairs@wyn.com', '+1-973-753-6000', 'Wyndham Hotels & Resorts');


INSERT INTO hotel (stars, number_of_rooms, address, city, email, phone_numbers, hotel_name, chain_id)
VALUES 
    (4, 200, '12250 Rockville Pike', 'Rockville', 'info@bethesdamarriottsuites.com', '+1-301-822-9200', 'Bethesda Marriott Suites', 1),
    (3, 150, '6400 Ivy Lane', 'Greenbelt', 'sales@greenbeltmarriott.com', '+1-301-441-3700', 'Greenbelt Marriott', 1),
    (4, 250, '9750 Washingtonian Blvd', 'Gaithersburg', 'gaithersburg.marriott@marriott.com', '+1-301-590-0044', 'Gaithersburg Marriott Washingtonian Center', 1),
    (4, 300, '6400 Oxon Hill Road', 'Oxon Hill', 'info@gaylordnational.com', '+1-301-965-4000', 'Gaylord National Resort & Convention Center', 1),
    (3, 120, '6550 Loisdale Road', 'Springfield', 'frontdesk@suitesspringfield.com', '+1-703-971-8900', 'SpringHill Suites by Marriott Alexandria Springfield', 1),
    (3, 170, '800 North Glebe Road', 'Arlington', 'reservations@courtyardrosslyn.com', '+1-703-528-2222', 'Courtyard by Marriott Arlington Rosslyn', 1),
    (4, 180, '9000 Bartram Ave', 'Philadelphia', 'pshcy.sales.office@sheraton.com', '+1-215-492-0400', 'Philadelphia Airport Marriott', 1),
    (4, 230, '400 Courthouse Square', 'Alexandria', 'sales@westendalexandria.com', '+1-703-253-8600', 'The Westin Alexandria Old Town', 1);

INSERT INTO hotel (stars, number_of_rooms, address, city, email, phone_numbers, hotel_name, chain_id)
VALUES 
    (4, 200, '1775 Rockville Pike', 'Rockville', 'sales@rockville.hgi.com', '+1-301-468-1100', 'Hilton Garden Inn Rockville-Gaithersburg', 2),
    (3, 150, '620 Perry Pkwy', 'Gaithersburg', 'gaithersburgmd@hilton.com', '+1-301-977-8900', 'Hilton Washington DC North/Gaithersburg', 2),
    (4, 250, '1750 Rockville Pike', 'Rockville', 'info@bethesda.hgi.com', '+1-301-926-2222', 'Hilton Garden Inn Bethesda', 2),
    (4, 300, '6200 Waterford Blvd', 'Oklahoma City', 'okcwf_ds@hilton.com', '+1-405-858-2400', 'Waterford Marriott', 2),
    (3, 120, '2 George Street', 'Charleston', 'chswt_ds@hilton.com', '+1-843-723-4000', 'DoubleTree by Hilton Hotel & Suites Charleston - Historic District', 2),
    (3, 170, '1810 14th St NW', 'Washington', 'dcaho_ds@hilton.com', '+1-202-332-3234', 'Embassy Suites by Hilton Washington D.C. – Convention Center', 2),
    (4, 180, '201 East MacArthur Blvd', 'Santa Ana', 'snaem_ds@hilton.com', '+1-714-442-8600', 'Embassy Suites by Hilton Santa Ana Orange County Airport', 2),
    (4, 230, '801 University Drive East', 'College Station', 'cllts_ds@hilton.com', '+1-979-846-3700', 'Hilton College Station & Conference Center', 2);

INSERT INTO hotel (stars, number_of_rooms, address, city, email, phone_numbers, hotel_name, chain_id)
VALUES 
    (4, 200, '13-21 Seething Ln', 'London', 'info@ihg.com', '+44-20-7766-0625', 'InterContinental London The O2', 3),
    (3, 150, '1 Basinghall Ave', 'London', 'info@cplondoncityhotel.co.uk', '+44-20-7430-9888', 'Crowne Plaza London - The City', 3),
    (4, 250, '100 Kings Cross Rd', 'London', 'reservations@cplondonkingscross.co.uk', '+44-20-7833-3900', 'Crowne Plaza London - Kings Cross (WC1)', 3),
    (4, 300, 'St George\'s Bay', 'St Julian\'s', 'malta@ihg.com', '+356-2370-0000', 'InterContinental Malta', 3),
    (3, 120, 'Złota 9', 'Warsaw', 'hiwarsaw@ihg.com', '+48-22-697-39-50', 'Holiday Inn Warsaw City Centre', 3),
    (3, 170, '16 High St', 'Edinburgh', 'info@holidayinnedinburgh.co.uk', '+44-131-622-6800', 'Holiday Inn Edinburgh', 3),
    (4, 180, '2 Exchange Square', 'Birmingham', 'info@hicbirmingham.co.uk', '+44-121-634-6200', 'Holiday Inn Birmingham City Centre', 3),
    (4, 230, '10-42 Tverskaya St', 'Moscow', 'info@hi-moscow.ru', '+7-495-783-6500', 'Holiday Inn Moscow - Lesnaya', 3);
INSERT INTO hotel (stars, number_of_rooms, address, city, email, phone_numbers, hotel_name, chain_id)
VALUES 
    (4, 200, '16, rue Alphonse de Neuville', 'Paris', 'contact@sofitel.com', '+33-1-44-77-91-00', 'Sofitel Paris Arc de Triomphe', 4),
    (3, 150, '5 Rue de Castiglione', 'Paris', 'contact@novotel.com', '+33-1-42-86-46-86', 'Novotel Paris 1er arrondissement', 4),
    (4, 250, '20, rue d\'Astorg', 'Paris', 'info@pullmanhotels.com', '+33-1-44-94-14-14', 'Pullman Paris Centre-Bercy', 4),
    (4, 300, '22-24 Rue du Débarcadère', 'Paris', 'h5626@accor.com', '+33-1-58-37-80-00', 'Hotel Mercure Paris Centre Tour Eiffel', 4),
    (3, 120, '6 Rue Gustave Eiffel', 'Bordeaux', 'info@ibis.com', '+33-5-56-11-95-95', 'ibis Bordeaux Centre Meriadeck', 4),
    (3, 170, '5 Rue Frédéric Bastiat', 'Toulouse', 'contact@adagio-city.com', '+33-5-62-48-72-20', 'Aparthotel Adagio Toulouse Parthenon', 4),
    (4, 180, 'Place de l\'Europe', 'Strasbourg', 'contact@novotel.com', '+33-3-88-21-46-46', 'Novotel Strasbourg Centre Halles', 4),
    (4, 230, 'Place de la Gare', 'Lyon', 'info@lyonmetropole.com', '+33-4-72-10-44-44', 'Hotel Lyon Metropole', 4);

INSERT INTO hotel (stars, number_of_rooms, address, city, email, phone_numbers, hotel_name, chain_id)
VALUES 
    (4, 200, '12021 Harbor Blvd', 'Garden Grove', 'info@gardengrove.wyndham.com', '+1-714-867-5555', 'Wyndham Anaheim Garden Grove', 5),
    (3, 150, '1111 14th St NW', 'Washington', 'info@thewyndhamwashingtondc.com', '+1-202-234-0700', 'The Wyndham Washington DC', 5),
    (4, 250, '101 Royal St', 'New Orleans', 'reservations@wyndhamfrenchquarter.com', '+1-504-524-8200', 'Wyndham New Orleans - French Quarter', 5),
    (4, 300, '777 Margaritaville Way', 'Bossier City', 'info@margaritavillebossiercity.com', '+1-318-698-7177', 'Margaritaville Resort Casino Bossier City', 5),
    (3, 120, '950 Lake Shore Blvd E', 'Toronto', 'info@wyndhamlakefronttoronto.com', '+1-416-203-3333', 'Wyndham Lakefront Toronto', 5),
    (3, 170, '2025 Winston Park Dr', 'Oakville', 'info@wyndhamgardenoakville.com', '+1-905-829-1145', 'Wyndham Garden Oakville', 5),
    (4, 180, '1 Old Golf Course Rd', 'Monterey', 'reservations@casa-munras.com', '+1-831-375-2411', 'Casa Munras Garden Hotel & Spa', 5),
    (4, 230, '1075 Peachtree St NE', 'Atlanta', 'info@wyndhammidtownatlanta.com', '+1-404-873-4800', 'Wyndham Midtown Atlanta', 5);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (1, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 1);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (2, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 1);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (3, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 1);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (4, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 1);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (5, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 1);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (6, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 2);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (7, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 2);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (8, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 2);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (9, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 2);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (10, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 2);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (11, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 3);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (12, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 3);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (13, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 3);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (14, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 3);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (15, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 3);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (16, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 4);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (17, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 4);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (18, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 4);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (19, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 4);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (20, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 4);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (21, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 5);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (22, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 5);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (23, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 5);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (24, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 5);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (25, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 5);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (26, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 6);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (27, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 6);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (28, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 6);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (29, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 6);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (30, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 6);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (31, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 7);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (32, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 7);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (33, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 7);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (34, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 7);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (35, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 7);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (36, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 8);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (37, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 8);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (38, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 8);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (39, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 8);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (40, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 8);

-- Rooms for chain 2
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (41, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 9);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (42, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 9);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (43, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 9);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (44, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 9);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (45, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 9);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (46, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 10);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (47, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 10);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (48, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 10);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (49, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 10);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (50, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 10);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (51, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 11);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (52, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 11);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (53, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 11);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (54, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 11);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (55, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 11);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (56, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 12);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (57, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 12);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (58, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 12);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (59, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 12);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (60, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 12);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (61, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 13);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (62, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 13);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (63, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 13);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (64, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 13);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (65, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 13);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (66, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 14);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (67, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 14);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (68, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 14);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (69, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 14);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (70, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 14);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (71, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 15);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (72, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 15);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (73, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 15);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (74, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 15);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (75, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 15);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (76, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 16);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (77, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 16);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (78, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 16);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (79, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 16);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (80, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 16);

-- Hotels in chain 3

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (81, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 17);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (82, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 17);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (83, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 17);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (84, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 17);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (85, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 17);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (86, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 18);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (87, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 18);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (88, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 18);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (89, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 18);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (90, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 18);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (91, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 19);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (92, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 19);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (93, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 19);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (94, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 19);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (95, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 19);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (96, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 20);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (97, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 20);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (98, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 20);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (99, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 20);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (100, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 20);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (101, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 21);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (102, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 21);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (103, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 21);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (104, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 21);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (105, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 21);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (106, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 22);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (107, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 22);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (108, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 22);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (109, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 22);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (110, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 22);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (111, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 23);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (112, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 23);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (113, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 23);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (114, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 23);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (115, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 23);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (116, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 24);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (117, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 24);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (118, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 24);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (119, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 24);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (120, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 24);

-- Rooms for chain 4
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (121, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 25);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (122, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 25);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (123, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 25);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (124, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 25);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (125, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 25);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (126, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 26);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (127, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 26);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (128, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 26);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (129, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 26);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (130, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 26);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (131, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 27);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (132, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 27);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (133, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 27);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (134, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 27);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (135, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 27);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (136, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 28);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (137, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 28);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (138, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 28);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (139, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 28);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (140, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 28);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (141, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 29);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (142, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 29);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (143, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 29);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (144, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 29);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (145, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 29);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (146, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 30);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (147, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 30);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (148, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 30);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (149, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 30);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (150, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 30);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (151, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 31);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (152, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 31);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (153, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 31);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (154, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 31);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (155, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 31);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (156, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 32);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (157, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 32);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (158, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 32);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (159, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 32);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (160, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 32);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (161, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 33);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (162, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 33);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (163, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 33);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (164, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 33);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (165, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 33);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (166, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 34);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (167, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 34);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (168, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 34);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (169, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 34);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (170, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 34);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (171, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 35);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (172, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 35);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (173, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 35);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (174, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 35);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (175, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 35);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (176, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 36);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (177, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 36);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (178, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 36);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (179, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 36);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (180, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 36);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (181, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 37);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (182, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 37);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (183, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 37);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (184, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 37);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (185, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 37);


INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (186, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 38);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (187, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 38);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (188, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 38);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (189, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 38);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (190, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 38);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (191, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 39);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (192, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 39);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (193, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 39);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (194, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 39);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (195, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 39);

INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (196, 150.00, 'Free Wi-Fi, TV, mini-bar', 2, 'City view', TRUE, NULL, 40);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (197, 250.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 3, 'City view', TRUE, NULL, 40);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (198, 100.00, 'Free Wi-Fi, TV', 1, 'Front view', TRUE, NULL, 40);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (199, 175.00, 'Free Wi-Fi, TV', 4, 'No view', TRUE, 'Broken AC', 40);
INSERT INTO Room (Room_id, Price, Amenities, Capacity, View, Extendable, Problems, Hotel_id)
VALUES (200, 350.00, 'Free Wi-Fi, TV, mini-bar, Room Service, Balcony, Jacuzzi', 5, 'City view', TRUE, NULL, 40);



SELECT hotel.hotel_name, hotel.stars, hotel_chain.chain_name
FROM hotel
JOIN hotel_chain ON hotel.chain_id = hotel_chain.chain_id
WHERE hotel.city = 'Paris' AND hotel.stars >= 4;


SELECT hotel.hotel_name, COUNT(room.room_id) AS num_rooms
FROM hotel
JOIN room ON hotel.hotel_id = room.hotel_id
GROUP BY hotel.hotel_id
ORDER BY num_rooms DESC;


SELECT SUM(booking.price) AS total_revenue
FROM booking
WHERE booking.start_date >= '2023-01-01' AND booking.end_date <= '2023-01-31';


SELECT hotel.hotel_name, AVG(room.price) AS avg_price
FROM hotel
JOIN room ON hotel.hotel_id = room.hotel_id
WHERE hotel.city = 'Paris'
GROUP BY hotel.hotel_id;


DELIMITER $$

CREATE TRIGGER update_room_count_after_insert
AFTER INSERT ON room
FOR EACH ROW
BEGIN
    UPDATE hotel SET number_of_rooms = (SELECT COUNT(*) FROM room WHERE hotel_id = NEW.hotel_id) WHERE hotel_id = NEW.hotel_id;
END $$

CREATE TRIGGER update_room_count_after_delete
AFTER DELETE ON room
FOR EACH ROW
BEGIN
    UPDATE hotel SET number_of_rooms = (SELECT COUNT(*) FROM room WHERE hotel_id = OLD.hotel_id) WHERE hotel_id = OLD.hotel_id;
END $$

DELIMITER ;
