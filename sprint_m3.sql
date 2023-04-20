-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sprint_M3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sprint_M3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sprint_M3` DEFAULT CHARACTER SET utf8 ;
USE `Sprint_M3` ;

-- -----------------------------------------------------
-- Table `Sprint_M3`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sprint_M3`.`Proveedor` (
  `id_Provedor` INT NOT NULL AUTO_INCREMENT,
  `representante_legal` VARCHAR(100) NOT NULL,
  `nombre_corporativo` VARCHAR(100) NOT NULL,
  `telefono_contacto1` VARCHAR(20) NOT NULL,
  `telefono_contacto2` VARCHAR(20) NOT NULL,
  `nombre_recepcion` VARCHAR(100) NOT NULL,
  `categoria_producto` VARCHAR(200) NOT NULL,
  `correo_electronico` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_Provedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sprint_M3`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sprint_M3`.`Producto` (
  `id_Producto` INT NOT NULL AUTO_INCREMENT,
  `STOCK` INT NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `categoria_producto` VARCHAR(200) NOT NULL,
  `proveedor` VARCHAR(100) NOT NULL,
  `color` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sprint_M3`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sprint_M3`.`Clientes` (
  `id_Clientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_Clientes`),
  UNIQUE INDEX `direccion_UNIQUE` (`direccion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sprint_M3`.`Producto_has_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sprint_M3`.`Producto_has_Proveedor` (
  `Producto_id_Producto` INT NOT NULL,
  `Proveedor_id_Provedor` INT NOT NULL,
  PRIMARY KEY (`Producto_id_Producto`, `Proveedor_id_Provedor`),
  INDEX `fk_Producto_has_Proveedor_Proveedor1_idx` (`Proveedor_id_Provedor` ASC) VISIBLE,
  INDEX `fk_Producto_has_Proveedor_Producto_idx` (`Producto_id_Producto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Proveedor_Producto`
    FOREIGN KEY (`Producto_id_Producto`)
    REFERENCES `Sprint_M3`.`Producto` (`id_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Proveedor_Proveedor1`
    FOREIGN KEY (`Proveedor_id_Provedor`)
    REFERENCES `Sprint_M3`.`Proveedor` (`id_Provedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sprint_M3`.`Producto_has_Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sprint_M3`.`Producto_has_Clientes` (
  `Producto_id_Producto` INT NOT NULL,
  `Clientes_id_Clientes` INT NOT NULL,
  PRIMARY KEY (`Producto_id_Producto`, `Clientes_id_Clientes`),
  INDEX `fk_Producto_has_Clientes_Clientes1_idx` (`Clientes_id_Clientes` ASC) VISIBLE,
  INDEX `fk_Producto_has_Clientes_Producto1_idx` (`Producto_id_Producto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Clientes_Producto1`
    FOREIGN KEY (`Producto_id_Producto`)
    REFERENCES `Sprint_M3`.`Producto` (`id_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Clientes_Clientes1`
    FOREIGN KEY (`Clientes_id_Clientes`)
    REFERENCES `Sprint_M3`.`Clientes` (`id_Clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'admin_sprint' IDENTIFIED BY '1235';

GRANT ALL ON `Sprint_M3`.* TO 'admin_sprint';
GRANT SELECT ON TABLE `Sprint_M3`.* TO 'admin_sprint';
GRANT SELECT, INSERT, TRIGGER ON TABLE `Sprint_M3`.* TO 'admin_sprint';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `Sprint_M3`.* TO 'admin_sprint';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Sprint_M3`.`Proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `Sprint_M3`;
INSERT INTO `Sprint_M3`.`Proveedor` (`id_Provedor`, `representante_legal`, `nombre_corporativo`, `telefono_contacto1`, `telefono_contacto2`, `nombre_recepcion`, `categoria_producto`, `correo_electronico`) VALUES (1, 'Juan Pérez', 'Tecnocom Ltda.', '+56 9 12345678', '+56 2 7654321', 'Ana gómez', 'Equipos de computación y accesorios', 'tecnocom@proveedor.com');
INSERT INTO `Sprint_M3`.`Proveedor` (`id_Provedor`, `representante_legal`, `nombre_corporativo`, `telefono_contacto1`, `telefono_contacto2`, `nombre_recepcion`, `categoria_producto`, `correo_electronico`) VALUES (2, 'María gonzález', 'Electrosol S.A.', '+56 9 87654321', '+56 2 13579246', 'José rodriguez', 'Dispositivos móviles y accesorios', 'info@electrosol.cl');
INSERT INTO `Sprint_M3`.`Proveedor` (`id_Provedor`, `representante_legal`, `nombre_corporativo`, `telefono_contacto1`, `telefono_contacto2`, `nombre_recepcion`, `categoria_producto`, `correo_electronico`) VALUES (3, 'Pedro Rodríguez', 'Techworld SpA', '+56 9 65432109', '+56 2 7890123', 'María Fernández', 'Audio y video profesional', 'ventas@techworld.cl');
INSERT INTO `Sprint_M3`.`Proveedor` (`id_Provedor`, `representante_legal`, `nombre_corporativo`, `telefono_contacto1`, `telefono_contacto2`, `nombre_recepcion`, `categoria_producto`, `correo_electronico`) VALUES (4, 'Diego Sánchez', 'Electromundo Chile', '+56 9 76543210', '+56 2 9765432', 'Paula Ramírez', 'Electrodomésticos inteligentes', 'contacto@electromundo.cl');
INSERT INTO `Sprint_M3`.`Proveedor` (`id_Provedor`, `representante_legal`, `nombre_corporativo`, `telefono_contacto1`, `telefono_contacto2`, `nombre_recepcion`, `categoria_producto`, `correo_electronico`) VALUES (5, 'Ana Fernández', 'Smartech Limitada', '+56 9 11112222', '+56 2 2468013', 'Claudia Rojas', 'Dispositivos de seguridad y vigilancia', 'ventas@smartech.cl');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Sprint_M3`.`Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Sprint_M3`;
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (1, 20, 758.99, 'Computadoras', 'Electrosol S.A.', 'Plateado');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (2, 30, 999.99, 'Smartphones', 'Smartech Limitada', 'Negro');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (3, 15, 199.99, 'Audio', 'Techworld SpA', 'Negro');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (4, 10, 1199.99, 'TV y Video', 'Electromundo Chile', 'Negro');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (5, 5, 399.99, 'Videojuegos', 'Smartech Limitada', 'Blanco');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (6, 25, 359.99, 'Computadoras', 'Electrosol S.A.', 'Negro');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (7, 20, 129.99, 'Audio', 'Techworld SpA', 'Rojo');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (8, 15, 599.99, 'Tabletas', 'Smartech Limitada', 'Gris');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (9, 8, 899.99, 'Camaras', 'Tecnocom Ltda.', 'Negro');
INSERT INTO `Sprint_M3`.`Producto` (`id_Producto`, `STOCK`, `precio`, `categoria_producto`, `proveedor`, `color`) VALUES (10, 12, 329.99, 'Impresoras', 'Electromundo Chile', 'Blanco');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Sprint_M3`.`Clientes`
-- -----------------------------------------------------
START TRANSACTION;
USE `Sprint_M3`;
INSERT INTO `Sprint_M3`.`Clientes` (`id_Clientes`, `nombre`, `apellido`, `direccion`) VALUES (1, 'Martín', 'González', 'Av. Livertad 1234, Santiago');
INSERT INTO `Sprint_M3`.`Clientes` (`id_Clientes`, `nombre`, `apellido`, `direccion`) VALUES (2, 'Daniela', 'Fernández', 'Calle Lira 567, Providencia, Santiago');
INSERT INTO `Sprint_M3`.`Clientes` (`id_Clientes`, `nombre`, `apellido`, `direccion`) VALUES (3, 'Diego', 'Torres', 'Av. La Marina 789, Valparaíso');
INSERT INTO `Sprint_M3`.`Clientes` (`id_Clientes`, `nombre`, `apellido`, `direccion`) VALUES (4, 'Andrea', 'Gómez', 'Av. Providencia 4321, Providencia, Sntiago');
INSERT INTO `Sprint_M3`.`Clientes` (`id_Clientes`, `nombre`, `apellido`, `direccion`) VALUES (5, 'Felipe', 'Flores', 'Calle Los Mares 987, Viña del Mar');

COMMIT;

