/*
1. El administrador de inventario ingresa al sistema.
2. El administrador solicita un reporte de inventario.
3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene la información del inventario de bicicletas y repuestos.

*/

DELIMITER $$ 
DROP PROCEDURE IF EXISTS reporteInventario$$
CREATE PROCEDURE reporteInventario()
BEGIN

    SELECT b.id, mb.nombre_modelo , mab.nombre_marca , b.precio, b.stock
    FROM bicicleta b
    JOIN modelo_bicicleta mb ON mb.id = b.id_modelo_bicicleta
    JOIN marca_bicicleta mab ON mab.id = b.id_marca_bicicleta ;


    SELECT  r.id, r.nombre_repuesto, r.descripcion_repuesto , r.precio, r.stock, r.id_proveedor
    FROM repuesto r;
    
END $$
DELIMITER ;