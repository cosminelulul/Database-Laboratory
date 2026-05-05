USE lib3_test;

CREATE TABLE clienti10(
  cnp CHAR(13) NOT NULL PRIMARY KEY,
  nume VARCHAR(20) NOT NULL, 
  oras VARCHAR(20) NOT NULL,  
  tel CHAR(10), 
  email VARCHAR(50),
  data_inreg DATE DEFAULT '2019-10-23'
); 

DELIMITER //

-- Exemple REGEXP (reunite intr-un singur trigger de validare pt concizie si eficienta, conform cerintelor 1-25) 
CREATE TRIGGER trg_clienti10_regexp BEFORE INSERT ON clienti10
FOR EACH ROW
BEGIN
    -- 1. nume numai litere 
    IF NEW.nume NOT REGEXP '^[a-zA-Z]+$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Numele trebuie sa contina doar litere.'; 
    END IF;
    
    -- 3. cnp exact 13 cifre 
    IF NEW.cnp NOT REGEXP '^[0-9]{13}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CNP-ul trebuie sa contina exact 13 cifre.';
    END IF;

    -- 6. cnp incepand cu 1, 2, 5, 6 si 13 cifre 
    IF NEW.cnp NOT REGEXP '^[1256][0-9]{12}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CNP invalid pt regula de start (1,2,5,6).'; 
    END IF;

    -- 14. telefon 10 cifre [cite: 380]
    IF NEW.tel IS NOT NULL AND NEW.tel NOT REGEXP '^[0-9]{10}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Telefon invalid.'; 
    END IF;

    -- 17. email contine @, termina in .com, doar litere 
    IF NEW.email IS NOT NULL AND NEW.email NOT REGEXP '^[a-zA-Z]+@[a-zA-Z]+\\.com$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email invalid (doar litere si .com).'; 
    END IF;
END //

DELIMITER ;