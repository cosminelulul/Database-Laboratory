USE l7; 

-- 1. INNER JOIN Comenzi cu nume
SELECT clienti.nume, comenzi.* FROM clienti INNER JOIN comenzi ON clienti.cnp = comenzi.cnp; 

-- 2. INNER JOIN cu 3 tabele pt comanda 2 
SELECT carti.titlu, carti.pret, carti_comandate.cantitate 
FROM carti 
INNER JOIN carti_comandate ON carti.id_carte = carti_comandate.id_carte
WHERE carti_comandate.id_comanda = 2;

-- 3. DISTINCT
SELECT DISTINCT carti.id_carte, carti.titlu, carti.pret 
FROM carti 
INNER JOIN carti_comandate ON carti.id_carte = carti_comandate.id_carte;

-- 6. LEFT JOIN (clienti fara comenzi)
SELECT clienti.nume FROM clienti 
LEFT JOIN comenzi ON clienti.cnp = comenzi.cnp 
WHERE comenzi.id_comanda IS NULL;

-- 8. NATURAL JOIN 
SELECT * FROM comenzi NATURAL JOIN clienti;

-- 11. CREATE VIEW
CREATE VIEW view_comenzi_client AS 
SELECT UPPER(clienti.nume) as nume_client, comenzi.* FROM clienti INNER JOIN comenzi ON clienti.cnp = comenzi.cnp;

-- 13. UNION ALL 
SELECT clienti.nume, clienti.cnp FROM clienti LEFT JOIN comenzi ON clienti.cnp = comenzi.cnp WHERE comenzi.id_comanda IS NULL
UNION ALL
SELECT clienti.nume, clienti.cnp FROM clienti INNER JOIN comenzi ON clienti.cnp = comenzi.cnp;

-- 15. Sortari
SELECT * FROM comenzi WHERE YEAR(data) = 2018 ORDER BY valoare DESC;