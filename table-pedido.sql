USE [DESAFIOPRATICO]
GO

/****** Object:  Table [dbo].[Pedido]    Script Date: 08/03/2021 10:27:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pedido](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[cardapio_id] [int] NOT NULL,
	[promocao_id] [int] NOT NULL,
	[valor_total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDO_PROMOCAO] FOREIGN KEY([promocao_id])
REFERENCES [dbo].[Promocao] ([ID])
GO

ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_PEDIDO_PROMOCAO]
GO


