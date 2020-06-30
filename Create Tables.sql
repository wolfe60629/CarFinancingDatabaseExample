 /* 
 The final project that I choose will simulate datascans database. 
 Think of a wholesale finance company.
 */
   CREATE TABLE JAWOLF7279.CUSTOMER (
	[CUSTOMER_ID]        INT          PRIMARY KEY   NOT NULL   IDENTITY(7001,1)                   ,
	[CUSTOMER_NAME]      VARCHAR(50)                NOT NULL                                      ,
	[EMAIL_ADDRESS]      VARCHAR(50)                NOT NULL                                      ,
	[ADDRESS1]           VARCHAR(100)               NOT NULL                                      ,
	[ADDRESS2]           VARCHAR(50)                NOT NULL                                      ,
	[CITY]               VARCHAR(20)                NOT NULL                                      ,
	[STATE]              VARCHAR(30)                NOT NULL                                      ,
	[ZIP]                INT                        NOT NULL                                      
 );
 CREATE TABLE JAWOLF7279.USERS ( 
	[USER_ID]            INT          PRIMARY KEY   NOT NULL   IDENTITY(9001,1)         ,
	[CUSTOMER_ID]        INT                        NOT NULL                            ,
	[USER_NAME]          VARCHAR(50)                NOT NULL                            ,
	[PASSWORD_HASH]      BINARY(64)                 NOT NULL                            ,
	[LAST_LOGIN]         DATETIME                   NULL       DEFAULT(NULL)            ,
	[CREATION_DATE]      DATETIME                   NULL       DEFAULT(GETDATE())       ,
	[ISACTIVATED]        BIT                        NOT NULL                            ,

	CONSTRAINT FK_CUST_Customer_ID FOREIGN KEY ([CUSTOMER_ID])
	REFERENCES JAWOLF7279.CUSTOMER ([CUSTOMER_ID])
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

 CREATE TABLE JAWOLF7279.VEHICLE (
	[VEHICLE_ID]         INT          PRIMARY KEY   NOT NULL   IDENTITY(8001,1)         ,
	[MAKE]               VARCHAR(50)                NOT NULL                            ,
	[MODEL]              VARCHAR(50)                NOT NULL                            , 
	[YEAR]               INT                        NOT NULL                            ,
	[VIN]                VARCHAR(17)                NOT NULL
 );



  CREATE TABLE JAWOLF7279.DEALER (
	[DEALER_ID]          INT          PRIMARY KEY   NOT NULL   IDENTITY(6001,1)                   ,
	[DEALER_NAME]        VARCHAR(50)                NOT NULL                                      ,
	[ADDRESS1]           VARCHAR(100)               NOT NULL                                      ,
	[ADDRESS2]           VARCHAR(50)                NOT NULL                                      ,
	[CITY]               VARCHAR(20)                NOT NULL                                      ,
	[STATE]              VARCHAR(30)                NOT NULL                                      ,
	[ZIP]                INT                        NOT NULL                                      
 );

  CREATE TABLE JAWOLF7279.DEALER_INVENTORY (
	[INVENTORY_ID]       INT         PRIMARY KEY    NOT NULL   IDENTITY(5001,1)                     ,
	[VEHICLE_ID]         INT                        NOT NULL                                        ,
	[DEALER_ID]          INT                        NOT NULL                                        ,
	[INVENTORYADDDATE]   DATETIME                   NOT NULL   DEFAULT(GETDATE())                   ,
	[ISONHAND]           BIT                        NOT NULL   DEFAULT(1)                           , 

	CONSTRAINT  FK_INV_VEHICLE_ID FOREIGN KEY (VEHICLE_ID)
		REFERENCES JAWOLF7279.VEHICLE(VEHICLE_ID)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	CONSTRAINT FK_INV_DEALER_ID FOREIGN KEY (DEALER_ID)
		REFERENCES JAWOLF7279.DEALER (DEALER_ID)
			ON DELETE CASCADE
			ON UPDATE CASCADE
 );


   CREATE TABLE JAWOLF7279.TRANSACTIONS ( 
	[TRANSACTION_ID]     INT         PRIMARY KEY    NOT NULL   IDENTITY(4001,1)                       ,
	[CUSTOMER_ID]        INT                        NOT NULL                                          ,
	[INVENTORY_ID]       INT                        NOT NULL                                          ,
	[TRANSACTION_DATE]   DATETIME                   NOT NULL   DEFAULT(GETDATE())                     ,
	[TRANSACTION_AMT]    MONEY                      NOT NULL                                          ,

	CONSTRAINT  FK_TRANS_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID)
		REFERENCES JAWOLF7279.CUSTOMER(CUSTOMER_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT FK_TRANS_INVENTORY_ID FOREIGN KEY (INVENTORY_ID)
		REFERENCES JAWOLF7279.DEALER_INVENTORY (INVENTORY_ID)
 );


 CREATE TABLE JAWOLF7279.LOAN (
	[LOAN_ID]        INT    PRIMARY KEY    NOT NULL    IDENTITY(1001,1)     ,
	[CUSTOMER_ID]    INT                   NOT NULL                         ,
	[VEHICLE_ID]     INT    UNIQUE         NOT NULL                         ,
	[LOAN_AMOUNT]    MONEY                 NOT NULL                         ,
	[APR_RATE]       FLOAT                 NOT NULL                         ,
	[LOAN_LENGTH]    INT                   NOT NULL                         ,
	[MIN_PAYMENT]    MONEY                 NOT NULL                         ,
	[CURR_PRINC_AMT] MONEY                 NOT NULL                         ,

	CONSTRAINT  FK_LOAN_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID)
		REFERENCES JAWOLF7279.CUSTOMER(CUSTOMER_ID)
			ON DELETE CASCADE
			ON UPDATE CASCADE,

	CONSTRAINT FK_LOAN_VEHICLE_ID FOREIGN KEY (VEHICLE_ID)
		REFERENCES JAWOLF7279.VEHICLE (VEHICLE_ID)  
			ON DELETE CASCADE
			ON UPDATE CASCADE                                           
 );
 
 CREATE TABLE JAWOLF7279.LOAN_PAYMENT ( 
	[PAYMENT_ID]       INT        PRIMARY KEY   NOT NULL IDENTITY(1,1)       ,
	[LOAN_ID]          INT                      NOT NULL                     ,
	[PAYMENT_METHOD]   VARCHAR(10)              NOT NULL                     ,
	[PAYMENT_AMOUNT]   MONEY                    NOT NULL                     ,
	[TRANSACTION_DATE] DATE                     NOT NULL DEFAULT(GETDATE())  ,

	CONSTRAINT FK_PAYMENT_LOAN_ID FOREIGN KEY (LOAN_ID)
		REFERENCES JAWOLF7279.LOAN (LOAN_ID)
			ON DELETE CASCADE
			ON UPDATE CASCADE 
 );





