SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create FUNCTION JAWOLF7279.FUTURE_VALUE (

@RATE FLOAT,                     
@PAYMENTMADE MONEY,      
@PV MONEY 

)
RETURNS TABLE
AS
	RETURN
(
 SELECT (@PV*POWER(1+@RATE,1))-@PAYMENTMADE AS "FUTURE VALUE"
)
GO
