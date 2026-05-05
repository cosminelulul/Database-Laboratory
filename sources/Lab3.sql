USE lib3_test;

CREATE TABLE clienti1 (
  cnp CHAR(13) NOT NULL PRIMARY KEY,
  nume VARCHAR(20) NOT NULL, 
  an_nastere INT,
  data_inreg DATE
); 

DELIMITER //

-- 1 & 1'. Trigger data inregistrare (fallback + verificare) 
CREATE TRIGGER trg_check_date BEFORE INSERT ON clienti1
FOR EACH ROW
BEGIN
    IF (NEW.data_inreg > CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data nu poate fi in viitor.'; 
    END IF;
    IF (NEW.data_inreg IS NULL) THEN
        SET NEW.data_inreg = CURDATE(); 
    END IF;
END //

-- 2. Nume exact 4 caractere [cite: 321]
CREATE TRIGGER trg_nume_4_chars BEFORE INSERT ON clienti1
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.nume) != 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Numele trebuie sa aiba exact 4 caractere.';
    END IF;
END //

-- 6. CNP exact 4 cifre 
CREATE TRIGGER trg_cnp_4_cifre BEFORE INSERT ON clienti1
FOR EACH ROW
BEGIN
    IF NEW.cnp NOT REGEXP '^[0-9]{4}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CNP-ul trebuie sa fie din exact 4 cifre.';
    END IF;
END //

-- 8. Trigger carti pret > 10.5 
CREATE TRIGGER trg_pret_10_5 BEFORE INSERT ON carti4
FOR EACH ROW
BEGIN
    IF (NEW.pret <= 10.5) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pretul trebuie sa fie strict > 10.5'; 
    END IF;
END //

-- 10. Completare automata an nastere (presupunand format standard) 
CREATE TRIGGER trg_auto_an_nastere BEFORE INSERT ON clienti1
FOR EACH ROW
BEGIN
    DECLARE secol INT;
    IF SUBSTRING(NEW.cnp, 1, 1) IN ('1', '2') THEN SET secol = 1900; 
    ELSEIF SUBSTRING(NEW.cnp, 1, 1) IN ('5', '6') THEN SET secol = 2000; 
    ELSE SET secol = 0; 
    END IF;
    
    IF NEW.an_nastere IS NULL AND secol > 0 THEN
        SET NEW.an_nastere = secol + CAST(SUBSTRING(NEW.cnp, 2, 2) AS UNSIGNED);
    END IF;
END //

DELIMITER ;