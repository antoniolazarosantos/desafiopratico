/****** Script do comando SelectTopNRows de SSMS  ******/
insert into promocao(descricao,qtd_porcao,qtd_porcao_paga,desconto)
select 'Light',0,0,10.00
union
select 'Muita carne',3,2,0.00
union
select 'Muito queijo',3,2,0.00
union
select 'Nenhuma',0,0,0.00