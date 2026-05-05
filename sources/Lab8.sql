USE l7; 

-- 1. Functii STRING (CONCAT) 
SELECT CONCAT('ID CARTE: ', id_carte, '; titlu carte: ', titlu, '; pret carte: ', pret) AS info_carte FROM carti;

-- 2-3. Truncate / Round 
SELECT TRUNCATE(pret, 2) FROM carti;
SELECT ROUND(pret, 2) FROM carti;

-- 4-5. Functii DATE 
SELECT DATE_ADD(data_inreg, INTERVAL 3 DAY) FROM clienti;
SELECT DATEDIFF(CURDATE(), data) FROM comenzi;

-- UPDATE, DELETE, ALTER 
-- 1. 
UPDATE carti SET pret = pret + 1;

-- 3. 
UPDATE carti 
LEFT JOIN carti_comandate ON carti.id_carte = carti_comandate.id_carte 
SET pret = pret - 1 
WHERE carti_comandate.id_comanda IS NULL;

-- 4-7. ALTER TABLE
ALTER TABLE carti ADD pret_nou DOUBLE;
UPDATE carti SET pret_nou = pret;
ALTER TABLE carti MODIFY titlu VARCHAR(50);
ALTER TABLE carti CHANGE pret_nou pret_nou1 FLOAT;

-- 8. Drop FK 
ALTER TABLE comenzi DROP FOREIGN KEY `comenzi_ibfk_1`;

-- 11-12. DELETE 
DELETE FROM comenzi WHERE id_comanda = 1;
DELETE FROM clienti WHERE cnp = '1235';