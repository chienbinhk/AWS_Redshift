USE ASM3
GO
Create table DIM_COUTRY	(
country_id int IDENTITY(1,1) primary key,
country varchar(255));

Create table DIM_DIRECTOR (
director_id int IDENTITY(1,1) primary key,
director nvarchar(255));

Create table DIM_TYPE (
type_id int IDENTITY(1,1) primary key,
type varchar(255));

Create table DIM_DATE (
date_id int IDENTITY(1,1) primary key,
date_added varchar(255),
release_year varchar(255));

Create table DIM_RATING (
rating_id int IDENTITY(1,1) primary key,
rating varchar(255));

Create table DIM_INFO (
info_id int IDENTITY(1,1) primary key,
title nvarchar(255),
listed_in nvarchar(255),
description nvarchar(1000),
cast nvarchar(2000));

Create table DIM_DURATION (
duration_id int IDENTITY(1,1) primary key,
duration varchar(255));

Create table FACT_NETFLIX_SHOWS (
show_id int IDENTITY(1,1) primary key,
info_id int,
type_id int,
director_id int,
country_id int,
date_id int,
rating_id int,
duration_id int,
FOREIGN KEY (info_id) REFERENCES DIM_INFO(info_id),
FOREIGN KEY (type_id) REFERENCES DIM_TYPE(type_id),
FOREIGN KEY (director_id) REFERENCES DIM_DIRECTOR(director_id),
FOREIGN KEY (country_id) REFERENCES DIM_COUTRY(country_id),
FOREIGN KEY (date_id) REFERENCES DIM_DATE(date_id),
FOREIGN KEY (rating_id) REFERENCES DIM_RATING(rating_id),
FOREIGN KEY (duration_id) REFERENCES DIM_DURATION(duration_id)
);