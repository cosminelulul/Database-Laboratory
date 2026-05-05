USE l7; 
DELIMITER //

-- 1. Procedura de insert 
CREATE PROCEDURE insereaza(IN p_id CHAR(13), IN p_titlu VARCHAR(50), IN p_autor VARCHAR(50), IN p_pret DOUBLE)
BEGIN
    INSERT INTO carti(id_carte, titlu, autor, pret) VALUES (p_id, p_titlu, p_autor, p_pret);
END //

-- 3. Procedura UPDATE increment 
CREATE PROCEDURE updateaza(IN valoare DOUBLE)
BEGIN
    UPDATE carti SET pret = pret + valoare;
END //

-- 6. Procedura PERMUTA (swap price) [cite: 605, 606, 607]
CREATE PROCEDURE permuta(IN id1 CHAR(13), IN id2 CHAR(13))
BEGIN
    DECLARE pret1 DOUBLE;
    DECLARE pret2 DOUBLE;
    
    SELECT pret INTO pret1 FROM carti WHERE id_carte = id1;
    SELECT pret INTO pret2 FROM carti WHERE id_carte = id2;
    
    UPDATE carti SET pret = pret2 WHERE id_carte = id1;
    UPDATE carti SET pret = pret1 WHERE id_carte = id2;
END //

-- 8. IF/ELSE Categorie 
CREATE PROCEDURE afiseaza_categ(IN p_cnp CHAR(13))
BEGIN
    DECLARE total DOUBLE;
    SELECT SUM(valoare) INTO total FROM comenzi WHERE cnp = p_cnp;
    
    IF total > 11 THEN SELECT 'categ1' AS Categorie;
    ELSEIF total >= 8 THEN SELECT 'categ2' AS Categorie;
    ELSE SELECT 'categ3' AS Categorie;
    END IF;
END //

DELIMITER ;