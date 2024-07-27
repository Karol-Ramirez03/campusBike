3. El sistema muestra una lista de repuestos ordenados por la cantidad vendida, de menor a
mayor.



SELECT r.nombre_repuesto, dc.cantidad_vendida
FROM repuesto r
JOIN (
   SELECT id_repuesto, SUM(dv.cantidad) AS cantidad_vendida
   FROM detalle_compra dv
   GROUP BY id_repuesto
) dc ON dc.id_repuesto = r.id 
ORDER BY dc.cantidad_vendida DESC;

