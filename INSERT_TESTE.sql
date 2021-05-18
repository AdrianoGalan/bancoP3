INSERT INTO ALUNO VALUES
(100, 'FULANO1'),
(101, 'FULANO2'),
(110, 'FULANO3'),
(130, 'FULANO4')
GO

INSERT INTO DISCIPLINA VALUES
('4203-010', 'Arquitetura e Organização de Computadores', 'AOC', 'T', 80),
('4203-020', 'Laboratório de Hardware', 'LBH', 'N', 40),
('4226-004', 'Banco de Dados', 'BD', 'T', 80)
GO

INSERT INTO FALTAS VALUES
(100, '4203-020', '10-01-2021', 2),
(100, '4203-020', '10-08-2021', 2)
GO

INSERT INTO AVALIACAO VALUES
(1, 'P1'),
(2, 'P2'),
(3, 'P3'),
(4, 'T')
GO

INSERT INTO NOTAS VALUES
(100, '4203-010', 1, 8.2),
(101, '4203-010', 1, 7.6),
(110, '4203-010', 1, 9.1),
(130, '4203-010', 1, 8.5)
GO

INSERT INTO NOTAS VALUES
(100, '4203-020', 1, 7),
(101, '4203-020', 1, 6),
(110, '4203-020', 1, 9),
(130, '4203-020', 1, 6)
GO

INSERT INTO NOTAS VALUES
(100, '4203-020', 2, 9),
(101, '4203-020', 2, 7),
(110, '4203-020', 2, 8),
(130, '4203-020', 2, 5)
GO

INSERT INTO NOTAS VALUES
--(100, '4203-020', 4, 8.1),
--(101, '4203-020', 4, 9),
--(110, '4203-020', 4, 3.8),
(130, '4203-020', 3, 8)
GO

