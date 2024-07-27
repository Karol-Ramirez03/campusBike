3. El sistema muestra una lista de repuestos ordenados por la cantidad vendida, de menor a
mayor.

SELECT 
    r.nombre_repuesto,
    ventas_por_repuesto.cantidad_vendida
FROM 
    repuesto r
JOIN 
    (SELECT 
        dv.id_repuesto,
        SUM(dv.cantidad) AS cantidad_vendida
     FROM 
        detalle_venta dv
     JOIN 
        bicicleta b ON dv.id_bicicleta = b.id
     JOIN 
        modelo_bicicleta mb ON b.id_modelo_bicicleta = mb.id
     WHERE 
        mb.id IN (SELECT DISTINCT mb.id FROM modelo_bicicleta mb)
     GROUP BY 
        dv.id_repuesto
    ) ventas_por_repuesto ON r.id = ventas_por_repuesto.id_repuesto
ORDER BY 
    ventas_por_repuesto.cantidad_vendida ASC;

