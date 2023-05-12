delimiter $
CREATE OR REPLACE FUNCTION hello(n VARCHAR(20)) RETURNS VARCHAR(50)
BEGIN

	RETURN CONCAT('Ola, ',n,'!!');
END $
delimiter ;

SELECT hello('Nilton');



delimiter $
CREATE OR REPLACE FUNCTION hello2 (n VARCHAR(20)) RETURNS VARCHAR(50)
BEGIN
	DECLARE msg VARCHAR(50);
	if CURTIME() < '12:00:00' then
		SET msg = 'Bom dia, ';
	ELSEif(CURTIME() < '18:00:00') then
		SET msg = 'Boa tarde, ';
	else
		SET msg = 'Boa noite, ';
	END if ;
	set msg = CONCAT(msg,n,'!!');
	RETURN msg;
END $
delimiter ;

SELECT hello2('Nilton');

delimiter $
CREATE OR REPLACE FUNCTION media(idcliente float) RETURNS FLOAT
BEGIN
	DECLARE media float;
	SELECT SUM(b.quantidade * b.precounitario) / (SELECT COUNT(*) FROM venda c WHERE c.idcliente = a.idcliente)
	FROM venda a, itemvenda b
	WHERE b.idvenda = a.id
	AND a.idcliente = idcliente
	INTO media;
	
	if(media IS NULL) then
		RETURN 0;
	else
		RETURN media;
	END if ;
	

END $ 
delimiter ;

SELECT media(15);
