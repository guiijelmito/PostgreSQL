CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL

);

CREATE TABLE curso (
	id SERIAL NOT NULL UNIQUE, 
	nome varchar(255) NOT NULL
);

CREATE TABLE curso (
	id SERIAL PRIMARY KEY,
	nome varchar(255) NOT NULL
)

SELECT * FROM curso
SELECT * FROM aluno

DROP TABLE curso
DROP TABLE aluno

SELECT aluno.nome AS "Nome do aluno", 
	   curso.nome AS "Nome do curso"
	FROM aluno
		JOIN aluno_curso 
			ON aluno_curso.alunoID = aluno.id
		JOIN curso 
			ON aluno_curso.cursoID = curso.id

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');
INSERT INTO curso (id, nome) VALUES (3, 'CSS');
INSERT INTO curso (id, nome) VALUES (4, 'React');

INSERT INTO aluno (id, nome) VALUES (1, 'Diogo');
INSERT INTO aluno (id, nome) VALUES (2, 'Nina');
INSERT INTO aluno (id, nome) VALUES (3, 'Gina');
INSERT INTO aluno (id, nome) VALUES (4, 'Marcos');

INSERT INTO aluno_curso (alunoID, cursoID) VALUES (1, 1);
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (2, 1);
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (3, 1);
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (4, 2);
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (4, 1);
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (2, 3);

DELETE FROM aluno;
DELETE FROM curso;
DELETE FROM aluno_curso;

SELECT a.nome AS "Nome do aluno", c.nome AS "Nome do curso"
FROM aluno a FULL JOIN aluno_curso ac ON a.id = ac.alunoID
FULL JOIN curso c ON c.id = ac.cursoID


-- Por padrão, quando se cria uma chave estrangeira no PostgreSQL também se cria uma restrição em cima daquela chave/atributo
SELECT * FROM aluno;
SELECT * from curso;
SELECT * from aluno_curso;

-- Você é restringido de deletar um registro caso ele seja chave estrangeira de uma outra tabela, pois, se apagar na original, 
-- ela existiria na estrangeira como um falso dado, logo, vocé é impedido.
DELETE FROM aluno WHERE aluno.id = 1;
DELETE FROM curso WHERE curso.id = 1;

CREATE TABLE aluno_curso (
	alunoID INTEGER,
	cursoID INTEGER,
	
	PRIMARY KEY(alunoID, cursoID),
	FOREIGN KEY (alunoID) REFERENCES aluno(id),
	FOREIGN KEY (cursoID) REFERENCES curso(id)
	ON DELETE RESTRICT -- Padrão SQL
);

DROP TABLE aluno_curso;

-- Porém, existe uma alternativa a isto: 
-- Ao deletar um registro, os registros que possuem chaves estrangeiras vindas dele
-- também são deletados por cascata
CREATE TABLE aluno_curso (
	alunoID INTEGER,
	cursoID INTEGER,
	
	PRIMARY KEY(alunoID, cursoID),
	FOREIGN KEY (alunoID) REFERENCES aluno(id)
	ON DELETE CASCADE,
	FOREIGN KEY (cursoID) REFERENCES curso(id)
	ON DELETE CASCADE 
);

-- Por padrão, o PostgreSQL também restringe a atualização de atributos que são chaves estrangeiras
-- podendo ignorar registros que não são chave estrangeiras, mas que outros da mesma tabela são
UPDATE aluno
SET id = 10
WHERE id = 1;

-- Para isso, pode-se também mudar a restrição de UPDATE para cascata
CREATE TABLE aluno_curso (
	alunoID INTEGER,
	cursoID INTEGER,
	
	PRIMARY KEY(alunoID, cursoID),
	FOREIGN KEY (alunoID) REFERENCES aluno(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (cursoID) REFERENCES curso(id)
	ON DELETE CASCADE 
);

UPDATE aluno
SET id = 10
WHERE id = 1;
