3. El sistema muestra una lista de proveedores ordenados por el número de compras recibidas en el último mes.

SELECT
    p.nombre_proveedor,
    p.nombre_contacto,
    p.telefono,
    p.correo_electronico,
    COUNT(c.id) AS numero_compras
FROM
    proveedor p
    JOIN compra c ON p.id = c.id_proveedor
WHERE
    c.fecha_compra >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY
    p.id
ORDER BY
    numero_compras DESC;
