INSERT INTO jawolf7279.CUSTOMER (CUSTOMER_NAME,EMAIL_ADDRESS, ADDRESS1, ADDRESS2, CITY, [STATE], ZIP)
	VALUES ('Jeremy Wolfe','jawolfe@tds.net','27 Shoal Creek Court', '' ,'Dawsonville', 'Georgia', 30534),
		   ('Megan Land','megan@land.com', '404 Crossover Street', '' ,'Hoboken','New Jersey', 07086),
		   ('Michelle Phipher','mph54@gmail.com','5821 Handover Drive','','Chattanooga','Tennesse',37341),
		   ('Jill Taylor','Jill.Taylor@company.com','1342 Tomahawk Drive','','Negley','Ohio', 44441),
		   ('Deidra Wilkens','DDWilks@live.com','68 Longmeadow Drive','','Clemmons','North Carolina', 46424),
		   ('Simon Dorkle','Siomon@says.com','143 King Street','','Mechanicstown','Montana', 58564);

INSERT INTO JAWOLF7279.USERS (CUSTOMER_ID, [USER_NAME], PASSWORD_HASH, ISACTIVATED)
	VALUES (7001,(select lower(email_address) from jawolf7279.customer where customer_id = 7001), HASHBYTES('md5', 'HowlLik3Wind'),1),
		   (7002,(select lower(email_address) from jawolf7279.customer where customer_id = 7002), HASHBYTES('md5', 'Land4Life'),1),
		   (7003,(select lower(email_address) from jawolf7279.customer where customer_id = 7003), HASHBYTES('md5', 'Wowzers3#'),1),
		   (7004,(select lower(email_address) from jawolf7279.customer where customer_id = 7004), HASHBYTES('md5', 'TayTay&Me'),1),
		   (7005,(select lower(email_address) from jawolf7279.customer where customer_id = 7005), HASHBYTES('md5', 'Barneyboo!'),1),
		   (7006,(select lower(email_address) from jawolf7279.customer where customer_id = 7006), HASHBYTES('md5', 'JumpUp&Down'),1);

INSERT INTO JAWOLF7279.VEHICLE (MAKE, MODEL, [YEAR], [VIN])
	VALUES ('Ford', 'Fusion', 2009, 'JHMBB2152PC000551'),
		   ('Ford', 'F150', 2018, '1FAFP4041YF104575'),
		   ('Volkswagon', 'Karmann Ghia', 1974 , '1FAFP40403F349201'),
		   ('Volvo', 'S60', 2013 , '1GCCC14H6GF495516'),
		   ('Bentley', 'Continental', 2006 , '2GDHG31K4N4510891'),
		   ('Audi', 'A3', 2004 , '1FDXS85A6MVA97931'),
		   ('Mitsubishi', 'Eclispe', 2008 , 'TRUUT28N741024855'),
		   ('Mazda', 'RX-8', 2008 , '1GDT8C4A19F409575'),
		   ('Volkswagon', 'Golf', 2019 , '1GNFC13077R267829');

INSERT INTO JAWOLF7279.DEALER (DEALER_NAME, ADDRESS1, ADDRESS2, CITY, [STATE], ZIP)
	VALUES ('Cherokee Ford', '13 Dealer Lane', '', 'Canton', 'Georgia', 30114),
		   ('Wolfe Motors', '5462 Main Street', '', 'Dawsonville', 'Georgia', 30534),
		   ('Allan & Allen Auto', '548 Morrison Drive', '', 'Dawsonville', 'Georgia', 30534),
		   ('Micheal Money Dealers', '8964 Chestatee HWY', '', 'Dahlonega', 'Georgia', 30533),
		   ('Jeremys Junk Auto', '5545 HWY 53 E', '', 'Dawsonville', 'Georgia', 30534);

INSERT INTO JAWOLF7279.DEALER_INVENTORY (VEHICLE_ID, DEALER_ID)
	VALUES (8001,6002),
		   (8002,6002),
		   (8003,6001),
		   (8004,6003),
		   (8005,6001),
		   (8006,6001),
		   (8007,6004),
		   (8008,6001),
		   (8009,6005);


INSERT INTO JAWOLF7279.TRANSACTIONS (CUSTOMER_ID, INVENTORY_ID, TRANSACTION_AMT) 
	VALUES (7001,5001,7235.00),
		   (7003,5002,23854.25),
		   (7005,5008,5465.45),
		   (7004,5004,6466.50),
		   (7002,5009,4786.10),
		   (7006,5003,9875.05);

-- UPDATE IS ON HAND FOR BOUGHT VEHICLES
UPDATE JAWOLF7279.DEALER_INVENTORY 
SET ISONHAND = 0
WHERE VEHICLE_ID IN (SELECT VEHICLE_ID  
FROM JAWOLF7279.TRANSACTIONS AS "T"
JOIN JAWOLF7279.DEALER_INVENTORY AS "I"
	ON T.INVENTORY_ID = I.INVENTORY_ID);


EXEC jawolf7279.BUY_VEHICLE 'Johnny Wolfe', 'JKKWOLFE@TDS.NET', '206 Arrowhead Drive', 'APT 134', 'Sparta', 'Georgia', 30533, 2017, 'Ford', 'F150', '3C63RRGL5FG512436', 6005, 4025.36;
EXEC jawolf7279.SELL_VEHICLE 'Milly Boatwright' , 'mmil@gmail.com', '1MillyRun',  '87 hoagin mill rd', '' , 'ball ground', 'georgia', 30107, 8010, 10456.21, 5, .02;
EXEC JAWOLF7279.PAY_LOAN 1001, 300.80, 'CASH';




