3. El sistema muestra una lista de marcas y el modelo de bicicleta más vendido para cada marca.

SELECT
    mb.nombre_marca,
    mbm.nombre_modelo,
    MAX(total_vendido) AS max_vendido
FROM
    (SELECT
        m.nombre_marca,
        mo.nombre_modelo,
        mo.id_marca_bicicleta,
        dv.id_bicicleta,
        SUM(dv.cantidad) AS total_vendido
    FROM
        marca_bicicleta m
        JOIN modelo_bicicleta mo ON m.id = mo.id_marca_bicicleta
        JOIN bicicleta b ON b.id_modelo_bicicleta = mo.id
        JOIN detalle_venta dv ON b.id = dv.id_bicicleta
    GROUP BY
        m.id, mo.id) AS mbm
JOIN marca_bicicleta mb ON mb.id = mbm.id_marca_bicicleta
GROUP BY
    mbm.id_marca_bicicleta;

