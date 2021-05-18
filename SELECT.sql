CREATE FUNCTION FN_NOTASTUMA(@CODIGO_DISCIPLINA VARCHAR(10))
RETURNS @table TABLE (
ID              INT IDENTITY,
RA_ALUNO		INT,
NOME_ALUNO		VARCHAR(MAX),
P1		        DECIMAL(4,2),
P2              DECIMAL(4,2),
T               DECIMAL(4,2),
P3  		    DECIMAL(4,2),
MEDIA_FINAL		DECIMAL(4,2),
SITUACAO    	VARCHAR(100)
)
AS
BEGIN

DECLARE @RA          INT,
        @I           INT,
        @P1          DECIMAL(4,2),
        @P2          DECIMAL(4,2),
        @P3          DECIMAL(4,2),
        @T           DECIMAL(4,2),
        @MEDIA_FINAL DECIMAL(4,2)

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
   

    UPDATE @table
    SET NOME_ALUNO = (SELECT NOME FROM ALUNO WHERE RA = @RA ) 
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
    
    SET @T = (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 4 AND D.CODIGO = @CODIGO_DISCIPLINA ) 

    SET @P3 =  (SELECT NOTA FROM NOTAS N
                INNER JOIN ALUNO A
                ON A.RA = N.RA_ALUNO
                INNER JOIN AVALIACAO AV
                ON AV.CODIGO = N.CODIGO_AVALIACAO
                INNER JOIN DISCIPLINA D
                ON D.CODIGO = N.CODIGO_DISCIPLINA
                WHERE A.RA = @RA AND AV.CODIGO = 3 AND D.CODIGO = @CODIGO_DISCIPLINA ) 

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

    IF(@T IS NULL)
    BEGIN
        SET @T = 0
    END 
    
    IF(@CODIGO_DISCIPLINA = '4203-010' OR @CODIGO_DISCIPLINA = '4203-020' OR @CODIGO_DISCIPLINA = '4208-010')
    BEGIN
        SET @MEDIA_FINAL = ((@P1 * 0.3) + (@P2 * 0.5) + (@T * 0.2))
        IF(@MEDIA_FINAL < 6)
        BEGIN
            SET @MEDIA_FINAL = ((@MEDIA_FINAL * 0.5) + (@P3 * 0.5))
        END
    END

      IF(@CODIGO_DISCIPLINA = '4213-003' OR @CODIGO_DISCIPLINA = '4213-013')
    BEGIN
        SET @MEDIA_FINAL = ((@P1 * 0.35) + (@P2 * 0.35) + (@T * 0.3))
        IF(@MEDIA_FINAL < 6 AND @MEDIA_FINAL >= 3)
        BEGIN
            SET @MEDIA_FINAL = ((@MEDIA_FINAL * 0.5) + (@P3 * 0.5))
        END
    END


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
--(RA_Aluno, Nome_Aluno, Nota1, Nota2, ..., Média_Final, Situação(Aprovado ou
--Reprovado))
