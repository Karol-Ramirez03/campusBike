/*
1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para actualizar los precios de una marca específica.
3. El administrador ingresa la marca y el porcentaje de incremento.
4. El sistema llama a un procedimiento almacenado para actualizar los precios.
5. El procedimiento almacenado actualiza los precios de todas las bicicletas de la marca
especificada.

*/

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarPreciosPorMarca$$
CREATE PROCEDURE actualizarPreciosPorMarca(
    IN marcaid INT,
    IN PORCENTAJE DECIMAL(5, 2)
)
BEGIN
    UPDATE bicicleta
    SET precio = precio * (1 + PORCENTAJE / 100)
    WHERE id_marca_bicicleta = marcaid;
END $$  
DELIMITER ;

