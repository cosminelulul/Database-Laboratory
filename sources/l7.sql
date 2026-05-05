-- Crearea bazei de date de baza l7 [cite: 415, 416]
DROP DATABASE IF EXISTS l7;
CREATE DATABASE l7;
USE l7;

-- Tabel clienti [cite: 419]
DROP TABLE IF EXISTS clienti;
CREATE TABLE clienti(
  cnp char(13) NOT NULL PRIMARY KEY,
  nume VARCHAR(20) NOT NULL, 
  oras VARCHAR(20),  
  tel  CHAR(13), 
  data_inreg DATE
);

INSERT INTO clienti(cnp,nume, oras,tel, data_inreg) VALUES
('1234','ION','ARAD','1212','2014-10-14'),
('1235','DAN','BUCURESTI','3333','2015-11-15'),
('1236','ANA','SIBIU','4444','2016-12-16'),
('1237','MARIA','GIURGIU','5555','2017-10-14'),
('1238','DANA','GALATI','6666','2018-11-15'),
('1239','LIA','SUCEAVA','7777','2018-12-16'); [cite: 427, 428, 429, 430, 431, 432, 433]

INSERT INTO clienti(cnp,nume, oras,data_inreg) VALUES
('2234','ION1','ARAD','2014-10-14'),
('2235','DAN1','BUCURESTI','2015-11-15'),
('2236','ANA1','SIBIU','2016-12-16'); [cite: 435, 436, 437, 438]

-- Tabel comenzi [cite: 441]
DROP TABLE IF EXISTS comenzi;
CREATE TABLE comenzi (
  id_comanda int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cnp char(13) NOT NULL, 
  valoare double DEFAULT 0.0,
  data Date, 
  FOREIGN KEY (cnp) REFERENCES clienti (cnp)   
); [cite: 443, 444, 445, 446, 447, 448]

-- Tabel carti [cite: 450]
DROP TABLE IF EXISTS carti;
CREATE TABLE carti(
  id_carte char(13) NOT NULL PRIMARY KEY,
  titlu VARCHAR(20), 
  autor VARCHAR(20),  
  pret double not null
); [cite: 451, 452, 453, 454]

INSERT INTO carti(id_carte,titlu,autor,pret) VALUES
('1234','MATEMATICA','IONESCU',1.0),
('1235','INFORMATICA','VASILESCU',2.0),
('1236','FIZICA','DANESCU',3.0),
('1237','GEOGRAFIE','ENESCU',4.0),
('1238','ENGLEZA','GEORGESCU',5.0),
('1239','ISTORIE','ILIESCU',6.0); [cite: 456, 457, 458, 459, 460, 461, 462]

-- Tabel carti_comandate [cite: 463]
DROP TABLE IF EXISTS carti_comandate;
CREATE TABLE carti_comandate (
  id_comanda int unsigned NOT NULL,
  id_carte char(13) NOT NULL, 
  cantitate int NOT NULL DEFAULT 0,
  PRIMARY KEY(id_comanda, id_carte),
  FOREIGN KEY (id_carte) REFERENCES carti (id_carte) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_comanda) REFERENCES comenzi (id_comanda) ON UPDATE CASCADE ON DELETE CASCADE 
); [cite: 464, 465, 466, 467, 468]

-- Trigger pentru auto-completare data comanda [cite: 470]
DELIMITER //
CREATE TRIGGER adauga_data BEFORE INSERT ON comenzi
FOR EACH ROW
BEGIN
   IF(new.data IS NULL) THEN 
       SET NEW.data=CURDATE();
   END IF;
END; //
DELIMITER ; [cite: 471, 472, 473, 474, 475, 476, 477, 478, 479, 480]

INSERT INTO comenzi(cnp,valoare) VALUES ('1234',10.0), ('1234',4.0), ('1235',13.0), ('1236',6.0); [cite: 481, 482, 483]

INSERT INTO carti_comandate VALUES 
(1,'1234',2), (1,'1235',1), (1,'1236',2),
(2,'1234',2), (2,'1235',1),
(3,'1235',2), (3,'1236',3),
(4,'1236',2); [cite: 484, 485, 486]