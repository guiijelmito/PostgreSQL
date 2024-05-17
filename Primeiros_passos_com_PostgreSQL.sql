CREATE TABLE alunos (
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

-- Insere em (tabela)+(atributos desejados) VALUES (valores)
-- 		Caso os atributos não sejam especificados, será necessário preencher todos os atributos da instância
INSERT INTO alunos (
	nome, 
	cpf,
	observacao,
	idade,
	dinheiro,
	ativo,
	data_nasc,
	hora_aula,
	matricula
) 
VALUES (
	'Guilherme',
	'14445914606',
	'É o estudas',
	20,
	0.71,
	TRUE,
	'2003-07-27', -- YYYY-MM-DD
	'16:46:54',  -- HH24:MI:SS
	'2024-02-15 16:47:21'
)

-- Atualizar os dados de uma instância
--	UPDATE (tabela)
--	SET (atributo) = (novo valor)
-- WHERE onde essa condição se satisfaça (PRECISA DE WHERE, SENÃO IRA ALTERAR TODOS OS ELEMENTOS DA TABELA)
UPDATE alunos
SET nome = 'Gui Souza'
WHERE id = 1	

SELECT nome from alunos
WHERE id = 1

-- Deletar um registro da tabela
--	DELETE FROM (nome da tabela)
--	WHERE (condição para deletar) !(NOVAMENTE, NÃO SE ESQUEÇA DO WHERE, SENÃO TUDO SERA APAGADO)!
DELETE FROM alunos
WHERE id = 2

