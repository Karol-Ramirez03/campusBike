/* 
1. El administrador de compras ingresa al sistema.
2. El administrador registra una nueva compra.
3. El sistema llama a un procedimiento almacenado para registrar la compra y sus detalles.
4. El procedimiento almacenado inserta la compra y sus detalles en las tablas correspondientes
y actualiza el stock de repuestos.
*/
SELECT * FROM compra;
SELECT * FROM detalle_compra;
SELECT * FROM repuesto;

CALL registrarCompraConDetalles(1,1,5,@compra);

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCompraConDetalles$$
CREATE PROCEDURE registrarCompraConDetalles(
    IN ProveedorId INT,
    IN RepuestoId INT,
    IN Cantidad INT,
    OUT outCompraId INT
)
BEGIN
    DECLARE totalDetalle DOUBLE;
    DECLARE precio_Unitario DOUBLE;

    INSERT INTO compra (fecha_compra, id_proveedor, total)
    VALUES (NOW(), ProveedorId, 0);

    SET outCompraId = LAST_INSERT_ID();

    SELECT precio INTO precio_Unitario
    FROM repuesto 
    WHERE id = RepuestoId;

    SET totalDetalle = precio_Unitario * Cantidad;

    INSERT INTO detalle_compra (id_compra, id_repuesto, cantidad, precio_unitario)
    VALUES (outCompraId, RepuestoId, Cantidad, precio_Unitario);

    UPDATE repuesto
    SET stock = stock + Cantidad
    WHERE id = RepuestoId;

    UPDATE compra
    SET total = total + totalDetalle
    WHERE id = outCompraId;
END$$
DELIMITER ;



CALL registrarCompra(1,@compraid);

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCompra$$
CREATE PROCEDURE registrarCompra(
    IN inProveedorId INT,
    OUT outCompraId INT
)
BEGIN

    INSERT INTO compra (fecha_compra, id_proveedor , total)
    VALUES (NOW(), inProveedorId, 0);

    SET outCompraId = LAST_INSERT_ID();
END $$
DELIMITER ;


-- registra detalle de compra

CALL registrarDetalleCompra(@compraid,1,6);
SELECT * FROM compra;
SELECT * FROM detalle_compra;
SELECT * FROM repuesto;

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarDetalleCompra$$
CREATE PROCEDURE registrarDetalleCompra(
    IN CompraID INT,
    IN repuestoID INT,
    IN Cantidad INT
)
BEGIN
    DECLARE PrecioUnitario DOUBLE;
    DECLARE totalDetalle DOUBLE;
    

    SELECT precio INTO PrecioUnitario
    FROM repuesto
    WHERE id = repuestoID;

    SET totalDetalle = PrecioUnitario * Cantidad;

    INSERT INTO detalle_compra (id_compra, id_repuesto, cantidad, precio_unitario)
    VALUES (CompraID, repuestoID, Cantidad, PrecioUnitario);

    UPDATE repuesto
    SET stock = stock + Cantidad
    WHERE id = repuestoID;

    UPDATE compra
    SET total = total + totalDetalle
    WHERE id = CompraID;
END $$
DELIMITER ;


