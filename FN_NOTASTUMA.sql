CREATE FUNCTION FN_NOTASTUMA(@CODIGO_DISCIPLINA INT)
RETURNS @table TABLE (
ID              INT IDENTITY,
RA_ALUNO		INT,
NOME_ALUNO		VARCHAR(MAX),
P1		        DECIMAL(4,2),
P2              DECIMAL(4,2),
T               DECIMAL(4,2),
P3  		    DECIMAL(4,2),
MEDIA_FINAL		DECIMAL(4,2),
NUM_FALTA       INT,
SITUACAO    	VARCHAR(100)
)
AS
BEGIN

DECLARE @RA          INT,
        @I           INT,
        @P1          DECIMAL(4,2),
        @P2          DECIMAL(4,2),
        @P3          DECIMAL(4,2),
        @pp          DECIMAL(4,2),
        @T           DECIMAL(4,2),
        @MEDIA_FINAL DECIMAL(4,2),
        @NUM_FALTAS  INT,
        @MAX_FALTA   INT

INSERT INTO @table(RA_ALUNO)
SELECT A.RA FROM NOTAS N
INNER JOIN AVALIACAO AV
ON N.CODIGO_AVALIACAO = AV.CODIGO
INNER JOIN ALUNO A
ON A.RA = N.RA_ALUNO
WHERE N.CODIGO_DISCIPLINA = @CODIGO_DISCIPLINA
GROUP BY A.RA

SET @I = (SELECT COUNT(RA_ALUNO) FROM @table )



WHILE(@I <> 0)
BEGIN

    SET @RA = (SELECT RA_ALUNO FROM @table WHERE ID = @I)

    SET @NUM_FALTAS = (SELECT SUM(F.FALTA) FROM FALTAS F
                       INNER JOIN ALUNO A 
                       ON F.RA_ALUNO = A.RA
                       INNER JOIN AULAS AU
                       ON AU.ID = F.ID_AULA
                       INNER JOIN DISCIPLINA D 
                       ON AU.CODIGO_DISCIPLINA = D.CODIGO
                       WHERE D.CODIGO = @CODIGO_DISCIPLINA AND A.RA = @RA)
   

    UPDATE @table
    SET NOME_ALUNO = (SELECT NOME FROM ALUNO WHERE RA = @RA ) 
    WHERE ID = @I

    UPDATE @table
    SET NUM_FALTA = @NUM_FALTAS
    WHERE ID = @I

    SET @P1 = (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 1 AND D.CODIGO = @CODIGO_DISCIPLINA ) 

    SET @P2 = (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 2 AND D.CODIGO = @CODIGO_DISCIPLINA ) 
    
    SET @P3 = (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 3 AND D.CODIGO = @CODIGO_DISCIPLINA ) 

    SET @T =  (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 4 AND D.CODIGO = @CODIGO_DISCIPLINA ) 

    SET @PP =  (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 5 AND D.CODIGO = @CODIGO_DISCIPLINA ) 

    IF(@P1 IS NULL)
    BEGIN
        SET @P1 = 0
    END 

    IF(@P2 IS NULL)
    BEGIN
        SET @P2 = 0
    END 

    IF(@P3 IS NULL)
    BEGIN
        SET @P3 = 0
    END 

    IF(@PP IS NULL)
    BEGIN
        SET @PP = 0
    END 

    IF(@T IS NULL)
    BEGIN
        SET @T = 0
    END 
    
    IF(@CODIGO_DISCIPLINA = 4203010 OR @CODIGO_DISCIPLINA = 4203020 OR @CODIGO_DISCIPLINA = 4208010)
    BEGIN
        SET @MEDIA_FINAL = ((@P1 * 0.3) + (@P2 * 0.5) + (@T * 0.2))
        IF(@MEDIA_FINAL < 6)
        BEGIN
            SET @MEDIA_FINAL = ((@MEDIA_FINAL * 0.5) + (@P3 * 0.5))
        END
    END

    IF(@CODIGO_DISCIPLINA = 4213003 OR @CODIGO_DISCIPLINA = 4213013)
    BEGIN
       
        SET @MEDIA_FINAL = ((@P1 * 0.35) + (@P2 * 0.35) + (@T * 0.3))

        IF(@MEDIA_FINAL < 6 AND @MEDIA_FINAL >= 3)
        BEGIN
            SET @MEDIA_FINAL = (@MEDIA_FINAL + (@PP * 0.3))
        END

        IF(@MEDIA_FINAL < 6)
        BEGIN
            SET @MEDIA_FINAL = ((@MEDIA_FINAL * 0.5) + (@P3 * 0.5))
        END
    END

    IF(@CODIGO_DISCIPLINA = 4233005)
    BEGIN
       
        SET @MEDIA_FINAL = ((@P1 * 0.33) + (@P2 * 0.33) + (@T * 0.33))

        IF(@MEDIA_FINAL < 6)
        BEGIN
            SET @MEDIA_FINAL = ((@MEDIA_FINAL * 0.5) + (@P3 * 0.5))
        END
    END

    IF(@CODIGO_DISCIPLINA = 5005220)
    BEGIN
       
        SET @MEDIA_FINAL = ((@P1 * 0.8) + (@P2 * 0.2))

        IF(@MEDIA_FINAL < 6)
        BEGIN
            SET @MEDIA_FINAL = ((@MEDIA_FINAL * 0.5) + (@P3 * 0.5))
        END
    END
  

  SET @MAX_FALTA = (SELECT NUM_AULAS FROM DISCIPLINA  WHERE CODIGO = @CODIGO_DISCIPLINA) 
  SET @MAX_FALTA = @MAX_FALTA * 0.25

    IF(@NUM_FALTAS > @MAX_FALTA)
    BEGIN
        UPDATE @table
        SET SITUACAO = 'REPROVADO FALTA'
        WHERE ID = @I

    END
    ELSE
    BEGIN
        IF(@MEDIA_FINAL < 6)
        BEGIN
            UPDATE @table
            SET SITUACAO = 'REPROVADO'
            WHERE ID = @I
        END
        ELSE
        BEGIN
            UPDATE @table
            SET SITUACAO = 'APROVADO'
            WHERE ID = @I
        END
    END
    UPDATE @table
    SET P1 = @P1
    WHERE ID = @I
    UPDATE @table
    SET P2 = @P2
    WHERE ID = @I
    UPDATE @table
    SET T = @T
    WHERE ID = @I
    UPDATE @table
    SET P3 = @P3 
    WHERE ID = @I
    UPDATE @table
    SET MEDIA_FINAL = @MEDIA_FINAL 
    WHERE ID = @I
    SET @I = @I -1
   
END 
	RETURN
END
