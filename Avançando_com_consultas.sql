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

CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	matricula char(10) UNIQUE NOT NULL,
	nome varchar(255),
	sobrenome varchar(255)
);

DROP TABLE funcionatios;

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001','Diogo','Cezar');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002','Vinícius','Silva');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003','Nico','Robin');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004','João','Alberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005','Diogo','Cezar');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006','Alberto','Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007','Diogo','Oliveira');

-- Ordenação por ordem alfabética
SELECT * FROM funcionarios
ORDER BY nome

-- Ordenação por ordem alfabética decrescente
SELECT * FROM funcionarios
ORDER BY nome DESC

-- Ordenação primeiro por ordem alfabética, depois por número de matrícula
SELECT * FROM funcionarios
ORDER BY nome, matricula

-- Ordenação pelo número da coluna (da esquerda para a direita)
SELECT * FROM funcionarios
ORDER BY 4 -- Coluna

-- Ordens de ordenação pelos números das colunas
SELECT * FROM funcionarios
ORDER BY 3, 4, 2

-- Ordem de ordenação pelo:
-- Número da coluna descrescente, nome decrescente, número da coluna crescente
SELECT * FROM funcionarios 
ORDER BY 4 DESC, nome DESC, 2 ASC

-- Para casos onde estão se usando duas tabelas e 
-- elas possuem um atributo com o mesmo nome
SELECT * FROM funcionarios f
ORDER BY 4 DESC, f.nome DESC, 2 ASC



SELECT * FROM funcionarios LIMIT 5;

SELECT * FROM funcionarios 
ORDER BY matricula
LIMIT 5 -- Limita o número de registros a serem retornados
OFFSET 1; -- Ignora o número de registros (nesse caso, o primeiro)

SELECT * FROM funcionarios 
ORDER BY matricula
LIMIT 5 
OFFSET 3;

-- COUNT: Retorna a quantidade de registros
SELECT COUNT(id) FROM funcionarios;

-- SUM: Retorna a soma dos registros
SELECT SUM(id) FROM funcionarios;

-- MAX: Retorna o maior valor dos registros
SELECT MAX(id) FROM funcionarios;

-- MIN: Retorna o menor valor dos registros
SELECT MIN(id) FROM funcionarios;

-- AVG: Retorna a média dos valores dos registros
SELECT ROUND(AVG(id), 0) FROM funcionarios;

-- Problema de nome repetido:
-- Se faz uma consulta de nomes, porém, há registros com os nomes repitidos
SELECT nome FROM funcionarios
ORDER BY nome;

-- Uma solução para isso é o DISTINCT, que não retorna
-- registros com valores iguais 
SELECT DISTINCT nome FROM funcionarios
ORDER BY nome;

-- Porém, o DISTINCT não funciona com funções agregadas
SELECT DISTINCT nome, COUNT(id) FROM funcionarios
ORDER BY nome;

SELECT nome, sobrenome, COUNT(id) FROM funcionarios
GROUP BY nome, sobrenome
ORDER BY nome;

SELECT DISTINCT nome, sobrenome, COUNT(id) FROM funcionarios
GROUP BY 1, 2
ORDER BY nome;

SELECT c.nome, COUNT(a.id) 
FROM aluno a JOIN aluno_curso ac
ON a.id = ac.alunoID JOIN curso c ON c.id = ac.cursoID
GROUP BY c.nome

SELECT c.nome, COUNT(a.id) 
FROM curso c LEFT JOIN aluno_curso ac
ON c.id = ac.cursoID 
JOIN aluno a ON a.id = ac.alunoID
-- WHERE não funciona com funções agregadas
GROUP BY c.nome
-- HAVING é usada quando se quer condicionais com funções e grupos 
HAVING COUNT(a.id) = 0

-- Retornar o nome dos funcionários duplicados e o número de duplicatas
SELECT f.nome, COUNT(f.id)
FROM funcionarios f
GROUP BY nome
HAVING COUNT(id) > 1;





