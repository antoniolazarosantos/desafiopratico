USE [master]
GO
/****** Object:  Database [DESAFIOPRATICO]    Script Date: 07/03/2021 16:26:15 ******/
CREATE DATABASE [DESAFIOPRATICO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DESAFIOPRATICO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\DESAFIOPRATICO.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DESAFIOPRATICO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\DESAFIOPRATICO_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DESAFIOPRATICO] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DESAFIOPRATICO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DESAFIOPRATICO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DESAFIOPRATICO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DESAFIOPRATICO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DESAFIOPRATICO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DESAFIOPRATICO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DESAFIOPRATICO] SET  MULTI_USER 
GO
ALTER DATABASE [DESAFIOPRATICO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DESAFIOPRATICO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DESAFIOPRATICO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DESAFIOPRATICO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DESAFIOPRATICO] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DESAFIOPRATICO]
GO
/****** Object:  Table [dbo].[Cardapio]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cardapio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CARDAPIO_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cardapio_Ingrediente]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cardapio_Ingrediente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INGREDIENTE_ID] [int] NOT NULL,
	[CARDAPIO_ID] [int] NOT NULL,
 CONSTRAINT [PK_CARDAPIO_INGREDIENTE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](50) NOT NULL,
	[VALOR] [numeric](10, 2) NOT NULL CONSTRAINT [DF_INGREDIENTE_VALOR]  DEFAULT ((0)),
	[GRUPO] [varchar](10) NULL,
 CONSTRAINT [PK_INGREDIENTE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 07/03/2021 16:26:15 ******/
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
/****** Object:  Table [dbo].[Pedido_Item]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido_Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PEDIDO_ID] [int] NOT NULL,
	[INGREDIENTE_ID] [int] NOT NULL,
 CONSTRAINT [PK_Pedido_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promocao]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Promocao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](15) NOT NULL,
	[QTD_PORCAO] [int] NOT NULL,
	[QTD_PORCAO_PAGA] [int] NOT NULL,
	[DESCONTO] [numeric](8, 2) NOT NULL CONSTRAINT [DF_PROMOCAO_DESCONTO]  DEFAULT ((0)),
 CONSTRAINT [PK_PROMOCAO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwLanche]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwLanche] as 
WITH VALOR_LANCHE AS (SELECT        c.id, C.DESCRICAO AS LANCHE, I.DESCRICAO, I.VALOR
                                                          FROM            dbo.Cardapio AS C CROSS JOIN
                                                           dbo.ingrediente AS I CROSS JOIN
                                                           dbo.Cardapio_Ingrediente AS CI
                                                          WHERE        (c.id = CI.CARDAPIO_ID) AND (I.ID = CI.INGREDIENTE_ID))
    SELECT        id, LANCHE, SUM(VALOR) AS VALOR
     FROM            VALOR_LANCHE
     GROUP BY id, LANCHE
GO
/****** Object:  View [dbo].[vwPedido]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPedido]
AS
SELECT        dbo.Pedido.ID, dbo.Cardapio.DESCRICAO AS lanche, dbo.Promocao.DESCRICAO AS promocao, dbo.Pedido.valor_total
FROM            dbo.Pedido INNER JOIN
                         dbo.Cardapio ON dbo.Pedido.cardapio_id = dbo.Cardapio.ID INNER JOIN
                         dbo.Promocao ON dbo.Pedido.promocao_id = dbo.Promocao.ID

GO
/****** Object:  View [dbo].[vwPedidoItem]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPedidoItem]
AS
SELECT        dbo.Pedido_Item.ID, dbo.Pedido_Item.PEDIDO_ID, dbo.Ingrediente.DESCRICAO
FROM            dbo.Pedido_Item INNER JOIN
                         dbo.Ingrediente ON dbo.Pedido_Item.INGREDIENTE_ID = dbo.Ingrediente.ID

GO
ALTER TABLE [dbo].[Cardapio_Ingrediente]  WITH CHECK ADD  CONSTRAINT [FK_CARDAPIO_INGREDIENTE_CARDAPIO] FOREIGN KEY([CARDAPIO_ID])
REFERENCES [dbo].[Cardapio] ([ID])
GO
ALTER TABLE [dbo].[Cardapio_Ingrediente] CHECK CONSTRAINT [FK_CARDAPIO_INGREDIENTE_CARDAPIO]
GO
ALTER TABLE [dbo].[Cardapio_Ingrediente]  WITH CHECK ADD  CONSTRAINT [FK_CARDAPIO_INGREDIENTE_INGREDIENTE] FOREIGN KEY([INGREDIENTE_ID])
REFERENCES [dbo].[Ingrediente] ([ID])
GO
ALTER TABLE [dbo].[Cardapio_Ingrediente] CHECK CONSTRAINT [FK_CARDAPIO_INGREDIENTE_INGREDIENTE]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDO_PROMOCAO] FOREIGN KEY([promocao_id])
REFERENCES [dbo].[Promocao] ([ID])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_PEDIDO_PROMOCAO]
GO
ALTER TABLE [dbo].[Pedido_Item]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Item_Pedido] FOREIGN KEY([PEDIDO_ID])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[Pedido_Item] CHECK CONSTRAINT [FK_Pedido_Item_Pedido]
GO
/****** Object:  StoredProcedure [dbo].[pr_aplicar_promocao_pedido]    Script Date: 07/03/2021 16:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pr_aplicar_promocao_pedido]
@pedido_id int
as
declare @valor_total decimal(10,2),@valor_carne decimal(10,2), @valor_queijo decimal(10,2)
declare @i int
declare @alface int, @bacon int, @carne int, @queijo int
declare @desconto decimal(8,2)

select @alface = count(1) from pedido_item item , ingrediente ig
where item.pedido_id = @pedido_id
and ig.id = item.INGREDIENTE_ID
and upper(ig.grupo) = 'ALFACE'

select @BACON = count(1) from pedido_item item , ingrediente ig
where item.pedido_id = @pedido_id
and ig.id = item.INGREDIENTE_ID
and upper(ig.grupo) = 'BACON'

select @carne = count(1) from pedido_item item , ingrediente ig
where item.pedido_id = @pedido_id
and ig.id = item.INGREDIENTE_ID
and upper(ig.grupo) = 'CARNE'

select @queijo = count(1) from pedido_item item , ingrediente ig
where item.pedido_id = @pedido_id
and ig.id = item.INGREDIENTE_ID
and upper(ig.grupo) = 'QUEIJO'

select @valor_carne = sum(valor) from ingrediente where upper(grupo) = 'CARNE'
select @valor_queijo = sum(valor) from ingrediente where upper(grupo) = 'QUEIJO'

select @valor_total = sum(i.valor) from ingrediente i,pedido p, pedido_item it
where p.id = @pedido_id
and it.pedido_id = p.id
and i.id = it.INGREDIENTE_ID

set @desconto = 0
IF (@alface > 0) and (@bacon = 0)
begin
  set @desconto = 10
  set @valor_total = @valor_total - (@valor_total * @desconto / 100)
end


if (@carne > 3) 
begin
  set @i = @carne 
  while @i >= 3
  begin
   set @i = @i - 3
   set @valor_total = @valor_total - @valor_carne
  end
end

if (@queijo > 3) 
begin
  set @i = @queijo 
  while @i >= 3
  begin
   set @i = @i - 3
   set @valor_total = @valor_total - @valor_queijo
  end
end

update pedido set valor_total = @valor_total 
where id = @pedido_id


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pedido"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cardapio"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 102
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Promocao"
            Begin Extent = 
               Top = 102
               Left = 272
               Bottom = 232
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPedido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPedido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pedido_Item"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ingrediente"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 136
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPedidoItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPedidoItem'
GO
USE [master]
GO
ALTER DATABASE [DESAFIOPRATICO] SET  READ_WRITE 
GO
