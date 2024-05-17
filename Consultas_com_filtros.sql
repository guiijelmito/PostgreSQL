CREATE TABLE aluno (
	id SERIAL, -- Um número de série criado por instância de inclusão, e que é INCREMENTADO AUTOMATICAMENTE
	nome VARCHAR(255), -- Existe uma estimativa do tamanho do texto, porém ainda é variável
	CPF CHAR(11), -- O tamanho do texto é constante, se o tamanho não for preenchido, completa com espaços em branco
	observacao TEXT, -- Não se sabe o tamanho do texto
	idade INTEGER, -- Quando se quer um inteiro (numérico sem casas decimais)
	dinheiro NUMERIC(10, 2), -- Quando se que um númeror um número com X dígitos (Ex: 10), e Y casas decimais (Ex: 2)
	ativo BOOLEAN, -- Booliiiiiiããããããn
	data_nasc DATE, -- Data
	hora_aula TIME, -- Hora
	matricula TIMESTAMP -- Data e Hora
);

-- Seleceiona (atributo(s)) de (tabela)
-- * : Todos os atributos
SELECT * From alunos

-- Atualizar os dados de uma instância
--	UPDATE (tabela)
--	SET (atributo) = (novo valor)
-- WHERE onde essa condição se satisfaça (PRECISA DE WHERE, SENÃO IRA ALTERAR TODOS OS ELEMENTOS DA TABELA)
UPDATE alunos
SET nome = 'Gui Souza'
WHERE id = 1	

-- AS (Alias): Nome/identificador/APELIDO que se da a algum registro/tabela
-- Usado para quando queremos que nossos registros aparecam com nomes diferentes, útil em diferentes situações
SELECT nome AS "Nome do aluno", -- Alias são com " "
	   cpf,
	   dinheiro AS bufunfa  
FROM alunos

INSERT INTO alunos (nome) VALUES ('Joao');
INSERT INTO alunos (nome) VALUES ('Marcos');
INSERT INTO alunos (nome) VALUES ('Pedro');
INSERT INTO alunos (nome) VALUES ('Nina');
INSERT INTO alunos (nome) VALUES ('Paula');
INSERT INTO alunos (nome) VALUES ('Gina');


SELECT nome
FROM alunos
WHERE nome = 'Joao'

-- Nesse caso, como ele não acha nenhum registro com esse nome, ele retorna nada
SELECT nome
FROM alunos
WHERE nome = 'Cabral' 

-- <> / != : Diferente de
SELECT nome
FROM alunos
WHERE nome <> 'Nina'

-- LIKE: É usado juntamento com:
-- 			_ : Puxa os registros que terminem com a cadeia de caractéres seguinte ao _ ou anteriores ao _
--			% : Puxa os registros que possuem os caractéres anteriores ao %
SELECT nome 
FROM alunos 
WHERE nome LIKE '_ina'

SELECT nome 
FROM alunos
WHERE nome LIKE 'P%'

SELECT nome 
FROM alunos
WHERE nome LIKE '%s'

-- Puxa os registros que possuem nome com 'a' e 's'
SELECT nome 
FROM alunos
WHERE nome LIKE '%s%'
	AND nome LIKE '%a%'

-- Puxa os registros que possuem algum 'o' no nome
SELECT nome
FROM alunos
WHERE nome LIKE '%o%'

-- Puxa os registros que não possuem o campo CPF preenchido
SELECT * 
FROM alunos
WHERE cpf IS null

-- Puxa os registros que tenha idade = 20
SELECT *
FROM alunos
WHERE idade = 20

-- Puxa os registro que possuem idade entre 10 e 30 anos 
SELECT *
FROM alunos
WHERE idade BETWEEN 10 AND 30

SELECT *
FROM alunos
WHERE ativo = True