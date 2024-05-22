use db_faculdade;

-- consultar RA, nome completo, nome do curso, período das turmas, ordenado pelo primeiro nome dos alunos. 
SELECT RA, nome_aluno, sobrenome_aluno, nome_curso, periodo
FROM aluno A
INNER JOIN curso C 
ON A.cod_curso = C.cod_curso
INNER JOIN turma T 
ON T.cod_turma = A.cod_turma
ORDER BY A.nome_aluno;

-- consultar todas as disciplinas cursadas por um aluno, com suas respectivas notas
-- aluno: RA 9 (Beatriz)

SELECT A.RA, nome_aluno, nome_disciplina, nota
FROM historico H
INNER JOIN disc_hist  DH
ON H.cod_historico = DH.cod_historico
INNER JOIN disciplina D 
ON D.Cod_disciplina = DH.Cod_disciplina
INNER JOIN aluno A 
ON H.RA = A.RA
where A.RA = 9;

SELECT nome_aluno, nome_disciplina, nota
FROM aluno A
INNER JOIN aluno_disc AD
on A.RA = AD.RA
INNER JOIN disciplina D 
ON AD.cod_disciplina = D.Cod_disciplina
INNER JOIN historico H
ON H.RA = A.RA
INNER JOIN disc_hist DH 
ON H.cod_historico = DH.cod_historico
WHERE A.RA = 9;

-- nome e sobrenome dos professores, com as disciplinas que ministram e cargas horárias

SELECT CONCAT(P.nome_professor, ' ', P.sobrenome_professor) AS Docente, D.nome_disciplina, 
D.carga_horaria
FROM professor P 
INNER JOIN prof_disciplina PD
ON P.cod_professor = PD.cod_professor
INNER JOIN disciplina D 
ON PD.cod_disciplina = D.cod_disciplina;

-- nomes e sobrenome dos alunos, tipos e números de telefone e endereço completo

SELECT CONCAT(A.nome_aluno, ' ', A.sobrenome_aluno) AS Discente,  TA.num_telefone, TL.Tipo_telefone,
CONCAT('Rua', ' ', EA.nome_rua, ', ', EA.num_rua, ', ', EA.CEP) AS Endereço
FROM aluno A
INNER JOIN endereco_aluno EA
ON A.RA = EA.RA
INNER JOIN telefones_aluno TA
ON A.RA = TA.RA
INNER JOIN tipo_telefone TL
ON TA.Cod_tipo_telefone = TL.Cod_tipo_telefone; 

-- disciplinas, indicando seus departammentos, cursos e professores

SELECT D.nome_disciplina, DP.nome_departamento, C.nome_curso, 
concat(P.nome_professor, ' ', P.sobrenome_professor) AS Docente
FROM disciplina D 
INNER JOIN departamento DP
ON D.Cod_departamento = DP.cod_departamento
INNER JOIN curso_disciplina CD
ON CD.cod_disciplina = D.cod_disciplina
INNER JOIN curso C
ON C.cod_curso = CD.cod_curso
INNER JOIN prof_disciplina PD
ON D.Cod_disciplina = PD.Cod_disciplina
INNER JOIN professor P 
ON PD.Cod_professor = P.Cod_professor;