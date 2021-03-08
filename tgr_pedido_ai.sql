USE [DESAFIOPRATICO]
GO

/****** Object:  Trigger [dbo].[TGR_PEDIDO_AI]    Script Date: 08/03/2021 10:30:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[TGR_PEDIDO_AI]
ON [dbo].[Pedido]
AFTER INSERT
AS
BEGIN
    DECLARE
    @VALOR  DECIMAL(10,2),
    @PEDIDO_ID INT,
	@CARDAPIO_ID INT

    SELECT @PEDIDO_ID = ID, @CARDAPIO_ID = CARDAPIO_ID FROM INSERTED
	SELECT @VALOR = VALOR FROM vwLanche WHERE ID = @CARDAPIO_ID

    INSERT INTO PEDIDO_ITEM(PEDIDO_ID,INGREDIENTE_ID)
	SELECT @PEDIDO_ID,CI.INGREDIENTE_ID FROM CARDAPIO_INGREDIENTE CI WHERE CI.CARDAPIO_ID = @CARDAPIO_ID

	UPDATE PEDIDO SET VALOR_TOTAL = @VALOR WHERE ID = @PEDIDO_ID

END

GO

