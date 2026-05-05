-- 1-4. Gestionare Baza de Date 
CREATE DATABASE IF NOT EXISTS lib3_test;
SHOW DATABASES;
DROP DATABASE lib3_test;
CREATE DATABASE lib3_test;
USE lib3_test;

-- 5. Crearea tabelelor cu tipuri si chei 
CREATE TABLE clienti (
    cnp CHAR(13) NOT NULL PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    tel CHAR(10),
    oras VARCHAR(50),
    data_inreg DATE DEFAULT CURRENT_DATE
); [cite: 242]

CREATE TABLE comenzi (
    id_comanda INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cnp CHAR(13) NOT NULL,
    valoarea DOUBLE NOT NULL,
    data DATE,
    FOREIGN KEY (cnp) REFERENCES clienti(cnp) ON DELETE CASCADE ON UPDATE CASCADE
); [cite: 243, 252, 253]

CREATE TABLE carti (
    id_carte CHAR(13) NOT NULL PRIMARY KEY,
    titlu VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    pret_buc DOUBLE NOT NULL
); [cite: 245]

CREATE TABLE carti_comandate (
    id_comanda INT UNSIGNED NOT NULL,
    id_carte CHAR(13) NOT NULL,
    cantitate INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (id_comanda, id_carte),
    FOREIGN KEY (id_comanda) REFERENCES comenzi(id_comanda) ON DELETE CASCADE,
    FOREIGN KEY (id_carte) REFERENCES carti(id_carte) ON DELETE CASCADE
); [cite: 244]

-- Inserare date 
INSERT INTO clienti (cnp, nume, tel, oras) VALUES ('1234567890123', 'Ion', '0700000000', 'Bucuresti'), ('9876543210987', 'Maria', '0711111111', 'Cluj');
INSERT INTO carti (id_carte, titlu, autor, pret_buc) VALUES ('C1', 'Titlu 1', 'Autor 1', 25.5), ('C2', 'Titlu 2', 'Autor 2', 50.0);
INSERT INTO comenzi (cnp, valoarea, data) VALUES ('1234567890123', 25.5, '2023-10-01'), ('9876543210987', 100.0, '2023-10-02');
INSERT INTO carti_comandate (id_comanda, id_carte, cantitate) VALUES (1, 'C1', 1), (2, 'C2', 2);

-- 6-7. Clonare tabel 
CREATE TABLE carti1 LIKE carti; 
INSERT INTO carti1 SELECT * FROM carti; 