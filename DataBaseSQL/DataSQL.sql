-- creación de bd
CREATE SCHEMA `intcomex` ;
--Creacion de tabla productos
CREATE TABLE `intcomex`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(45) NOT NULL,
  `mpn` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
--Creacion de tabla categorias
CREATE TABLE `intcomex`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
--Creacion de tabla Sub_categorias
CREATE TABLE `intcomex`.`subcat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cat_id_idx` (`cat_id` ASC) VISIBLE,
  CONSTRAINT `cat_id`
    FOREIGN KEY (`cat_id`)
    REFERENCES `intcomex`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
--Creacion de tabla Atributos
CREATE TABLE `intcomex`.`atributos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `data` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
--Creacion de tablas auxiliares para gestion de datos
--atributos_subcategorias
CREATE TABLE `intcomex`.`atributos_subcategorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subcat_id` INT NOT NULL,
  `atributo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `subcat_id_idx` (`subcat_id` ASC) VISIBLE,
  INDEX `atributo_id_idx` (`atributo_id` ASC) VISIBLE,
  CONSTRAINT `subcat_id`
    FOREIGN KEY (`subcat_id`)
    REFERENCES `intcomex`.`subcat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `atributo_id`
    FOREIGN KEY (`atributo_id`)
    REFERENCES `intcomex`.`atributos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
--atributos_categorias
CREATE TABLE `intcomex`.`atributos_categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria_id` INT NOT NULL,
  `atributo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `categoria_id_idx` (`categoria_id` ASC) VISIBLE,
  INDEX `atributo_id_idx` (`atributo_id` ASC) VISIBLE,
  CONSTRAINT `categoria_id`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `intcomex`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `atributocat_id`
    FOREIGN KEY (`atributo_id`)
    REFERENCES `intcomex`.`atributos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

--productos_atributos

CREATE TABLE `intcomex`.`productos_atributos` (
  `id` INT NOT NULL,
  `productosat_id` INT NOT NULL,
  `atributopro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `productosat_id_idx` (`productosat_id` ASC) VISIBLE,
  INDEX `atributopro_id_idx` (`atributopro_id` ASC) VISIBLE,
  CONSTRAINT `productosat_id`
    FOREIGN KEY (`productosat_id`)
    REFERENCES `intcomex`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `atributopro_id`
    FOREIGN KEY (`atributopro_id`)
    REFERENCES `intcomex`.`atributos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

--productos_subcategorias
CREATE TABLE `intcomex`.`productos_subcategorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `productosub_id` INT NOT NULL,
  `subcatpro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `productosub_id_idx` (`productosub_id` ASC) VISIBLE,
  INDEX `subcatpro_id_idx` (`subcatpro_id` ASC) VISIBLE,
  CONSTRAINT `productosub_id`
    FOREIGN KEY (`productosub_id`)
    REFERENCES `intcomex`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subcatpro_id`
    FOREIGN KEY (`subcatpro_id`)
    REFERENCES `intcomex`.`subcat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

--productos_categorias
CREATE TABLE `intcomex`.`productos_categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `productoscat_id` INT NOT NULL,
  `categoriapro_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `productoscat_id_idx` (`productoscat_id` ASC) VISIBLE,
  INDEX `categoriapro_id_idx` (`categoriapro_id` ASC) VISIBLE,
  CONSTRAINT `productoscat_id`
    FOREIGN KEY (`productoscat_id`)
    REFERENCES `intcomex`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `categoriapro_id`
    FOREIGN KEY (`categoriapro_id`)
    REFERENCES `intcomex`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
