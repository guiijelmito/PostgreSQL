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
INSERT INTO aluno_curso (alunoID, cursoID) VALUES (2, 1);

INSERT INTO aluno_curso (alunoID, cursoID) VALUES (1, 1);

SELECT * FROM curso
SELECT * FROM aluno

DROP TABLE curso
DROP TABLE aluno

INSERT INTO aluno (id, nome) VALUES (2, 'Nico');
INSERT INTO curso (id, nome) VALUES (3, 'JavaScript');


-- Neste código, a cláusula FULL OUTER JOIN retorna todos os registros
-- quando há uma correspondência em qualquer uma das tabelas aluno ou curso.
-- Portanto, isso incluirá alunos que não estão matriculados em nenhum curso e cursos que não têm alunos matriculados.

-- FULL OUTER JOIN: Retorna todos os registros das tabelas de uma junção (LEFT ou RIGHT)
-- mesmo que não haja correspondência (relação) entre elas.
SELECT a.nome AS "Nome do aluno", c.nome AS "Nome do curso"
FROM aluno a 
LEFT JOIN aluno_curso ac ON a.id = ac.alunoID
FULL OUTER JOIN curso c ON c.id = ac.cursoID

-- Quando minha preocupação é pegar todas as incidências relacionadas de tabela
-- e as da direita que não são também. Nesse caso, os alunos que tenham cursos e os alunos que não tenham cursos
SELECT a.nome AS "Nome do aluno", c.nome AS " Nome do curso"
FROM aluno a LEFT JOIN aluno_curso ac ON a.id = ac.alunoID
LEFT JOIN curso c ON c.id = ac.cursoID

-- Quando minha preocupação é pegar todas as incidências relacionadas de tabela
-- e as da direita que não são também. Nesse caso, os alunos que tenham curso e os cursos que não tenham alunos
SELECT a.nome AS "Nome do aluno", c.nome AS " Nome do curso"
FROM aluno a RIGHT JOIN aluno_curso ac ON a.id = ac.alunoID
RIGHT JOIN curso c ON c.id = ac.cursoID

-- Nesse caso, to querendo todos que tenham relação e os que não tenham relação, quero todo mundo
SELECT a.nome AS "Nome do aluno", c.nome AS " Nome do curso"
FROM aluno a FULL JOIN aluno_curso ac ON a.id = ac.alunoID
FULL JOIN curso c ON c.id = ac.cursoID

-- PRODUTO CARTESIANO
-- aluno x curso
SELECT a.nome AS "Nome do aluno", c.nome AS " Nome do curso"
FROM aluno a CROSS JOIN curso c 






