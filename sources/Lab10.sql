USE l7; 

-- Tranzactii (Rulati individual in consola pt verificare)
-- Explicatie: UPDATE 1 este commit-uit. UPDATE 3 este intr-o tranzactie noua implicitly dar este urmat de rollback.
-- Rezultat asteptat: pret = 1.
SET autocommit = 1;
START TRANSACTION;
UPDATE carti SET pret = 1 WHERE id_carte = '1234';
COMMIT;
UPDATE carti SET pret = 3 WHERE id_carte = '1234';
ROLLBACK;
SELECT pret FROM carti WHERE id_carte = '1234';

-- 7. SAVEPOINT 
-- Explicatie: Ne intoarcem la punctul p1, stergand modificarile facute de update-ul spre pret=3.
-- Rezultat asteptat: pret = 2.
SET autocommit = 1;
UPDATE carti SET pret = 1 WHERE id_carte = '1234';
SET autocommit = 0;
UPDATE carti SET pret = 2 WHERE id_carte = '1234';
SAVEPOINT p1;
UPDATE carti SET pret = 3 WHERE id_carte = '1234';
SAVEPOINT p2;
ROLLBACK TO p1;
SELECT pret FROM carti WHERE id_carte = '1234';

-- Sistemul de privilegii MySQL 
-- 1. 
CREATE USER 'nume_familie'@'localhost' IDENTIFIED BY 'parola_sigura';

-- 3. (Din root admin) 
ALTER USER 'nume_familie'@'localhost' IDENTIFIED BY 'parola_noua';

-- 4. 
GRANT SELECT, UPDATE, ALTER, CREATE, DELETE, DROP ON l7.* TO 'nume_familie'@'localhost';

-- 5.
SHOW GRANTS FOR 'nume_familie'@'localhost';

-- 8. 
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'nume_familie'@'localhost';

-- 9. 
DROP USER 'nume_familie'@'localhost';