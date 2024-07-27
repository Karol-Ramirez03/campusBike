3. El sistema muestra una lista de proveedores ordenados por el número de compras recibidas en el último mes.



SELECT p.nombre_proveedor, mp.compras_proveedor
FROM proveedor p
JOIN (
    SELECT id_proveedor, COUNT(c.id) AS compras_proveedor
    FROM compra c
    WHERE MONTH(c.fecha_compra) = MONTH(NOW() - INTERVAL 1 MONTH)
    GROUP BY c.id_proveedor
) mp ON mp.id_proveedor = p.id;