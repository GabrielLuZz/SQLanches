-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT
  pe.id,
  pe.status,
  pe.cliente_id,
  po.id,
  po.nome,
  po.tipo,
  po.preço,
  po.pts_de_lealdade
FROM
  pedidos pe
JOIN
  produtos_pedidos pope
ON pe.id = pope.pedido_id
JOIN produtos po
ON po.id = pope.produto_id;

-- 2)

SELECT
  pe.id
FROM
  pedidos pe
JOIN
  produtos_pedidos pope
ON pe.id = pope.pedido_id
JOIN produtos po
ON po.id = pope.produto_id
WHERE
  po.nome = 'Fritas';

-- 3)

SELECT
  cl.nome gostam_de_fritas
FROM
  pedidos pe
JOIN
  produtos_pedidos pope
ON pe.id = pope.pedido_id
JOIN produtos po
ON po.id = pope.produto_id
JOIN clientes cl
ON pe.cliente_id = cl.id
WHERE
  po.nome = 'Fritas';

-- 4)

SELECT
  SUM(po.preço)
FROM
  pedidos pe
JOIN
  produtos_pedidos pope
ON pe.id = pope.pedido_id
JOIN produtos po
ON po.id = pope.produto_id
JOIN clientes cl
ON pe.cliente_id = cl.id
WHERE
  cl.nome = 'Laura';

-- 5)

SELECT
  po.nome,
  count(po.id)
FROM
  produtos po
JOIN
  produtos_pedidos pope
ON po.id = pope.produto_id
GROUP BY
  po.nome;