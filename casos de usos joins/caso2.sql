-- El sistema muestra una lista de países con los proveedores en cada país.

SELECT p.nombre_proveedor, pa.nombre_pais
FROM proveedor p
JOIN ciudad c ON p.id_ciudad = c.id
JOIN pais pa ON c.id_pais = pa.id;

--PROCEDIMIENTOS ALMECANADOS

CREATE PROCEDURE obtenerPaisProveedor()
BEGIN 
    SELECT p.nombre_proveedor, pa.nombre_pais
    FROM proveedor p
    JOIN ciudad c ON p.id_ciudad = c.id
    JOIN pais pa ON c.id_pais = pa.id;
END$$