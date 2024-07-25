4. El sistema muestra una lista de los clientes que han gastado más en ese año, ordenados por total gastado.
SELECT
    c.nombre_cliente,
    c.correo_electronico,
    c.telefono,
    SUM(v.total) AS total_gastado
FROM
    cliente c
    JOIN venta v ON c.id = v.id_cliente
WHERE
    YEAR(v.fecha_venta) = 2024
GROUP BY
    c.id
ORDER BY
    total_gastado DESC;
