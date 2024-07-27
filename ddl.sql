CREATE DATABASE campusbike;
USE campusbike;

CREATE TABLE pais (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_pais VARCHAR(20),
    CONSTRAINT pk_id_pais PRIMARY KEY (id)
);

CREATE TABLE ciudad (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_ciudad VARCHAR(20),
    id_pais INT,
    CONSTRAINT pk_id_ciudad PRIMARY KEY (id),
    CONSTRAINT fk_id_pais FOREIGN KEY (id_pais) REFERENCES pais(id)
);

CREATE TABLE marca_bicicleta (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_marca VARCHAR(20),
    CONSTRAINT pk_id_marca PRIMARY KEY (id)
);

CREATE TABLE modelo_bicicleta (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_modelo VARCHAR(20),
    id_marca_bicicleta INT,
    CONSTRAINT pk_id_modelo PRIMARY KEY (id),
    CONSTRAINT fk_id_marca_bicicleta FOREIGN KEY (id_marca_bicicleta) REFERENCES marca_bicicleta(id)
);

CREATE TABLE bicicleta (
    id INT NOT NULL AUTO_INCREMENT,
    id_modelo_bicicleta INT,
    id_marca_bicicleta INT,
    precio DOUBLE,
    stock INT,

    
    CONSTRAINT pk_id_bicicleta PRIMARY KEY (id),
    CONSTRAINT fk_id_modelo_bicicleta FOREIGN KEY (id_modelo_bicicleta) REFERENCES modelo_bicicleta(id),
    CONSTRAINT fk_id_marca_ FOREIGN KEY (id_marca_bicicleta) REFERENCES marca_bicicleta(id),
    CONSTRAINT chk_precio_stock CHECK (precio > 0 AND stock >= 0)
);

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(20),
    correo_electronico VARCHAR(50) UNIQUE,
    telefono VARCHAR(15) UNIQUE,
    id_ciudad INT,
    CONSTRAINT pk_id_cliente PRIMARY KEY (id),
    CONSTRAINT fk_id_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE venta (
    id INT NOT NULL AUTO_INCREMENT,
    fecha_venta DATE,
    id_cliente INT,
    total DOUBLE,
    CONSTRAINT pk_id_venta PRIMARY KEY (id),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    CONSTRAINT chk_total CHECK (total >= 0)
);

CREATE TABLE detalle_venta (
    id INT NOT NULL AUTO_INCREMENT,
    id_venta INT,
    id_bicicleta INT,
    cantidad INT,
    precio_unitario DOUBLE,
    CONSTRAINT pk_id_detalle_venta PRIMARY KEY (id),
    CONSTRAINT fk_id_venta FOREIGN KEY (id_venta) REFERENCES venta(id),
    CONSTRAINT fk_id_bicicleta FOREIGN KEY (id_bicicleta) REFERENCES bicicleta(id),
    CONSTRAINT chk_cantidad_precio_unitario CHECK (cantidad > 0 AND precio_unitario > 0)
);

CREATE TABLE proveedor (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_proveedor VARCHAR(20) UNIQUE,
    nombre_contacto VARCHAR(20),
    telefono VARCHAR(15) UNIQUE,
    correo_electronico VARCHAR(50) UNIQUE,
    id_ciudad INT,
    CONSTRAINT pk_id_proveedor PRIMARY KEY (id),
    CONSTRAINT fk_id_ciudad_proveedor FOREIGN KEY (id_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE repuesto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_repuesto VARCHAR(20),
    descripcion_repuesto TEXT,
    precio DOUBLE,
    stock INT,
    id_proveedor INT,
    CONSTRAINT pk_id_repuesto PRIMARY KEY (id),
    CONSTRAINT fk_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
    CONSTRAINT chk_precio_stock_repuesto CHECK (precio > 0 AND stock > 0)
);

CREATE TABLE compra (
    id INT NOT NULL AUTO_INCREMENT,
    fecha_compra DATE,
    id_proveedor INT,
    total DOUBLE,
    CONSTRAINT pk_id_compra PRIMARY KEY (id),
    CONSTRAINT fk_id_proveedor_compra FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
    CONSTRAINT chk_total_compra CHECK (total >= 0)
);

CREATE TABLE detalle_compra (
    id INT NOT NULL AUTO_INCREMENT,
    id_compra INT,
    id_repuesto INT,
    cantidad INT,
    precio_unitario DOUBLE,
    CONSTRAINT pk_id_detalle_compra PRIMARY KEY (id),
    CONSTRAINT fk_id_compra FOREIGN KEY (id_compra) REFERENCES compra(id),
    CONSTRAINT fk_id_repuesto FOREIGN KEY (id_repuesto) REFERENCES repuesto(id),
    CONSTRAINT chk_precio_cantidad_detalle_compra CHECK (precio_unitario > 0 AND cantidad > 0)
);
