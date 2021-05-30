INSERT INTO disciplina VALUES
(4203010, 'Arquitetura e Organização de Computadores', 'AOC', 'T', 80),
(4203020, 'Arquitetura e Organização de Computadores', 'AOC', 'N', 80),
(4208010, 'Laboratório de Hardware', 'LH', 'T', 40),
(4226004, 'Banco de Dados', 'BD', 'T', 80),
(4213003, 'Sistemas Operacionais I', 'SOI', 'T', 80),
(4213013, 'Sistemas Operacionais I', 'SOI', 'N', 80),
(4233005, 'Laboratório de Banco de Dados', 'LBD', 'N', 80),
(5005220, 'Métodos Para a Produção do Conhecimento', 'MPPC', 'M', 40)
GO



INSERT INTO AVALIACAO VALUES
(1, 'P1'),
(2, 'P2'),
(3, 'P3'),
(4, 'T'),
(5, 'PP')
GO

EXEC sp_gerar_aulas