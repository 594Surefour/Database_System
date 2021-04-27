DROP PROCEDURE IF EXISTS createTestCases;

CREATE PROCEDURE createTestCases ()
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE id INT DEFAULT 0;
	DECLARE name VARCHAR(8) DEFAULT '';
	DECLARE mail VARCHAR() DEFAULT '';
	DECLARE phone VARCHAR() DEFAULT '';
	DECLARE code VARCHAR(18) DEFAULT '';
	DECLARE charset VARCHAR(70); 
	
	SET charset='abcdefghijklmnopqrseuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; 

	WHILE i < 100
		SELECT i INTO id;#uid
		SELECT func_rand_email() into mail;#email
		SELECT func_rand_telnum() into phone;#telephone
		SELECT func_rand_ID() into code;#ucode
		#生成username
		WHILE i<length DO    
			SET name = concat(name,substring(charset,floor(1+RAND()*62),1));    
			SET i=i+1;  
		END WHILE;
		INSERT
		
	END WHILE;
	

END;

/*
其中username是随机生成的长度为8的字符串
（符号可包括a-z、A-Z、0-9）
*/