3. El sistema muestra una lista de marcas y el modelo de bicicleta más vendido para cada marca.

SELECT 
    mb.nombre_marca,
    mbm.nombre_modelo,
    MAX(ventas_por_modelo.total_vendido) AS total_vendido
FROM 
    marca_bicicleta mb
JOIN 
    modelo_bicicleta mbm ON mb.id = mbm.id_marca_bicicleta
JOIN 
    (SELECT 
        id_modelo_bicicleta,
        SUM(cantidad) AS total_vendido
     FROM 
        detalle_venta dv
     JOIN 
        bicicleta b ON dv.id_bicicleta = b.id
     GROUP BY 
        id_modelo_bicicleta
    ) ventas_por_modelo ON mbm.id = ventas_por_modelo.id_modelo_bicicleta
GROUP BY 
    mb.nombre_marca, mbm.nombre_modelo
ORDER BY 
    mb.nombre_marca, total_vendido DESC;


