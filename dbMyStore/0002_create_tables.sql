USE `dbMyStore` ;

CREATE TABLE Vendedor (
    id_vendedor int auto_increment,
    paterno varchar(50),
    materno varchar(50),
    nombre varchar(50),
    telefono varchar(10),
    dni varchar(10),
    PRIMARY KEY (id_vendedor)
);
-- -----------------------------------------------------
-- Table ESTADO
-- -----------------------------------------------------
CREATE TABLE `ESTADO` (
    `ID_ESTADO` INT NOT NULL,
    `NOMBRE` VARCHAR(45) NULL,
    `DESCRIPCION` VARCHAR(200) NULL,
    PRIMARY KEY (`ID_ESTADO`)
);
CREATE TABLE CLIENTE (id_cliente int, PRIMARY KEY(id_cliente));
CREATE TABLE ROL(
    id_rol int,
    nombre varchar(50),
    descripcion varchar(200),
    PRIMARY KEY(id_rol)
);
CREATE TABLE CATEGORIA (
    id_categoria int auto_increment,
    Nombre varchar(50) not null,
    descripcion varchar(200) not null,
    PRIMARY KEY (id_categoria)
);
CREATE TABLE `MODALIDAD_ENTREGA` (
    `Modalidad_Entrega` int,
    `Nombre` varchar(50),
    `descripcion` varchar(200),
    PRIMARY KEY(`Modalidad_Entrega`)
);
CREATE TABLE `COMPRA` (
    `id_compra` int,
    `id_cliente` int,
    `id_vendedor` int,
    `fecha` date,
    `id_Estado_compra` int,
    `id_Estado_pago` int,
    `Modalidad_entrega` int,
    `descuento` float,
    `id_estado` int,
    PRIMARY KEY(`id_compra`),
    FOREIGN KEY (`id_cliente`) REFERENCES CLIENTE (`id_cliente`),
    FOREIGN KEY (`id_Estado_compra`) REFERENCES ESTADO (`id_estado`),
    FOREIGN KEY (`Modalidad_entrega`) REFERENCES MODALIDAD_ENTREGA (`Modalidad_Entrega`),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
CREATE TABLE PRODUCTO (
    id_producto int auto_increment,
    id_categoria int,
    id_vendedor int,
    nombre varchar(100),
    descripcion varchar(300),
    precio float,
    imagen varchar(100),
    stock int,
    estado_activacion int,
    fecha_adicion date,
    fecha_modificacion date,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
CREATE TABLE `DETALLE_COMPRA` (
    `id_detalle_compra` int,
    `compra` int,
    `producto` int,
    `cantidad` int,
    `precio` float,
    `descuento` float,
    PRIMARY KEY (`id_detalle_compra`),
    FOREIGN KEY (`compra`) REFERENCES COMPRA (`id_compra`),
    FOREIGN KEY (`producto`) REFERENCES PRODUCTO (`id_producto`)
);
CREATE TABLE USUARIO(
    id_usuario int,
    rol int,
    contrasenia varchar(50),
    nombre_usuario varchar(50),
    id_estado_actividad int,
    PRIMARY KEY(id_usuario),
    FOREIGN KEY(rol) REFERENCES ROL(id_rol)
);
CREATE TABLE PERSONA(
    id_persona int,
    usuario int,
    nombre varchar(50),
    apellido_paterno varchar(50),
    apellido_materno varchar(50),
    correo varchar(100),
    celular int,
    genero int,
    PRIMARY KEY(id_persona),
    FOREIGN KEY(usuario) REFERENCES USUARIO(id_usuario)
);
-- -----------------------------------------------------
-- Table DETALLE_DELIVERY_COMPRA
-- -----------------------------------------------------
CREATE TABLE `DETALLE_DELIVERY_COMPRA` (
    `ID_DETALLE_DELIVERY` INT NOT NULL,
    `ID_COMPRA` INT NOT NULL,
    `ID_USUARIO` INT NOT NULL,
    `DIRECCION` VARCHAR(100) NULL,
    `REFERENCIA` VARCHAR(100) NULL,
    `NUMERO_CONTACTO` VARCHAR(45) NULL,
    PRIMARY KEY (`ID_DETALLE_DELIVERY`),
    FOREIGN KEY (`ID_COMPRA`) REFERENCES COMPRA (`ID_COMPRA`)
);
-- -----------------------------------------------------
-- Table `CALIFICACION_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE `CALIFICACION_PRODUCTO` (
    `ID_CALIFICACION` INT NOT NULL,
    `PUNTUACION` INT NOT NULL,
    `COMENTARIO` VARCHAR(200) NULL,
    `ID_PRODUCTO` INT NOT NULL,
    `ID_CLIENTE` INT NOT NULL,
    PRIMARY KEY (`ID_CALIFICACION`),
    FOREIGN KEY (`ID_PRODUCTO`) REFERENCES PRODUCTO (`ID_PRODUCTO`),
    FOREIGN KEY (`ID_CLIENTE`) REFERENCES CLIENTE(`ID_CLIENTE`)
);