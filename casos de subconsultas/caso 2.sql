4. El sistema muestra una lista de los clientes que han gastado más en ese año, ordenados por total gastado.

SELECT 
    c.nombre_cliente,
    c.correo_electronico,
    c.telefono,
    ventas_por_cliente.total_gastado
FROM 
    cliente c
JOIN 
    (SELECT 
        v.id_cliente,
        SUM(v.total) AS total_gastado
     FROM 
        venta v
     WHERE 
        YEAR(v.fecha_venta) = 2024
     GROUP BY 
        v.id_cliente
    ) ventas_por_cliente ON c.id = ventas_por_cliente.id_cliente
ORDER BY 
    ventas_por_cliente.total_gastado DESC;

