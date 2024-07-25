USE campusbike;

INSERT INTO pais (nombre_pais) VALUES 
('España'),
('Francia'),
('Alemania'),
('Italia'),
('Portugal'),
('Países Bajos'),
('Suiza');

INSERT INTO ciudad (nombre_ciudad, id_pais) VALUES 
('Madrid', 1),
('Barcelona', 1),
('París', 2),
('Lyon', 2),
('Berlín', 3),
('Múnich', 3),
('Roma', 4);

INSERT INTO marca_bicicleta (nombre_marca) VALUES 
('Trek'),
('Specialized'),
('Cannondale'),
('Giant'),
('Scott'),
('Bianchi'),
('Merida');

INSERT INTO modelo_bicicleta (nombre_modelo, id_marca_bicicleta) VALUES 
('Domane', 1),
('Roubaix', 2),
('Synapse', 3),
('Defy', 4),
('Addict', 5),
('Infinito', 6),
('Reacto', 7);

INSERT INTO bicicleta (id_modelo_bicicleta, id_marca_bicicleta, precio, stock) VALUES 
(1, 1, 1500.00, 10),
(2, 2, 2000.00, 15),
(3, 3, 1800.00, 12),
(4, 4, 1700.00, 8),
(5, 5, 2100.00, 5),
(6, 6, 2500.00, 7),
(7, 7, 2200.00, 9);

INSERT INTO cliente (nombre_cliente, correo_electronico, telefono, id_ciudad) VALUES 
('Juan Perez', 'juan.perez@example.com', 600123456, 1),
('Ana García', 'ana.garcia@example.com', 600234567, 2),
('Carlos Sánchez', 'carlos.sanchez@example.com', 600345678, 3),
('Lucía Martínez', 'lucia.martinez@example.com', 600456789, 4),
('Pedro Fernández', 'pedro.fernandez@example.com', 600567890, 5),
('María López', 'maria.lopez@example.com', 600678901, 6),
('Luis González', 'luis.gonzalez@example.com', 600789012, 7);

INSERT INTO venta (fecha_venta, id_cliente, total) VALUES 
('2024-01-01', 1, 1500.00),
('2024-02-01', 2, 2000.00),
('2024-03-01', 3, 1800.00),
('2024-04-01', 4, 1700.00),
('2024-05-01', 5, 2100.00),
('2024-06-01', 6, 2500.00),
('2024-07-01', 7, 2200.00);

INSERT INTO detalle_venta (id_venta, id_bicicleta, cantidad, precio_unitario) VALUES 
(1, 1, 1, 1500.00),
(2, 2, 1, 2000.00),
(3, 3, 1, 1800.00),
(4, 4, 1, 1700.00),
(5, 5, 1, 2100.00),
(6, 6, 1, 2500.00),
(7, 7, 1, 2200.00);

INSERT INTO proveedor (nombre_proveedor, nombre_contacto, telefono, correo_electronico, id_ciudad) VALUES 
('Proveedor A', 'Contacto A', 601234567, 'contacto.a@example.com', 1),
('Proveedor B', 'Contacto B', 602345678, 'contacto.b@example.com', 2),
('Proveedor C', 'Contacto C', 603456789, 'contacto.c@example.com', 3),
('Proveedor D', 'Contacto D', 604567890, 'contacto.d@example.com', 4),
('Proveedor E', 'Contacto E', 605678901, 'contacto.e@example.com', 5),
('Proveedor F', 'Contacto F', 606789012, 'contacto.f@example.com', 6),
('Proveedor G', 'Contacto G', 607890123, 'contacto.g@example.com', 7);

INSERT INTO repuesto (nombre_repuesto, descripcion_repuesto, precio, stock, id_proveedor) VALUES 
('Repuesto A', 'Descripción A', 100.00, 20, 1),
('Repuesto B', 'Descripción B', 200.00, 15, 2),
('Repuesto C', 'Descripción C', 150.00, 10, 3),
('Repuesto D', 'Descripción D', 250.00, 5, 4),
('Repuesto E', 'Descripción E', 300.00, 8, 5),
('Repuesto F', 'Descripción F', 350.00, 12, 6),
('Repuesto G', 'Descripción G', 400.00, 7, 7);

INSERT INTO compra (fecha_compra, id_proveedor, total) VALUES 
('2024-01-01', 1, 1000.00),
('2024-02-01', 2, 2000.00),
('2024-03-01', 3, 1500.00),
('2024-04-01', 4, 2500.00),
('2024-05-01', 5, 3000.00),
('2024-06-01', 6, 3500.00),
('2024-07-01', 7, 4000.00);

INSERT INTO detalle_compra (id_compra, id_repuesto, cantidad, precio_unitario) VALUES 
(1, 1, 18, 100.00),
(2, 2, 10, 200.00),
(3, 3, 10, 150.00),
(4, 4, 10, 250.00),
(5, 5, 10, 300.00),
(6, 6, 10, 350.00),
(7, 7, 10, 400.00);