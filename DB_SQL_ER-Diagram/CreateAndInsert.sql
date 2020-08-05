CREATE TABLE [Airport] (
  [IATA] nvarchar(255) PRIMARY KEY,
  [CommonName] nvarchar(255),
  [CountryCodeFK] nvarchar(255)
)
GO

CREATE TABLE [Country] (
  [CountryCode] nvarchar(255) PRIMARY KEY,
  [Country] nvarchar(255)
)
GO

CREATE TABLE [City] (
  [IATA] nvarchar(255) PRIMARY KEY,
  [CityName] nvarchar(255)
)
GO

CREATE TABLE [Airline] (
  [Id] int PRIMARY KEY IDENTITY(1,1),
  [Name] nvarchar(255)
)
GO

CREATE TABLE [Route] (
  [Id] int PRIMARY KEY IDENTITY(1,1),
  [DestinationStart] nvarchar(255),
  [DestinationEnd] nvarchar(255),
  [Owner] int
)
GO

CREATE TABLE [RouteOperater] (
  [Id] int PRIMARY KEY IDENTITY(1,1),
  [RouteID] int,
  [AirlineID] int
)
GO

ALTER TABLE [Airport] ADD FOREIGN KEY ([CountryCodeFK]) REFERENCES [Country] ([CountryCode])
GO

ALTER TABLE [City] ADD FOREIGN KEY ([IATA]) REFERENCES [Airport] ([IATA])
GO

ALTER TABLE [Route] ADD FOREIGN KEY ([DestinationStart]) REFERENCES [Airport] ([IATA])
GO

ALTER TABLE [Route] ADD FOREIGN KEY ([DestinationEnd]) REFERENCES [Airport] ([IATA])
GO

ALTER TABLE [Route] ADD FOREIGN KEY ([Owner]) REFERENCES [Airline] ([Id])
GO

ALTER TABLE [RouteOperater] ADD FOREIGN KEY ([RouteID]) REFERENCES [Route] ([Id])
GO

ALTER TABLE [RouteOperater] ADD FOREIGN KEY ([AirlineID]) REFERENCES [Airline] ([Id])
GO





--Country inserts
INSERT INTO Country (CountryCode, Country) VALUES 
('DK', 'Denmark'), ('US', 'U.S.A'), ('NL', 'Netherlands')

--Airport inserts
INSERT INTO Airport (IATA, CommonName, CountryCodeFK) VALUES ('CPH', 'Kastrup', 'DK');
INSERT INTO Airport (IATA, CommonName, CountryCodeFK) VALUES ('LAX', 'Los Angeles International', 'US');
INSERT INTO Airport (IATA, CommonName, CountryCodeFK) VALUES ('AMS', 'Amsterdam', 'NL');

--City inserts
INSERT INTO City (IATA, CityName) VALUES 
('CPH', 'København'), ('LAX', 'Los Angeles'), ('AMS', 'Amsterdam')

--Airline inserts
INSERT INTO Airline ([Name]) VALUES
('SAS'), ('Air Nostrum'), ('KLM')

--Route inserts
INSERT INTO [Route] (DestinationStart,DestinationEnd,[Owner])VALUES
('CPH', 'AMS', 1), ('CPH', 'LAX', 1), ('AMS', 'LAX', 3)

--RouteOperator
INSERT INTO RouteOperater (AirlineID, RouteID) VALUES
(1, 1), (2, 1), (2, 3), (2, 2)
