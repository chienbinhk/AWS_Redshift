
--DIM TABLE
CREATE PROCEDURE LOAD_DIM_COUTRY
AS
INSERT INTO DIM_COUTRY(country)
SELECT DISTINCT country from ASM3_Source ;
GO

CREATE PROCEDURE LOAD_DIM_DATE
AS
INSERT INTO DIM_DATE(date_added,release_year)
SELECT date_added,release_year from ASM3_Source;
GO

CREATE PROCEDURE LOAD_DIM_DIRECTOR
AS
INSERT INTO DIM_DIRECTOR(director)
SELECT DISTINCT director from ASM3_Source;
GO

CREATE PROCEDURE LOAD_DIM_DURATION
AS
INSERT INTO DIM_DURATION(duration)
SELECT DISTINCT duration from ASM3_Source;
GO

CREATE PROCEDURE LOAD_DIM_INFO
AS
INSERT INTO DIM_INFO(title,listed_in,description,cast)
SELECT title,listed_in,description,cast from ASM3_Source;
GO

CREATE PROCEDURE LOAD_DIM_RATING
AS
INSERT INTO DIM_RATING(rating)
SELECT DISTINCT rating from ASM3_Source;
GO

CREATE PROCEDURE LOAD_DIM_TYPE
AS
INSERT INTO DIM_TYPE(type)
SELECT DISTINCT type from ASM3_Source;
GO

--FACT TABLE 

CREATE PROCEDURE LOAD_FACT_NETFLIX_SHOWS
AS
INSERT INTO FACT_NETFLIX_SHOWS ( info_id, type_id, director_id, country_id, date_id, rating_id,duration_id)
SELECT info_id, type_id, director_id, country_id, date_id, rating_id, duration_id
from ASM3_Source left join DIM_INFO on DIM_INFO.cast = ASM3_Source.cast and DIM_INFO.listed_in = ASM3_Source.listed_in and DIM_INFO.title = ASM3_Source.title
LEFT join DIM_TYPE on DIM_TYPE.type = ASM3_Source.type
left join DIM_DIRECTOR on DIM_DIRECTOR.director = ASM3_Source.director
left join DIM_COUTRY on DIM_COUTRY.country = ASM3_Source.country
left join DIM_DATE on DIM_DATE.date_added = ASM3_Source.date_added
and DIM_DATE.release_year = ASM3_Source.release_year
left join DIM_RATING on DIM_RATING.rating = ASM3_Source.rating
left join DIM_DURATION on DIM_DURATION.duration = ASM3_Source.duration
GO
