INSERT INTO ALUNO VALUES
(100, 'FULANO1'),
(101, 'FULANO2'),
(110, 'FULANO3'),
(130, 'FULANO4')
GO

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

INSERT INTO FALTAS VALUES
(100, 4203020, '10-01-2021', 2),
(100, 4203020, '10-08-2021', 2)
GO

INSERT INTO AVALIACAO VALUES
(1, 'P1'),
(2, 'P2'),
(3, 'P3'),
(4, 'T'),
(5, 'PP')
GO

INSERT INTO NOTAS VALUES
(100, 4203010, 1, 8.2),
(101, 4203010, 1, 7.6),
(110, 4203010, 1, 9.1),
(130, 4203010, 1, 8.5)
GO

INSERT INTO NOTAS VALUES
(100, 4203020, 1, 7),
(101, 4203020, 1, 6),
(110, 4203020, 1, 9),
(130, 4203020, 1, 6)
GO

INSERT INTO NOTAS VALUES
(100, 4203020, 2, 9),
(101, 4203020, 2, 7),
(110, 4203020, 2, 8),
(130, 4203020, 2, 5)
GO

INSERT INTO NOTAS VALUES
(100, 4203020, 4, 8.1),
(101, 4203020, 4, 9),
(110, 4203020, 4, 3.8),
(130, 4203020, 3, 8)
GO

INSERT INTO FALTAS VALUES
(100,4203020,'01-01-2001',4)
