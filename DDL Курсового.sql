DROP DATABASE IF EXISTS climate;
CREATE DATABASE climate;
USE climate;

-- Таблица стран и городов (также указывается широта города)

DROP TABLE IF EXISTS names;
CREATE TABLE names(
	id 	SERIAL PRIMARY KEY,
	country varchar(50),
	city varchar(50),
	latitude FLOAT
);

-- Влажность и осадки (среднегодовые значения)

DROP TABLE IF EXISTS precipitation_humadity;
CREATE TABLE precipitation_humadity(
	id SERIAL PRIMARY KEY,
	quantity_of_precipitation DECIMAL,
	gumidity_of_air  DECIMAL,
	name_id BIGINT UNSIGNED DEFAULT NULL ,
	FOREIGN KEY (name_id) REFERENCES names(id) ON UPDATE CASCADE ON DELETE CASCADE 
);

-- Влажность по месяцам

DROP TABLE IF EXISTS humydity_by_months;
CREATE TABLE humidity_by_months(
	id SERIAL PRIMARY KEY,
	January DECIMAL,
	February DECIMAL,
	March DECIMAL,
	April DECIMAL,
	May DECIMAL,
	June DECIMAL,
	July DECIMAL,
	August DECIMAL,
	September DECIMAL,
	October DECIMAL,
	November DECIMAL,
	December DECIMAL,
	by_year_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (by_year_id) REFERENCES precipitation_humadity(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

-- Осадки по месяцам

DROP TABLE IF EXISTS precipitation_by_months;
CREATE TABLE precipitation_by_months(
	id SERIAL PRIMARY KEY,
	January DECIMAL,
	February DECIMAL,
	March DECIMAL,
	April DECIMAL,
	May DECIMAL,
	June DECIMAL,
	July DECIMAL,
	August DECIMAL,
	September DECIMAL,
	October DECIMAL,
	November DECIMAL,
	December DECIMAL,
	by_year_id BIGINT UNSIGNED ,
	FOREIGN KEY (by_year_id) REFERENCES precipitation_humadity(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

-- Среднегодовая температура воздуха

DROP TABLE IF EXISTS temperature_by_year;
CREATE TABLE temperature_by_year(
	id SERIAL PRIMARY KEY,
	aerage_temperature DECIMAL,
	name_id BIGINT UNSIGNED DEFAULT NULL ,
	FOREIGN KEY (name_id) REFERENCES names(id) ON UPDATE CASCADE ON DELETE CASCADE 
);

-- Температура по месяцам

DROP TABLE IF EXISTS temperature_by_months;
CREATE TABLE temperature_by_months(

	id SERIAL PRIMARY KEY,
	January DECIMAL,
	February DECIMAL,
	March DECIMAL,
	April DECIMAL,
	May DECIMAL,
	June DECIMAL,
	July DECIMAL,
	August DECIMAL,
	September DECIMAL,
	October DECIMAL,
	November DECIMAL,
	December DECIMAL,
	by_year_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (by_year_id) REFERENCES temperature_by_year(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

-- Высота над уровнем моря

DROP TABLE IF EXISTS heights;
CREATE TABLE heights (
	id SERIAL PRIMARY KEY,
	heigh_of DECIMAL,
	name_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (name_id) REFERENCES names(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Ветер (среднегодовые значения)

DROP TABLE IF EXISTS wind;
CREATE TABLE wind(
	id SERIAL PRIMARY KEY,
	average_wind_by_year DECIMAL,
	name_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (name_id) REFERENCES names(id)
);

-- Количество часов солнечного сияния

DROP TABLE IF EXISTS sunshine;
CREATE TABLE sunshine(
	id SERIAL PRIMARY KEY,
	sunshine_summ INT,
	name_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (name_id) REFERENCES names(id)
);





-- Тип климата

DROP TABLE IF EXISTS type_of_climate;
CREATE TABLE type_of_climate(
	id SERIAL PRIMARY KEY,
	type_of ENUM ('Af', 'Am', 'Aw', 'BWh', 'BWk', 'BSh', 'BSk', 'Csa', 'Csb', 'Cwa', 'Cwb', 'Cwc', 'Cfa', 'Cfb', 'Cfc', 'Dsa','Dsb', 'Dsc', 'Dsd', 'Dwa', 'Dwb', 'Dwc', 'Dwd', 'Dfa', 'Dfb', 'Dfc', 'Dfd'),
	name_id BIGINT UNSIGNED DEFAULT NULL,
	months_tmp_id BIGINT UNSIGNED DEFAULT NULL,
	months_precipitation_id BIGINT UNSIGNED DEFAULT NULL,
	height_id BIGINT UNSIGNED DEFAULT NULL,
	humidity_by_months_id BIGINT UNSIGNED DEFAULT NULL,
	wind_id BIGINT UNSIGNED DEFAULT NULL,
	sunshine_id BIGINT UNSIGNED DEFAULT NULL,
	FOREIGN KEY (name_id) REFERENCES names(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (months_tmp_id) REFERENCES temperature_by_months(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (months_precipitation_id) REFERENCES precipitation_by_months(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (height_id) REFERENCES heights(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (humidity_by_months_id) REFERENCES humidity_by_months(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (sunshine_id) REFERENCES sunshine(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (wind_id) REFERENCES wind(id) ON UPDATE CASCADE ON DELETE CASCADE
);


/* В этой базе данных на основании различных параметров будет вычисляться тип климата.
 * Всего 27 типов. 
 */


