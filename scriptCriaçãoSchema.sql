-- Criando banco
CREATE DATABASE DB_FACULDADE;
-- Selecionando banco para utilização
USE DB_FACULDADE;

-- Criando tabelas
CREATE TABLE Departamento(
Cod_departamento INT PRIMARY KEY  AUTO_INCREMENT,
Nome_departamento VARCHAR(20) NOT NULL
);

CREATE TABLE Professor(
Cod_professor INT PRIMARY KEY AUTO_INCREMENT, 
Nome_professor VARCHAR(20) NOT NULL, 
Sobrenome_professor VARCHAR(50) NOT NULL, 
Status_professor TINYINT, 
Cod_departamento INT,
CONSTRAINT fk_Codigo_departamento FOREIGN KEY(Cod_departamento) REFERENCES Departamento (Cod_departamento)
);

CREATE TABLE Curso(
Cod_curso INT PRIMARY KEY AUTO_INCREMENT, 
Nome_curso VARCHAR(30), 
Cod_departamento INT, 
CONSTRAINT fk_Cod_departamento FOREIGN KEY (Cod_departamento) REFERENCES Departamento(Cod_departamento)
);

CREATE TABLE Turma(
Cod_turma INT PRIMARY KEY AUTO_INCREMENT, 
Cod_curso INT, 
Periodo VARCHAR(8), 
Num_alunos INT, 
Data_inicio DATE, 
Data_fim DATE,
CONSTRAINT fk_Codigo_curdo FOREIGN KEY (Cod_curso) REFERENCES Curso (Cod_curso)
);

CREATE TABLE Disciplina(
Cod_disciplina INT PRIMARY KEY AUTO_INCREMENT, 
Cod_disciplina_depende INT NULL, /* auto relacionamento*/
Nome_disciplina VARCHAR(30), 
Cod_departamento INT NOT NULL, 
Carga_horaria INT NOT NULL, 
Descrição VARCHAR(80), 
Num_alunos INT NOT NULL, 
CONSTRAINT fk_cod_departamento_disciplina FOREIGN KEY (Cod_departamento) REFERENCES Departamento (Cod_departamento), 
CONSTRAINT fk_codigo_disciplina FOREIGN KEY (Cod_disciplina_depende) REFERENCES Disciplina (Cod_disciplina)
);

CREATE TABLE Prof_Disciplina(
Cod_professor INT NOT NULL,
Cod_disciplina INT NOT NULL, 
PRIMARY KEY (Cod_professor, Cod_disciplina), /* chave primária composta*/
CONSTRAINT fk_Cod_professor_prof FOREIGN KEY (Cod_professor) REFERENCES Professor (Cod_professor), 
CONSTRAINT fk_cod_disciplina_prof FOREIGN KEY (Cod_disciplina) REFERENCES Disciplina (Cod_disciplina)
);

CREATE TABLE Curso_Disciplina(
Cod_curso INT NOT NULL, 
Cod_disciplina INT NOT NULL, 
PRIMARY KEY (Cod_curso, Cod_disciplina), 
CONSTRAINT fk_cod_curso_disci FOREIGN KEY (Cod_curso) REFERENCES Curso (Cod_curso), 
CONSTRAINT fk_cod_disciplina_disci FOREIGN KEY (Cod_disciplina) REFERENCES Disciplina (Cod_disciplina)
);

CREATE TABLE Aluno(
RA INT PRIMARY KEY AUTO_INCREMENT, 
Nome_aluno VARCHAR(20) NOT NULL,
Sobrenome_aluno VARCHAR(20) NOT NULL, 
CPF VARCHAR(11) NOT NULL, 
Status_aluno TINYINT(1) NOT NULL, 
Cod_turma INT, 
Sexo VARCHAR(1), 
Cod_curso INT, 
Nome_pai VARCHAR(50), 
Nome_mae VARCHAR(50) NOT NULL, 
Email VARCHAR(50) NOT NULL, 
Whatsapp VARCHAR(50) NOT NULL, 
CONSTRAINT fk_cod_turma_aluno FOREIGN KEY (Cod_turma) REFERENCES Turma (Cod_turma), 
CONSTRAINT fk_cod_curso_aluno FOREIGN KEY (Cod_curso) REFERENCES Curso (Cod_curso)
); 

CREATE TABLE Aluno_disc(
RA INT NOT NULL, 
Cod_disciplina INT NOT NULL, 
PRIMARY KEY (RA, Cod_disciplina),
CONSTRAINT fk_RA_aluno FOREIGN KEY (RA) REFERENCES Aluno (RA), 
CONSTRAINT fk_cod_disciplina_aluno FOREIGN KEY (Cod_disciplina) REFERENCES Disciplina (Cod_disciplina)
);

CREATE TABLE Historico(
Cod_historico INT PRIMARY KEY AUTO_INCREMENT, 
RA INT NOT NULL, 
Data_inicio DATE NOT NULL, 
Data_final DATE, 
CONSTRAINT fk_cod_RA FOREIGN KEY (RA) REFERENCES Aluno (RA)
);

CREATE TABLE Disc_hist(
Cod_historico INT NOT NULL, 
Cod_disciplina INT NOT NULL, 
Nota INT, 
Frequencia INT,
PRIMARY KEY (Cod_disciplina, Cod_historico), 
CONSTRAINT fk_cod_historico FOREIGN KEY (Cod_historico) REFERENCES Historico (Cod_historico), 
CONSTRAINT fk_cod_disciplina_hist FOREIGN KEY (Cod_disciplina) REFERENCES Disciplina (Cod_disciplina)
);

CREATE TABLE Tipo_telefone(
Cod_tipo_telefone INT PRIMARY KEY AUTO_INCREMENT, 
Tipo_telefone VARCHAR(8)
);

CREATE TABLE Telefones_aluno(
Cod_telefones_aluno INT PRIMARY KEY AUTO_INCREMENT, 
RA INT NOT NULL, 
Cod_tipo_telefone INT NOT NULL, 
Num_telefone VARCHAR(20) NOT NULL, 
CONSTRAINT fk_cod_RA_tel FOREIGN KEY (RA) REFERENCES Aluno (RA), 
CONSTRAINT fk_cod_tipo_telefone FOREIGN KEY (Cod_tipo_telefone) REFERENCES Tipo_telefone (Cod_tipo_telefone)
);

CREATE TABLE Tipo_logradouro(
Cod_tipo_logradouro INT PRIMARY KEY AUTO_INCREMENT, 
Tipo_logradouro VARCHAR(11)
);

CREATE TABLE Endereco_aluno(
Cod_endereco_aluno INT PRIMARY KEY AUTO_INCREMENT, 
RA INT NOT NULL, 
Cod_tipo_logradouro INT NOT NULL, 
Nome_rua VARCHAR(50) NOT NULL, 
Num_rua INT NOT NULL, 
Complemento VARCHAR(20) NULL, 
CEP VARCHAR(8) NOT NULL, 
CONSTRAINT fk_cod_RA_end FOREIGN KEY (RA) REFERENCES Aluno (RA), 
CONSTRAINT fk_cod_tipo_logradouro FOREIGN KEY (Cod_tipo_logradouro) REFERENCES Tipo_logradouro (Cod_tipo_logradouro)
);















