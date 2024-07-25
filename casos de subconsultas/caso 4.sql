3. El sistema muestra una lista de repuestos ordenados por la cantidad vendida, de menor a
mayor.

SELECT
    r.nombre_repuesto,
    r.descripcion_repuesto,
    SUM(dv.cantidad) AS cantidad_vendida
FROM
    repuesto r
    JOIN detalle_venta dv ON r.id = dv.id_repuesto
GROUP BY
    r.id
ORDER BY
    cantidad_vendida ASC;
