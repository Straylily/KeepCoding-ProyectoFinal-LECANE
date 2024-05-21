CREATE SCHEMA airbnb;
set schema 'airbnb';

--Crear las tablas para normalizar los datos y mejorar la eficiencia

CREATE TABLE Hosts (
    Host_Id INT PRIMARY KEY,
    Rooms_Rent_By_The_Host INT
);

CREATE TABLE Room_Type (
    id smallserial primary key,
    Room_Type VARCHAR(60) NOT NULL
);

CREATE TABLE Coordinates (
    id smallserial primary key,
    Coordinates VARCHAR(150) NOT NULL,
    Latitud NUMERIC,
    Longitud NUMERIC
);

CREATE TABLE Location_room (
    id smallserial primary key,
    Neighbourhood VARCHAR(100),
    City VARCHAR(40),
    Country VARCHAR(40),
    Coordinates_Id INT NOT NULL
);

CREATE TABLE Availability (
    id smallserial primary key,
    Availability INT,
    Number_Of_Nights INT,
    Minimum_Nights INT
);

CREATE TABLE Room (
    Room_Id INT PRIMARY KEY,
    Room_Type_Id INT NOT NULL,
    Host_Id INT NOT NULL,
    Price NUMERIC,
    Availability_Id INT NOT NULL,
    Location_Id INT NOT NULL
);

CREATE TABLE Reviews (
    id smallserial primary key,
    Room_Id INT NOT NULL,
    Number_Of_Reviews INT,
    Reviews_Per_Month NUMERIC
);

ALTER TABLE Location_Room
ADD CONSTRAINT FK_Location_Coordinates
FOREIGN KEY (Coordinates_Id) REFERENCES Coordinates(id);

ALTER TABLE Room
ADD CONSTRAINT FK_Room_Room_Type
FOREIGN KEY (Room_Type_Id) REFERENCES Room_Type(id);

ALTER TABLE Room
ADD CONSTRAINT FK_Room_Host
FOREIGN KEY (Host_Id) REFERENCES Hosts(Host_Id);

ALTER TABLE Room
ADD CONSTRAINT FK_Room_Availability
FOREIGN KEY (Availability_Id) REFERENCES Availability(id);

ALTER TABLE Room
ADD CONSTRAINT FK_Room_Location
FOREIGN KEY (Location_Id) REFERENCES Location_room(id);

ALTER TABLE Reviews
ADD CONSTRAINT FK_Reviews_Room
FOREIGN KEY (Room_Id) REFERENCES Room(Room_Id);


-- Crear la tabla para los datos del dataset airbnb_listings

CREATE TABLE airbnb_listings (
    room_id INT PRIMARY KEY,
    name VARCHAR(255),
    host_id INT,
    neighbourhood VARCHAR(100),
    room_type VARCHAR(50),
    room_price NUMERIC,
    minimum_nights INT,
    number_of_reviews INT,
    date_last_review DATE,
    number_of_reviews_per_month NUMERIC,
    rooms_rent_by_the_host INT,
    availability INT,
    updated_date DATE,
    city VARCHAR(50),
    country VARCHAR(50),
    coordinates VARCHAR(100),
    location VARCHAR(255)
);


-- Cargar algunos datos de prueba mediante una serie de inserts sacados de los datos originales para comprobar que las tablas son correctas

INSERT INTO airbnb_listings (Room_ID, Name, Host_ID, Neighbourhood, Room_Type, Room_Price, Minimum_Nights, Number_of_Reviews, Date_Last_Review, Number_of_Reviews_Per_Month, Rooms_Rent_By_the_Host, Availability, Updated_Date, City, Country, Coordinates, Location)
VALUES
(21813271, 'Double room in Chueca, with private bathroom F 02', 132022481, 'Universidad', 'Private room', 45, 1, 167, '2020-03-14', 5.19, 46, 136, '2020-07-17', 'Madrid', 'Spain', '40.423192260888946, -3.7010886688779783', 'Spain, Madrid, Universidad'),
(21877634, 'Sunny room with balcony in pretty family house', 10169235, 'Ciudad Jardín', 'Private room', 26, 7, 6, '2020-03-08', 0.65, 2, 179, '2020-07-17', 'Madrid', 'Spain', '40.45004385318866, -3.6712841871122457', 'Spain, Madrid, Ciudad Jardín'),
(21931400, 'Apartamento muy cuco en el barrio de Chamberí', 111949695, 'Trafalgar', 'Entire home/apt', 57, 1, 5, '2020-03-02', 0.67, 1, 0, '2020-07-17', 'Madrid', 'Spain', '40.43042274619744, -3.701693596173804', 'Spain, Madrid, Trafalgar'),
(21945665, 'Design apartment in Heart of Madrid', 93930798, 'Castellana', 'Entire home/apt', 190, 3, 3, '2019-10-06', 0.18, 2, 179, '2020-07-17', 'Madrid', 'Spain', '40.43057627460486, -3.6869397877080177', 'Spain, Madrid, Castellana'),
(21955381, 'Trendy hip Malasaña duplex for art&design lovers', 69805790, 'Universidad', 'Entire home/apt', 75, 5, 22, '2020-01-19', 0.71, 2, 364, '2020-07-17', 'Madrid', 'Spain', '40.42584028788459, -3.7030496318151873', 'Spain, Madrid, Universidad'),
(21979690, 'MADRID LUXURY & DESIGN', 160477215, 'Justicia', 'Entire home/apt', 180, 2, 87, '2020-03-13', 2.77, 2, 0, '2020-07-17', 'Madrid', 'Spain', '40.42397401534791, -3.694254168912872', 'Spain, Madrid, Justicia'),
(21997533, 'BEST BUDGET ROOM TO VISIT MADRID# 3', 99628826, 'Universidad', 'Private room', 15, 1, 41, '2020-03-14', 1.28, 3, 364, '2020-07-17', 'Madrid', 'Spain', '40.424728975504905, -3.7041549428376483', 'Spain, Madrid, Universidad'),
(22012756, 'Beautiful penthouse with terrace in Gran Via', 34183414, 'Justicia', 'Entire home/apt', 79, 2, 27, '2019-12-30', 0.9, 1, 365, '2020-07-17', 'Madrid', 'Spain', '40.42069053394367, -3.7003165890606877', 'Spain, Madrid, Justicia'),
(22220104, 'Fuencarral street room, private bathroom F 26', 132022481, 'Universidad', 'Private room', 45, 1, 205, '2020-03-10', 6.58, 46, 135, '2020-07-17', 'Madrid', 'Spain', '40.42373890677323, -3.700588514683173', 'Spain, Madrid, Universidad'),
(22278454, 'The treasure of Malasaña, next to Gran Via', 50895536, 'Universidad', 'Entire home/apt', 100, 2, 121, '2020-03-12', 3.85, 1, 0, '2020-07-17', 'Madrid', 'Spain', '40.424226300761006, -3.70496046879015', 'Spain, Madrid, Universidad'),
(22354751, 'Madrid-Atocha: vistas al Botánico para2-4 personas', 2048738, 'Jerónimos', 'Entire home/apt', 95, 2, 113, '2020-03-02', 3.75, 1, 150, '2020-07-17', 'Madrid', 'Spain', '40.40964693695421, -3.690923245202842', 'Spain, Madrid, Jerónimos');



-- Insertar los datos en las diferentes tablas:
   
-- Host
INSERT INTO Hosts (Host_Id, Rooms_Rent_By_The_Host)
SELECT host_id, COUNT(*) AS Rooms_Rent_By_The_Host
FROM airbnb_listings
GROUP BY host_id;

   -- Coordinates
INSERT INTO Coordinates (Coordinates, Latitud, Longitud)
SELECT DISTINCT coordinates,
                CAST(SPLIT_PART(coordinates, ',', 1) AS NUMERIC) AS Latitud,
                CAST(SPLIT_PART(coordinates, ',', 2) AS NUMERIC) AS Longitud
FROM airbnb_listings;

-- Room_Type
INSERT INTO Room_Type (Room_Type)
SELECT DISTINCT room_type
FROM airbnb_listings;


-- Location_room
INSERT INTO Location_room (Neighbourhood, City, Country, Coordinates_Id)
SELECT DISTINCT neighbourhood, city, country, c.id
FROM airbnb_listings a
JOIN Coordinates c ON a.coordinates = c.coordinates;

-- Availability
INSERT INTO Availability (Availability, Number_Of_Nights, Minimum_Nights)
SELECT DISTINCT availability, minimum_nights, minimum_nights
FROM airbnb_listings;

-- Room
INSERT INTO Room (Room_Id, Room_Type_Id, Host_Id, Price, Availability_Id, Location_Id)
SELECT DISTINCT room_id,
                (SELECT id FROM Room_Type WHERE Room_Type = airbnb_listings.room_type LIMIT 1),
                airbnb_listings.host_id,
                room_price,
                (SELECT id FROM Availability WHERE Availability = airbnb_listings.availability LIMIT 1),
                (SELECT id FROM Location_room WHERE Neighbourhood = airbnb_listings.neighbourhood AND City = airbnb_listings.city AND Country = airbnb_listings.country LIMIT 1)
FROM airbnb_listings;

-- IReviews
INSERT INTO Reviews (Room_Id, Number_Of_Reviews, Reviews_Per_Month)
SELECT DISTINCT room_id, number_of_reviews, number_of_reviews_per_month
FROM airbnb_listings;


-- Ejemplo de consulta para saber qué habitaciones ofrecen los hosts

SELECT h.Host_Id, h.Rooms_Rent_By_The_Host, r.Room_Id, r.Price
FROM Hosts h
JOIN Room r ON h.Host_Id = r.Host_Id;




