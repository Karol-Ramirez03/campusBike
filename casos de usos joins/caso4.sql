--El sistema muestra una lista de clientes que han realizado compras dentro del rango de fechas especificado.



SELECT DISTINCT c.nombre_cliente 
FROM  cliente C
JOIN venta v ON c.id = v.id_cliente
WHERE v.fecha_venta BETWEEN '2024-01-01' AND '2024-12-31';


-- procedimiento almacenado

DELIMITER $$

CREATE PROCEDURE ObtenerClientesDistintos(
    IN fecha_inicio DATE, 
    IN fecha_fin DATE
)
BEGIN
    SELECT DISTINCT c.nombre_cliente 
    FROM cliente c
    JOIN venta v ON c.id = v.id_cliente
    WHERE v.fecha_venta BETWEEN fecha_inicio AND fecha_fin;
END $$

DELIMITER ;
