use caseModelagem;

CREATE TABLE trilhaAuditoria
(
	codigo_trilha_auditoria INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	usuario_responsavel VARCHAR (200),
	data_hora DATETIME,
	tipo_acao VARCHAR (1),
)

CREATE TABLE situacaoUsuario
(
	codigo_situacao INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	situacao VARCHAR (50),
)

CREATE TABLE usuario
(
	codigo_usuario INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	nome VARCHAR (200),
	CONSTRAINT situacaoUsuario FOREIGN KEY (codigo_situacao) REFERENCES situacaoUsuario(codigo_situacao)
)

CREATE TABLE endereco
(
	codigo_endereco INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	logradouro VARCHAR(200),
	numero INT,
	cidade VARCHAR (200),
	bairro VARCHAR (200),
	estado VARCHAR (200),
	cep VARCHAR (200),
)

CREATE TABLE contato
(
	codigo_contato INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	telefone_principal VARCHAR (100) NOT NULL,
	telefone_secundariol VARCHAR (100),
)

CREATE TABLE conhecimentoModelagem
(
	codigo_conhecimento_modelagem INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	nome_conhecimento VARCHAR (200),
	detalhe_conhecimento VARCHAR (200)	
)

CREATE TABLE nivelConhecimento
(
	codigo_nivel INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	nivel_conhecimento VARCHAR (200),
)

CREATE TABLE listaConsultoria
(
	codigo_lista_consultoria INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	nome_consultoria VARCHAR (200),
)

CREATE TABLE situacaoCandidato
(
	codigo_situacao INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	nome_situacao VARCHAR (100),
)

CREATE TABLE listaFormacaoAcademica
(
	codigo_lista_formacao INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	nome_curso VARCHAR (200),
	institucao_ensino VARCHAR (50)
)

CREATE TABLE candidatoxConhecimentoModelagem
(
	codigo_conhecimento_modelagem INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	CONSTRAINT nivelConhecimento FOREIGN KEY (codigo_nivel) REFERENCES nivelConhecimento(codigo_nivel),
	CONSTRAINT conhecimentoModelagem FOREIGN KEY (codigo_conhecimento_modelagem) REFERENCES conhecimentoModelagem(codigo_conhecimento_modelagem),
	CONSTRAINT candidato FOREIGN KEY (codigo_candidato) REFERENCES candidato(codigo_candidato)
)

CREATE TABLE candidato
(
	codigo_candidato INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	nome VARCHAR (200),
	cpf VARCHAR (50),
	data_aniversario DATE,
	funcionarioInstituicao BIT,
	CONSTRAINT endereco FOREIGN KEY (codigo_endereco) REFERENCES endereco(codigo_endereco),
	CONSTRAINT contato FOREIGN KEY (codigo_contato) REFERENCES contato(codigo_contato),
	CONSTRAINT vinculoConsultoria FOREIGN KEY (codigo_consultoria) REFERENCES vinculoConsultoria(codigo_consultoria),
	CONSTRAINT candidatoxFormacaoAcademica FOREIGN KEY (codigo_formacao) REFERENCES candidatoxFormacaoAcademica(codigo_formacao)
)

CREATE TABLE candidatoxFormacaoAcademica
(
	codigo_formacao INT IDENTITY (1, 1)NOT NULL PRIMARY KEY,
	ano_conclusao DATE,
	CONSTRAINT candidato FOREIGN KEY (codigo_candidato) REFERENCES candidato(codigo_candidato),
	CONSTRAINT listaFormacaoAcademica FOREIGN KEY (codigo_lista_formacao) REFERENCES listaFormacaoAcademica(codigo_lista_formacao),
)

CREATE TABLE vinculoConsultoria
(
	codigo_consultoria INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	CONSTRAINT listaConsultoria FOREIGN KEY (codigo_lista_consultoria) REFERENCES listaConsultoria(codigo_lista_consultoria),
	CONSTRAINT situacaoCandidato FOREIGN KEY (codigo_situacao) REFERENCES situacaoCandidato(codigo_situacao),
)

CREATE TABLE desempenhoSelecaoExercicioTecnico
(
	codigo_selecao_exercicio_tecnico INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	data_entrega_exercicio DATE,
	pontos_destaque VARCHAR (200),
	erro VARCHAR (200),
	avaliacao_final BIT,
	CONSTRAINT candidato FOREIGN KEY (codigo_candidato) REFERENCES candidato(codigo_candidato),
)

CREATE TABLE desempenhoSelecaoEntrevista
(
	codigo_selecao_entrevista INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	data_entrevista DATE,
	consideracoes_observadas VARCHAR (200),
	avaliacao_final BIT,
	CONSTRAINT candidato FOREIGN KEY (codigo_candidato) REFERENCES candidato(codigo_candidato),
)

