create DATABASE adm_condominios;

create TABLE condominios(
	id_cond int PRIMARY KEY AUTO_INCREMENT,
    nome_cond varchar(50),
    qnt_unidades int NOT NULL,
    endereco varchar(50)    
);

create TABLE uni_habitacional(
	id_uni int PRIMARY KEY AUTO_INCREMENT,
    metragem float NOT NULL,
    num_comodos int NOT NULL,
    endereco varchar(50),
    alugada char CHECK (alugada IN ('V', 'F')),
    condominio_id int NOT NULL, 
    FOREIGN KEY (condominio_id) REFERENCES condominios(id_cond)
);

create TABLE pessoa(
	id_pessoa int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50) UNIQUE,
    endereco varchar(50)
);

create TABLE sindico(
	id int PRIMARY KEY AUTO_INCREMENT,    
    vigencia DATE,    
    proprietario_id int NOT NULL,
    FOREIGN KEY (proprietario_id) REFERENCES pessoa(id_pessoa)
);

INSERT INTO condominios (nome_cond, qnt_unidades, endereco) VALUES 
("Casa nova", 2, "Rua Chile"),
("Amor e lar", 3, "Rua Onze"),
("Almenat", 4, "Rua Manoel"),
("Bom lugar", 5, "Rua Rosario"),
("Paraiso", 6, "Rua Nigeria"),
("Retiro", 8, "Rua Piaui"),
("Doce lar", 13, "Rua Elefante"),
("Recanto", 9, "Rua Messias"),
("Jerusalem", 7, "Rua Romario"),
("Canto do sabia", 10, "Rua Niteroi");  


INSERT INTO uni_habitacional (metragem, num_comodos, endereco, alugada, condominio_id) VALUES
(32.0, 4, "Rua Parana", 'V', 1),
(28.0, 3, "Rua Honduras", 'V', 1),
(35.0, 4, "Rua Alemanha", 'F', 2),
(46.0, 6, "Rua Portugal", 'V', 3),
(30.0, 3, "Rua Minessota", 'F', 5),
(30.0, 5, "Rua Paraguai", 'F', 4),
(25.0, 2, "Rua Holanda", 'V', 4),
(30.0, 4, "Rua Australia", 'F', 4),
(40.0, 6, "Rua Peru", 'V', 2),
(35.0, 4, "Rua Mexico", 'V', 5);

INSERT INTO pessoa (nome, endereco) VALUES
("Lionel Messi", "Rua Vinte"),
("Cristiano Ronaldo", "Rua Queiroz"),
("Edinson Cavani", "Rua Turquia"),
("Alex Teixeira", "Rua Bom retiro"),
("Paolo Dybala", "Rua Repouso"),
("Ronaldinho", "Rua Futebol"),
("Carloz Vela", "Rua Alegria"),
("David Beckham", "Rua Antares"),
("David Silva", "Rua Paulista"),
("Andrea Pirlo", "Rua Consolacao");

 INSERT INTO sindico (vigencia, proprietario_id) VALUES
("2023-03-01", 6),
("2023-12-12", 5),
("2021-07-08", 7),
("2020-11-05", 4),
("2022-09-15", 3),
("2021-08-30", 9),
("2022-12-20", 2),
("2023-05-07", 8),
("2024-02-11", 2),
("2023-01-21", 1);


SELECT * FROM condominios 
WHERE nome_cond LIKE "a%";

SELECT * FROM uni_habitacional
WHERE id_uni = '1';

SELECT nome_cond, COUNT(id_cond) AS unidades
FROM condominios
GROUP BY nome_cond
ORDER BY unidades;

SELECT condominios.id_cond, condominios.nome_cond, condominios.endereco, uni_habitacional.condominio_id 
FROM condominios,  uni_habitacional
WHERE condominios.id_cond = uni_habitacional.condominio_id;

SELECT uni_habitacional.alugada, uni_habitacional.condominio_id, condominios.id_cond, condominios.nome_cond, condominios.endereco
FROM uni_habitacional, condominios
WHERE uni_habitacional.alugada LIKE'V' AND uni_habitacional.condominio_id = condominios.id_cond;

SELECT sindico.vigencia, sindico.proprietario_id, pessoa.id_pessoa, pessoa.nome, pessoa.endereco
FROM sindico, pessoa 
WHERE sindico.proprietario_id = pessoa.id_pessoa AND sindico.vigencia BETWEEN '2020-01-01' AND '2022-12-31';





