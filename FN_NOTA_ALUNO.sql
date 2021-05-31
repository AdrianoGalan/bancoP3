CREATE FUNCTION FN_NOTA_ALUNO(@CODIGO_DISCIPLINA INT,@TIPO_PROVA CHAR(2), @RA INT)
RETURNS @table TABLE (
NOTA          DECIMAL(4,2)
)
AS
BEGIN
   
    INSERT INTO @table(NOTA)
	SELECT N.NOTA FROM NOTAS N
    INNER JOIN AVALIACAO AV
    ON AV.CODIGO = N.CODIGO_AVALIACAO
    INNER JOIN ALUNO A
    ON A.RA = N.RA_ALUNO
    INNER JOIN DISCIPLINA D
    ON D.CODIGO = N.CODIGO_DISCIPLINA
    WHERE D.CODIGO = @CODIGO_DISCIPLINA AND AV.TIPO = @TIPO_PROVA  AND A.RA =  @RA

    RETURN

END