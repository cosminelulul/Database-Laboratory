USE l7;

-- 1. GROUP BY sum, count 
SELECT clienti.cnp, clienti.nume, SUM(comenzi.valoare) AS valoare_totala, COUNT(comenzi.id_comanda) AS numar_comenzi
FROM clienti 
INNER JOIN comenzi ON clienti.cnp = comenzi.cnp 
GROUP BY clienti.cnp, clienti.nume;

-- 2. HAVING 
SELECT clienti.cnp, clienti.nume, SUM(comenzi.valoare) AS valoare_totala
FROM clienti 
INNER JOIN comenzi ON clienti.cnp = comenzi.cnp 
GROUP BY clienti.cnp, clienti.nume 
HAVING SUM(comenzi.valoare) >= 8;

-- 5. GROUP BY pe 3 tabele pt anul 2019 
SELECT carti.titlu, SUM(carti_comandate.cantitate) AS cantitate_totala
FROM carti 
INNER JOIN carti_comandate ON carti.id_carte = carti_comandate.id_carte 
INNER JOIN comenzi ON comenzi.id_comanda = carti_comandate.id_comanda
WHERE YEAR(comenzi.data) = 2019 
GROUP BY carti.id_carte, carti.titlu;

-- 11. AVG per an 
SELECT YEAR(data) as anul, AVG(valoare) as medie 
FROM comenzi 
GROUP BY YEAR(data);

-- 16. DISTINCT clienti in 2019 
SELECT COUNT(DISTINCT cnp) FROM comenzi WHERE YEAR(data) = 2019;