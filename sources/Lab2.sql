USE lib3_test;

-- 1-2. Coloane Virtuale (Generated Columns) 
CREATE TABLE comenzi1 (
  id_comanda INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cnp CHAR(13) NOT NULL, 
  valoarea DOUBLE DEFAULT 0.0,
  data DATE,
  costuri DOUBLE NOT NULL DEFAULT 0.0,
  profit DOUBLE GENERATED ALWAYS AS (valoarea - costuri) VIRTUAL
); [cite: 39]

INSERT INTO comenzi1 (cnp, valoarea, costuri) VALUES ('1234567890123', 100.0, 70.0); 

-- Check Constraints pentru tabelul carti4 
-- In MySQL 5.7, clauza CHECK este analizata dar ignorata. Aceasta este sintaxa standard ceruta.
CREATE TABLE carti4 (
    id_carte CHAR(13) NOT NULL PRIMARY KEY,
    titlu VARCHAR(50) NOT NULL,
    autor VARCHAR(50) NOT NULL,
    pret DOUBLE NOT NULL,
    data_inregistrarii DATE,
    CONSTRAINT chk_pret CHECK (pret > 0),
    CONSTRAINT chk_id_len CHECK (CHAR_LENGTH(id_carte) = 5),
    CONSTRAINT chk_autor_len CHECK (CHAR_LENGTH(autor) = 3),
    CONSTRAINT chk_autor_a CHECK (autor LIKE 'a%'),
    CONSTRAINT chk_autor_A_mare CHECK (ASCII(SUBSTRING(autor, 1, 1)) = 65),
    CONSTRAINT chk_autor_Amare_3 CHECK (ASCII(SUBSTRING(autor, 1, 1)) = 65 AND CHAR_LENGTH(autor) = 3),
    CONSTRAINT chk_titlu_mate CHECK (titlu LIKE '%Mate%'),
    CONSTRAINT chk_data_90 CHECK (YEAR(data_inregistrarii) > 1990),
    CONSTRAINT chk_luna_oct CHECK (MONTH(data_inregistrarii) = 10),
    CONSTRAINT chk_oct_1930 CHECK (MONTH(data_inregistrarii) = 10 AND YEAR(data_inregistrarii) > 1930),
    CONSTRAINT chk_autor_a_poz2 CHECK (SUBSTRING(autor, 2, 1) IN ('a', 'A')),
    CONSTRAINT chk_autor_amic_poz2 CHECK (ASCII(SUBSTRING(autor, 2, 1)) = 97),
    CONSTRAINT chk_autor_start_ab CHECK (autor LIKE 'a%' OR autor LIKE 'b%'),
    CONSTRAINT chk_autor_a_b CHECK (autor LIKE 'a%b'),
    CONSTRAINT chk_autor_has_ab CHECK (autor LIKE '%a%' AND autor LIKE '%b%'),
    CONSTRAINT chk_autor_has_a_or_b CHECK (autor LIKE '%a%' OR autor LIKE '%b%'),
    CONSTRAINT chk_id_start CHECK (id_carte LIKE '1%' OR id_carte LIKE '2%' OR id_carte LIKE '5%'),
    CONSTRAINT chk_autor_not_a CHECK (autor NOT LIKE 'a%'),
    CONSTRAINT chk_autor_not_ab CHECK (autor NOT LIKE 'a%' AND autor NOT LIKE 'b%')
);