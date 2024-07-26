1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ingresos por cliente.
3. El sistema llama a un procedimiento almacenado para calcular el total de ingresos.
4. El procedimiento almacenado devuelve el total de ingresos generados por cada cliente.


DELIMITER $$

CREATE PROCEDURE CalcularTotalIngresosPorCliente()
BEGIN
    SELECT c.id AS id_cliente, c.nombre_cliente, SUM(v.total) AS total_ingresos
    FROM cliente c
    JOIN venta v ON c.id = v.id_cliente
    GROUP BY c.id, c.nombre_cliente
    
END $$

DELIMITER ;


