CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL

);

CREATE TABLE curso (
	id SERIAL NOT NULL UNIQUE, -- Quero que o ID não possua valores nulos ou duplicados
	nome varchar(255) NOT NULL
);

-- Os dois códigos fazem em essência a mesma coisa, além de um ID, a primary key não permite valores nulos ou duplicados

CREATE TABLE curso (
	id SERIAL PRIMARY KEY,
	nome varchar(255) NOT NULL
)

CREATE TABLE aluno_curso (
	alunoID INTEGER,
	cursoID INTEGER,
	PRIMARY KEY(alunoID, cursoID),
	
	-- Chave estrangeira existe para limitarmos dados que referenciam a mesma coisa, em diferentes tabelas.
	-- Nesse caso, eu poderia incluir um aluno, ou curso que não existe na tebela 'aluno'/'curso' nesta tabela
	-- Com a chave estrangeira, eu não posso mais :)
	FOREIGN KEY (alunoID) REFERENCES aluno(id),
	FOREIGN KEY (cursoID) REFERENCES curso(id)
)

-- Dá erro
INSERT INTO curso (id, nome) VALUES (01, 'html')
INSERT INTO curso (id, nome) VALUES (01, 'css')

INSERT INTO curso (id, nome) VALUES (02, 'CSS')


INSERT INTO aluno (id, nome) VALUES (01, 'Diogo')

-- Dá erro, pois estou tentando incluir um ID que não existe na tabela alunos
-- Lembrando, que alunoID é uma chave estrangeira que referencia a tabela aluno(id),
-- Portanto, se naquela tabela o ID não existe, eu não posso adicioná-lo nesta tabela
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (2, 1)

INSERT INTO aluno_curso (alunoID, cursoID) VALUES (1, 1)

SELECT * FROM curso
SELECT * FROM aluno

DROP TABLE curso
DROP TABLE aluno

-- Quando quero fazer uma consulta com dados de tabelas diferentes, eu não irei fazer duas consultas, consultando uma tabela por vez
-- Mas sim, farei a junção dessas tabelas, PARA A CONSULTA
-- Nesse caso, estou juntando a tabela aluno, com aluno_curso, e quero que ele retorne todos os dados dos alunos que estiverem cadastrados
-- na tabela aluno, e vinculados a um curso, na tabela aluno_curso
SELECT aluno.nome AS "Nome do aluno", 
	   curso.nome AS "Nome do curso"
	FROM aluno
		JOIN aluno_curso 
			ON aluno_curso.alunoID = aluno.id
		JOIN curso 
			ON aluno_curso.cursoID = curso.id

INSERT INTO aluno_curso (alunoID, cursoID) VALUES (01, 02)
