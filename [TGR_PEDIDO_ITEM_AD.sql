USE [DESAFIOPRATICO]
GO
/****** Object:  Trigger [dbo].[TGR_PEDIDO_ITEM_AD]    Script Date: 08/03/2021 10:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TGR_PEDIDO_ITEM_AD]
ON [dbo].[Pedido_Item]
AFTER DELETE
AS
BEGIN
    DECLARE @PEDIDO_ID INT
    SELECT @PEDIDO_ID = PEDIDO_ID FROM DELETED
	exec pr_aplicar_promocao_pedido @PEDIDO_ID
	
    

END
