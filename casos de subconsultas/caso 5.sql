3. El sistema muestra una lista de ciudades ordenadas por la cantidad de ventas realizadas

SELECT
    ci.nombre_ciudad,
    COUNT(v.id) AS cantidad_ventas
FROM
    ciudad ci
    JOIN cliente c ON ci.id = c.id_ciudad
    JOIN venta v ON c.id = v.id_cliente
GROUP BY
    ci.id
ORDER BY
    cantidad_ventas ASC; 
