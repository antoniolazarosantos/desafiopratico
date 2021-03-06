USE [DESAFIOPRATICO]
GO
/****** Object:  StoredProcedure [dbo].[pr_aplicar_promocao_pedido]    Script Date: 08/03/2021 10:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pr_aplicar_promocao_pedido]
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

