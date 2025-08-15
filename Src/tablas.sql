
CREATE TABLE especies (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cientifico VARCHAR(100) NOT NULL,
    nombre_comun VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE variedades (
    id_variedad INT AUTO_INCREMENT PRIMARY KEY,
    id_especie INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    tipo_portes ENUM('Alto','Bajo','Desconocido') DEFAULT 'Desconocido',
    tipo_variedad ENUM('Clone','Polyclonal','Polyclonal/Synthetic','Otra') DEFAULT 'Otra',
    grupo_genetico VARCHAR(100),
    linea_genetica TEXT,
    anio_primer_produccion INT,
    descripcion TEXT,
    FOREIGN KEY (id_especie) REFERENCES especies(id_especie)
);

CREATE TABLE sinonimos_variedades (
    id_sinonimo INT AUTO_INCREMENT PRIMARY KEY,
    id_variedad INT NOT NULL,
    nombre_sinonimo VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad)
);

CREATE TABLE paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE paises_liberacion (
    id_variedad INT,
    id_pais INT,
    PRIMARY KEY (id_variedad, id_pais),
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad),
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

CREATE TABLE caracteristicas_agronomicas (
    id_caracteristica INT AUTO_INCREMENT PRIMARY KEY,
    id_variedad INT NOT NULL,
    rendimiento_min_kg_ha DECIMAL(10,2),
    rendimiento_max_kg_ha DECIMAL(10,2),
    contenido_mucilago ENUM('Bajo','Medio','Alto','Desconocido'),
    tamano_grano ENUM('Muy pequeño','Pequeño','Mediano','Grande','Muy grande','Desconocido'),
    resistencia_roya ENUM('Resistente','Tolerante','Susceptible','Desconocido'),
    resistencia_cbd ENUM('Resistente','Tolerante','Susceptible','Desconocido'),
    resistencia_nematodo ENUM('Resistente','Tolerante','Susceptible','Desconocido'),
    resistencia_broca ENUM('Resistente','Tolerante','Susceptible','Desconocido'),
    resistencia_shoot_hole_borer ENUM('Resistente','Tolerante','Susceptible','Desconocido'),
    altura_planta ENUM('Enana/Compacta','Alta','Desconocido'),
    requerimiento_nutricional ENUM('Muy alto','Alto','Medio','Bajo','Desconocido'),
    maduracion_fruto ENUM('Temprana','Promedio','Tardía','Muy tardía','Desconocido'),
    rendimiento_cereza_a_verde DECIMAL(5,2), 
    densidad_siembra_min INT,
    densidad_siembra_max INT,
    color_cogollo ENUM('Verde','Bronce','Verde o Bronce','Bronce claro','Bronce oscuro','Desconocido'),
    notas_adicionales TEXT,
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad)
);

CREATE TABLE produccion_por_hectarea (
    id_produccion INT AUTO_INCREMENT PRIMARY KEY,
    id_variedad INT NOT NULL,
    densidad_siembra INT, 
    produccion_arbol_kg DECIMAL(5,2),
    produccion_hectarea_arrobas DECIMAL(6,2),
    porcentaje_grano_supremo DECIMAL(5,2),
    porcentaje_granos_vanos DECIMAL(5,2),
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad)
);

CREATE TABLE breeders (
    id_breeder INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    institucion VARCHAR(150),
    pais VARCHAR(100)
);

CREATE TABLE breeders_variedad (
    id_variedad INT,
    id_breeder INT,
    PRIMARY KEY (id_variedad, id_breeder),
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad),
    FOREIGN KEY (id_breeder) REFERENCES breeders(id_breeder)
);

CREATE TABLE atributos_sensoriales (
    id_atributo INT AUTO_INCREMENT PRIMARY KEY,
    id_variedad INT NOT NULL,
    puntaje_sca DECIMAL(4,1), 
    atributos TEXT, 
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad)
);

CREATE TABLE atributos_taza (
    id_atributo_taza INT AUTO_INCREMENT PRIMARY KEY,
    id_variedad INT NOT NULL,
    atributo VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_variedad) REFERENCES variedades(id_variedad)
);
