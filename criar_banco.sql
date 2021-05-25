-- Create a new database called 'SIGA'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'SIGA'
)
CREATE DATABASE SIGA
GO

USE SIGA
GO


CREATE TABLE ALUNO
(
    RA                  INT NOT NULL    PRIMARY KEY, -- primary key column
    NOME                VARCHAR(MAX)    NOT NULL    
);
GO

CREATE TABLE DISCIPLINA(

    CODIGO              INT             NOT NULL    PRIMARY KEY ,
    NOME                VARCHAR (150)   NOT NULL,
    SIGLA               VARCHAR (10)    NOT NULL,
    TURNO               CHAR(1)         NOT NULL    CHECK (TURNO = 'M' OR TURNO = 'T'OR TURNO = 'N'),
    NUM_AULAS           INT             NOT NULL
)
GO

CREATE TABLE AULAS (
    ID                  INT IDENTITY,
    CODIGO_DISCIPLINA   INT,
    DATA                DATE,
    HORARIO             CHAR(13)
    PRIMARY KEY (ID)
    FOREIGN KEY (CODIGO_DISCIPLINA) REFERENCES disciplina (codigo)
)


CREATE TABLE FALTAS(

    RA_ALUNO            INT             NOT NULL,
    ID_AULA             INT             NOT NULL,
    FALTA               INT             NOT NULL
    PRIMARY KEY(RA_ALUNO, ID_AULA)
    FOREIGN KEY(RA_ALUNO)               REFERENCES ALUNO(RA),
    FOREIGN KEY(ID_AULA)                REFERENCES AULAS(ID)
)
GO


CREATE TABLE AVALIACAO(

    CODIGO              INT             PRIMARY KEY,
    TIPO                VARCHAR(2)      NOT NULL
 
)
GO

CREATE  TABLE NOTAS(

    RA_ALUNO            INT             NOT NULL,
    CODIGO_DISCIPLINA   INT             NOT NULL,
    CODIGO_AVALIACAO    INT             NOT NULL,
    NOTA                DECIMAL(4,2)    NOT NULL    CHECK (NOTA >= 0 AND NOTA <= 10)
    PRIMARY KEY(RA_ALUNO, CODIGO_DISCIPLINA, CODIGO_AVALIACAO)
    FOREIGN KEY(RA_ALUNO)               REFERENCES ALUNO(RA),
    FOREIGN KEY(CODIGO_DISCIPLINA)      REFERENCES DISCIPLINA(CODIGO),
    FOREIGN KEY(CODIGO_AVALIACAO)       REFERENCES AVALIACAO(CODIGO)
)
GO