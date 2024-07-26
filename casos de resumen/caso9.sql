1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de precios por marca.
3. El sistema llama a un procedimiento almacenado para calcular el promedio de precios.
4. El procedimiento almacenado devuelve el promedio de precios agrupadas por marca.

DELIMITER $$
CREATE PROCEDURE promedio_marca()
BEGIN 
     SELECT mb.nombre_marca, AVG(b.precio) AS promedio_precio
    FROM bicicleta b
    JOIN marca_bicicleta mb ON b.id_marca_bicicleta = mb.id
    GROUP BY b.id_marca_bicicleta, mb.nombre_marca;

END$$
DELIMITER ;