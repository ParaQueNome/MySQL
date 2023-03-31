

CREATE TABLE movimentacao(
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 	datamovimento DATE NOT NULL,
 	idproduto INTEGER NOT NULL,
 	quantidade INTEGER NOT NULL,
 	precounitario DECIMAL(10,2),
 	tipomovimento CHAR(1),
 	mumdocto INTEGER,
	FOREIGN KEY(idproduto) REFERENCES produto(id)
	);
	
DELIMITER @
CREATE TRIGGER TRG_ATUALIZAESTOQUE
	AFTER INSERT ON itemvenda
	FOR EACH ROW
	BEGIN
		UPDATE produto
		SET ESTOQUE = ESTOQUE - NEW.quantidade
		WHERE id = NEW.idproduto;
		
		INSERT INTO movimentacao 
		VALUES(NULL, CURDATE(), NEW.idproduto, NEW.quantidade, NEW.precounitario, "S", NEW.idvenda);

	END @
DELIMITER ;
	
DELIMITER @
CREATE or replace TRIGGER TRG_ATUALIZAESTOQUEBEFORE_UPDATE
	BEFORE UPDATE ON itemvenda
	FOR EACH ROW 
	BEGIN 
	
	DECLARE qtdestoque INT;
	SELECT estoque FROM produto WHERE id = NEW.idproduto INTO qtdestoque;
	
	IF (new.quantidade <= qtdestoque) then
		UPDATE produto
		SET estoque = estoque - (NEW.quantidade - OLD.quantidade)
		WHERE id = NEW.idproduto;
	ELSE 
		UPDATE produto
		SET NEW.quantidade = OLD.quantidade
		WHERE id = NEW.idproduto;
	END if;
	if (OLD.quantidade > NEW.quantidade) then
		UPDATE produto
		SET estoque = estoque + (OLD.quantidade - NEW.quantidade)
		WHERE id = NEW.idproduto;
	END if;
END @
DELIMITER ;		
		
		
	