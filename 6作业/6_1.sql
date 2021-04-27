DROP FUNCTION IF EXISTS func_rand_ID;

CREATE FUNCTION func_rand_ID() RETURNS VARCHAR(18)
BEGIN
	DECLARE result VARCHAR(18) DEFAULT '';
	DECLARE first_num VARCHAR(6) DEFAULT '';
	DECLARE birthday VARCHAR(8) DEFAULT '';
	DECLARE second_num VARCHAR(3) DEFAULT '';
	DECLARE last_num VARCHAR(1) DEFAULT '';
	DECLARE charset VARCHAR(11) DEFAULT '';
	DECLARE interday INT DEFAULT 0;
	DECLARE numset varchar(10) DEFAULT '';
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;

	SET numset = "0123456789";
	SET charset = "0123456789X";

	#处理1-6位置上
	WHILE i<6
		SET first_num = CONCAT(first_num, substring(numset,FLOOR(1+RAND()*10),1));
		SET i = i + 1;
	END while;
	#SET first_num = rand()*100000;
	
	#处理生日
	SET interday = floor(RAND()*21915);#时间间隔
	SET birthday = DATE_ADD("1960-01-01",INTERVAL interday day);
	
	#处理15-17位置上
	WHILE j<3
		SET second_num = CONCAT(second_num,substring(numset,FLOOR(1+RAND()*10),1));
		SET j = j + 1;
	END while;
	#SET second_num = floor(RAND()*100);

	#处理最后一位
	SET last_num = substring(charset,FLOOR(1+RAND()*11),1);
	
	#合并结果
	result = CONCAT(result, first_num, birthday, second_num, last_num);

	RETURN result;
END;

SELECT func_rand_ID();
/*
第1-6位为0-9之间的数字，
第7-14位为19600101到20200101之间的某个有效日期，
20200101-19600101 60年
第15-17位为0-9之间的数字，
第18位为0-9之间的数字或大写X。
*/