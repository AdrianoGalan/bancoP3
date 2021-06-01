USE SIGA
GO

CREATE FUNCTION FN_RELATORIO_FALTA(@CODIGO_DISCIPLINA INT)
RETURNS @table TABLE (

RA		    INT,
NOME		VARCHAR(MAX),
D1          CHAR(4),
D2          CHAR(4),
D3          CHAR(4),
D4          CHAR(4),
D5          CHAR(4),
D6          CHAR(4),
D7          CHAR(4),
D8          CHAR(4),
D9          CHAR(4),
D10         CHAR(4),
D11         CHAR(4),
D12         CHAR(4),
D13         CHAR(4),
D14         CHAR(4),
D15         CHAR(4),
D16         CHAR(4),
D17         CHAR(4),
D18         CHAR(4),
D19         CHAR(4),
D20         CHAR(4)
)
AS
BEGIN

    DECLARE @#DIA TABLE(
        ID INT IDENTITY,
        DIA  DATE
    )

      DECLARE @#ALUNO TABLE(
        ID      INT IDENTITY,
        RA      INT ,
        NOME    VARCHAR(MAX)
    )



    INSERT INTO @#DIA(DIA)
    SELECT A.[DATA] FROM AULAS A
    WHERE CODIGO_DISCIPLINA = @CODIGO_DISCIPLINA

    INSERT INTO @#ALUNO(RA, NOME)
    SELECT RA, NOME FROM FN_MATRICULADO(@CODIGO_DISCIPLINA)

    DECLARE @I          AS INT,
            @IA         AS INT,
            @N_FALTA    AS INT,
            @RA         AS INT
          

    SET @I = (SELECT COUNT(ID) FROM @#DIA)
    SET @IA = (SELECT COUNT(RA) FROM @#ALUNO)


    WHILE(@IA > 0)
    BEGIN

        SET @RA = (SELECT RA FROM @#ALUNO WHERE ID = @IA)

        INSERT INTO @table(RA, NOME)
        SELECT RA, NOME FROM @#ALUNO WHERE RA = @RA

         SET @I = (SELECT COUNT(ID) FROM @#DIA)

        WHILE(@I > 0)
        BEGIN
            
           SET @N_FALTA = (SELECT F.FALTA FROM FALTAS F
                           INNER JOIN AULAS AU
                           ON F.ID_AULA = AU.ID
                           INNER JOIN ALUNO A
                           ON A.RA = F.RA_ALUNO
                           INNER JOIN DISCIPLINA D
                           ON D.CODIGO = AU.CODIGO_DISCIPLINA
                           WHERE D.CODIGO = @CODIGO_DISCIPLINA AND A.RA = @RA AND AU.[DATA] = (SELECT DIA FROM @#DIA WHERE ID = @I))

            IF(@I = 1)
            BEGIN
                UPDATE @table
                SET D1 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 2)
            BEGIN
                UPDATE @table
                SET D2 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 3)
            BEGIN
                UPDATE @table
                SET D3 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 4)
            BEGIN
                UPDATE @table
                SET D4 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 5)
            BEGIN
                UPDATE @table
                SET D5 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 6)
            BEGIN
                UPDATE @table
                SET D6 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 7)
            BEGIN
                UPDATE @table
                SET D7 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 8)
            BEGIN
                UPDATE @table
                SET D8 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 9)
            BEGIN
                UPDATE @table
                SET D9 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 10)
            BEGIN
                UPDATE @table
                SET D10 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 11)
            BEGIN
                UPDATE @table
                SET D11 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 12)
            BEGIN
                UPDATE @table
                SET D12 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 13)
            BEGIN
                UPDATE @table
                SET D13 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 14)
            BEGIN
                UPDATE @table
                SET D14 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 15)
            BEGIN
                UPDATE @table
                SET D15 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 16)
            BEGIN
                UPDATE @table
                SET D16 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 17)
            BEGIN
                UPDATE @table
                SET D17 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 18)
            BEGIN
                UPDATE @table
                SET D18 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I = 19)
            BEGIN
                UPDATE @table
                SET D19 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END

            IF(@I =20)
            BEGIN
                UPDATE @table
                SET D20 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA = @RA
            END


            SET @I = @I -1
        END
        SET @IA = @IA - 1
    END 

    RETURN

END