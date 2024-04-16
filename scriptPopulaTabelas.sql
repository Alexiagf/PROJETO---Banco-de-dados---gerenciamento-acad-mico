-- Inserindo dados nas tabelas

INSERT INTO Departamento (Nome_departamento)
VALUES
('Ciências Humanas'), 
('Matemática'), 
('Biológicas'), 
('Estágio');

INSERT INTO Professor (Nome_Professor, Sobrenome_Professor, Status_Professor, Cod_Departamento)
VALUES
('Fábio', 'dos Reis', 0, 5),
('Sophie', 'Allemand', 1, 6),
('Monica', 'Barroso', 1, 7);

INSERT INTO Curso (Nome_curso, Cod_departamento)
VALUES
('Matemática', 6), 
('Psicologia', 5),
('Análise de Sistemas', 6),
('Biologia', 7),
('história', 5);

INSERT INTO Turma (Cod_Curso, Periodo, Num_Alunos, Data_Inicio, Data_Fim)
VALUES
(2, 'Manhã', 20, '2024-04-15', '2028-04-24'),
(1, 'Noite', 10, '2014-05-12', '2020-03-05'),
(3, 'Tarde', 15, '2012-05-12', '2014-05-10');

INSERT INTO Disciplina (Nome_Disciplina, Cod_Departamento, Carga_Horaria, Descrição, Num_Alunos)
VALUES
('Raciocínio Lógico', 6, 1200, 'Desenvolver o raciocínio lógico', 50),
('Psicologia Cognitiva', 5, 1400, 'Entender o funcionamento do aprendizado', 30),
('Programação em C', 6, 1200, 'Aprender uma linguagem de programação', 20),
('Eletrônica Digital', 6, 300, 'Funcionamento de circuitos digitais', 30);

INSERT INTO Aluno (Nome_Aluno, Sobrenome_Aluno, CPF, Status_Aluno, Cod_Turma, Sexo, Cod_Curso, Nome_Pai, Nome_Mae, Email, Whatsapp)
VALUES
('Marcos', 'Aurelio Martins', 14278914536, 1, 2, 'M', 3, 'Marcio Aurelio', 'Maria Aparecida', 'marcosaurelio@gmail.com', 946231249),
('Gabriel', 'Fernando de Almeida', 14470954536, 1, 1, 'M', 1, 'Adão Almeida', 'Fernanda Almeida', 'gabrielalmeida@yahoo.com', 941741247),
('Beatriz', 'Sonia Meneguel', 1520984537, 1, 3, 'F', 3, 'Samuel Meneguel', 'Gabriella Meneguel', 'batrizmene@hotmail.com', 945781412),
('Jorge', 'Soares', 14223651562, 1, 3, 'M', 2, 'João Soares', 'Maria Richter', 'jorgesoares@gmail.com', 925637857),
('Ana Paula', 'Ferretti', 32968914522, 1, 3, 'F', 1, 'Marcio Ferretti', 'Ana Hoffbahn', 'anapaulaferretti@hotmail.com', 974267423),
('Mônica', 'Yamaguti', 32988914510, 1, 2, 'F', 2, 'Wilson Oliveira', 'Fernanda Yamaguti', 'monyamaguti@outlook.com', 932619560);

INSERT INTO Aluno_Disc (RA, Cod_Disciplina)
VALUES
(7, 5),
(8, 6),
(12, 7),
(10, 8),
(9, 5),
(11, 8);

INSERT INTO Curso_Disciplina(Cod_Curso, Cod_Disciplina)
VALUES
(1, 5),
(2, 6),
(3, 7),
(3, 8);

INSERT INTO Prof_Disciplina(Cod_Professor, Cod_Disciplina)
VALUES
(7, 5),
(8, 6),
(9, 7),
(9, 8);

INSERT INTO Historico (RA, Data_Inicio, Data_Final)
VALUES
(10, '2016-05-12', '2017-10-15'),
(7, '2014-05-12', '2020-03-05'),
(9, '2010-05-12', '2012-05-10');

INSERT INTO Tipo_Logradouro (Tipo_Logradouro)
VALUES
('Rua'),
('Avenida'),
('Alameda'),
('Travessa');

INSERT INTO Endereco_Aluno (RA, Cod_Tipo_Logradouro, Nome_Rua, Num_Rua, Complemento, CEP)
VALUES
(7, 1, 'das Giestas', 255, 'Casa 02', 02854000),
(8, 3, 'Lorena', 10, 'Apto 15', 02945000),
(9, 2, 'do Cursino', 1248, '', 0851040),
(10, 1, 'das Heras', 495, '', 03563142),
(11, 3, 'Santos', 1856, '', 04523963),
(12, 4, 'Matão', 206, '', 04213650);

