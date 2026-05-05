USE l7; 

-- 1-15 Clauza WHERE [cite: 398-412]
SELECT id_carte, titlu, pret FROM carti WHERE pret > 1.0; 
SELECT id_carte, titlu, pret FROM carti WHERE pret BETWEEN 1.0 AND 3.0;
SELECT nume, oras, data_inreg FROM clienti WHERE data_inreg = '2019-11-25'; 
SELECT nume, oras, data_inreg FROM clienti WHERE YEAR(data_inreg) = 2016;
SELECT id_carte, titlu, pret FROM carti WHERE titlu LIKE 'L%'; 
SELECT id_carte, titlu, pret FROM carti WHERE titlu IN ('MATEMATICA', 'INFORMATICA'); 
SELECT cnp, nume, tel FROM clienti WHERE tel IS NULL; 
SELECT cnp, nume FROM clienti WHERE nume LIKE '%na%';
SELECT id_carte, titlu, autor FROM carti WHERE titlu LIKE '%mate%'; 
SELECT id_carte, titlu FROM carti WHERE titlu LIKE '%a';
SELECT * FROM carti WHERE id_carte NOT IN ('1234', '1235');
SELECT cnp, nume FROM clienti WHERE data_inreg BETWEEN '2014-01-01' AND '2015-12-20'; 
SELECT cnp, nume FROM clienti WHERE nume LIKE 'D%' AND YEAR(data_inreg) = 2015;
SELECT titlu, pret FROM carti WHERE autor = 'IONESCU'; 
SELECT DISTINCT YEAR(data_inreg) FROM clienti; 