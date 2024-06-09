-- Создание таблиц измерений

-- Таблица измерений с SCD Type 2
CREATE TABLE Dim_Users (
   User_Surrogate_Key SERIAL PRIMARY KEY,
   User_Natural_Key INT NOT NULL,
   Name VARCHAR(255),
   Email VARCHAR(255),
   City VARCHAR(255),
   Tags VARCHAR(255),
   Rating FLOAT,
   Effective_Date TIMESTAMP,
   Expiration_Date TIMESTAMP,
   Is_Current BOOLEAN,
   UNIQUE (User_Natural_Key, Is_Current)
);


-- Остальные таблицы измерений
CREATE TABLE Dim_Clubs (
  Club_Key SERIAL PRIMARY KEY,
  Club_Natural_Key INT NOT NULL,
  Name VARCHAR(255),
  Country VARCHAR(255),
  City VARCHAR(255),
  Address VARCHAR(255),
  Tags VARCHAR(255),
  Rating FLOAT,
  UNIQUE (Club_Natural_Key)
)
CREATE TABLE Dim_Computers (
   Computer_Key SERIAL PRIMARY KEY,
   Computer_Natural_Key INT NOT NULL,
   Club_Key INT,
   Name VARCHAR(255),
   Characteristics VARCHAR(255),
   UNIQUE (Computer_Natural_Key),
   FOREIGN KEY (Club_Key) REFERENCES Dim_Clubs(Club_Key)
);



CREATE TABLE Dim_Date (
  Date_Key SERIAL PRIMARY KEY,
  Full_Date DATE NOT NULL,
  Year INT,
  Quarter INT,
  Month INT,
  Day INT,
  Day_of_Week INT,
  Week_of_Year INT,
  UNIQUE (Full_Date)
);

-- Создание таблиц фактов
CREATE TABLE Fact_Bookings (
   Booking_Key SERIAL PRIMARY KEY,
   User_Key INT,
   Computer_Key INT,
   Date_Key INT,
   Booking_Date TIMESTAMP,
   Status VARCHAR(255),
   FOREIGN KEY (User_Key) REFERENCES Dim_Users(User_Surrogate_Key),
   FOREIGN KEY (Computer_Key) REFERENCES Dim_Computers(Computer_Key),
   FOREIGN KEY (Date_Key) REFERENCES Dim_Date(Date_Key)
);

CREATE TABLE Fact_Reviews (
   Review_Key SERIAL PRIMARY KEY,
   User_Key INT,
   Club_Key INT,
   Date_Key INT,
   Rating INT,
   Comment TEXT,
   FOREIGN KEY (User_Key) REFERENCES Dim_Users(User_Surrogate_Key),
   FOREIGN KEY (Club_Key) REFERENCES Dim_Clubs(Club_Key),
   FOREIGN KEY (Date_Key) REFERENCES Dim_Date(Date_Key)
);
