3. El sistema muestra una lista de ciudades ordenadas por la cantidad de ventas realizadas

SELECT 
    ci.nombre_ciudad,
    ventas_por_ciudad.cantidad_ventas
FROM 
    ciudad ci
JOIN 
    (SELECT 
        cl.id_ciudad,
        COUNT(v.id) AS cantidad_ventas
     FROM 
        venta v
     JOIN 
        cliente cl ON v.id_cliente = cl.id
     GROUP BY 
        cl.id_ciudad
    ) ventas_por_ciudad ON ci.id = ventas_por_ciudad.id_ciudad
ORDER BY 
    ventas_por_ciudad.cantidad_ventas DESC;
