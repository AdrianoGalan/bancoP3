use SIGA

CREATE FUNCTION FN_FALTAS (@CODIGO_DISCIPLINA INT)
RETURNS @TABLE TABLE (
RA_ALUNO INT,
NOME_ALUNO VARCHAR(MAX),
DATA1 DATE,
DATA2 DATE,
DATA3 DATE,
DATA4 DATE,
DATA5 DATE,
DATA6 DATE,
DATA7 DATE,
DATA8 DATE,
DATA9 DATE,
DATA10 DATE,
DATA11 DATE, 
DATA12 DATE, 
DATA13 DATE, 
DATA14 DATE,
DATA15 DATE, 
DATA16 DATE, 
DATA17 DATE, 
DATA18 DATE, 
DATA19 DATE, 
DATA20 DATE,
FALTA1 CHAR(4),
FALTA2 CHAR(4),
FALTA3 CHAR(4),
FALTA4 CHAR(4),
FALTA5 CHAR(4),
FALTA6 CHAR(4),
FALTA7 CHAR(4),
FALTA8 CHAR(4),
FALTA9 CHAR(4),
FALTA10 CHAR(4),
FALTA11 CHAR(4),
FALTA12 CHAR(4),
FALTA13 CHAR(4),
FALTA14 CHAR(4),
FALTA15 CHAR(4),
FALTA16 CHAR(4),
FALTA17 CHAR(4),
FALTA18 CHAR(4),
FALTA19 CHAR(4),
FALTA20 CHAR(4)--,
--TOTAL_FALTAS INT
)
AS
BEGIN
DECLARE @id	INT,
		@nome VARCHAR(MAX),
		@data DATE,
		@data1 DATE,
		@data2 DATE,
		@data3 DATE,
		@data4 DATE,
		@data5 DATE,
		@data6 DATE,
		@data7 DATE,
		@data8 DATE,
		@data9 DATE,
		@data10 DATE,
		@data11 DATE,
		@data12 DATE,
		@data13 DATE,
		@data14 DATE,
		@data15 DATE,
		@data16 DATE,
		@data17 DATE,
		@data18 DATE,
		@data19 DATE,
		@data20 DATE,
		@falta INT,			
		@total_faltas INT,
		@cta INT

		SET @cta = 0

	INSERT INTO @TABLE (RA_ALUNO, NOME_ALUNO)
	SELECT M.RA_ALUNO, A.NOME
	FROM MATRICULA M INNER JOIN ALUNO A
	ON A.RA = M.RA_ALUNO
	WHERE M.CODIGO_DISCIPLINA = @CODIGO_DISCIPLINA

	DECLARE c CURSOR FOR SELECT ID FROM AULAS WHERE CODIGO_DISCIPLINA = @CODIGO_DISCIPLINA

	OPEN c

	FETCH NEXT FROM c INTO @id

	WHILE @@FETCH_STATUS = 0
	BEGIN
	
	IF (@cta = 0)
	BEGIN
		UPDATE @TABLE
		SET DATA1 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 1)
	BEGIN
		UPDATE @TABLE
		SET DATA2 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 2)
	BEGIN
		UPDATE @TABLE
		SET DATA3 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 3)
	BEGIN
		UPDATE @TABLE
		SET DATA4 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 4)
	BEGIN
		UPDATE @TABLE
		SET DATA5 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 5)
	BEGIN
		UPDATE @TABLE
		SET DATA6 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 6)
	BEGIN
		UPDATE @TABLE
		SET DATA7 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 7)
	BEGIN
		UPDATE @TABLE
		SET DATA8 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 8)
	BEGIN
		UPDATE @TABLE
		SET DATA9 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 9)
	BEGIN
		UPDATE @TABLE
		SET DATA10 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 10)
	BEGIN
		UPDATE @TABLE
		SET DATA11 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 11)
	BEGIN
		UPDATE @TABLE
		SET DATA12 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 12)
	BEGIN
		UPDATE @TABLE
		SET DATA13 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 13)
	BEGIN
		UPDATE @TABLE
		SET DATA14 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 14)
	BEGIN
		UPDATE @TABLE
		SET DATA15 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 15)
	BEGIN
		UPDATE @TABLE
		SET DATA16 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 16)
	BEGIN
		UPDATE @TABLE
		SET DATA17 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 17)
	BEGIN
		UPDATE @TABLE
		SET DATA18 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 18)
	BEGIN
		UPDATE @TABLE
		SET DATA19 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END

	IF (@cta = 19)
	BEGIN
		UPDATE @TABLE
		SET DATA20 = 
		(SELECT DATA FROM AULAS WHERE ID = @id)
	END
		
		FETCH NEXT FROM c INTO @id
		SET @cta = @cta + 1
	END

	CLOSE c
	DEALLOCATE c

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

--        INSERT INTO @table(RA, NOME)
 --       SELECT RA, NOME FROM @#ALUNO WHERE RA = @RA

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
                SET FALTA1 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 2)
            BEGIN
                UPDATE @table
                SET FALTA2 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 3)
            BEGIN
                UPDATE @table
                SET FALTA3 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 4)
            BEGIN
                UPDATE @table
                SET FALTA4 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 5)
            BEGIN
                UPDATE @table
                SET FALTA5 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 6)
            BEGIN
                UPDATE @table
                SET FALTA6 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 7)
            BEGIN
                UPDATE @table
                SET FALTA7 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 8)
            BEGIN
                UPDATE @table
                SET FALTA8 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 9)
            BEGIN
                UPDATE @table
                SET FALTA9 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 10)
            BEGIN
                UPDATE @table
                SET FALTA10 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 11)
            BEGIN
                UPDATE @table
                SET FALTA11 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 12)
            BEGIN
                UPDATE @table
                SET FALTA12 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 13)
            BEGIN
                UPDATE @table
                SET FALTA13 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 14)
            BEGIN
                UPDATE @table
                SET FALTA14 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 15)
            BEGIN
                UPDATE @table
                SET FALTA15 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 16)
            BEGIN
                UPDATE @table
                SET FALTA16 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 17)
            BEGIN
                UPDATE @table
                SET FALTA17 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 18)
            BEGIN
                UPDATE @table
                SET FALTA18 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I = 19)
            BEGIN
                UPDATE @table
                SET FALTA19 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END

            IF(@I =20)
            BEGIN
                UPDATE @table
                SET FALTA20 = (SELECT D1 FROM FN_RELATORIO_RETORNA_CHAR(@N_FALTA))
                WHERE RA_ALUNO = @RA
            END


            SET @I = @I -1
        END
        SET @IA = @IA - 1
    END

	RETURN
END

select * from FN_FALTAS (4203020)
select * from AULAS
select * from FALTAS
select * from MATRICULA