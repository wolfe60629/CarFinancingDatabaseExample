SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeremy Wolfe
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION jawolf7279.Calc_Payment 
(	
	@principle money, 
	@rate float,
	@paymentlength int
)
RETURNS TABLE 
AS
RETURN 
(	 
	select (round((@principle*(@rate*power(1+@rate,(@paymentlength*12)))) / (power(1+@rate,(@paymentlength*12))-1),2)) AS "MIN PAYMENT"
)
GO
