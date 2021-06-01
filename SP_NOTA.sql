USE SIGA
GO

CREATE  PROCEDURE SP_NOTA(@RA INT, @CODIGO_AVALIACAO INT, @CODIGO_DISCIPLINA VARCHAR(10),
	 @saida DECIMAL(4,2) OUTPUT)
AS
	
    SET @SAIDA = (SELECT NOTA FROM NOTAS N
                  INNER JOIN ALUNO A
                  ON A.RA = N.RA_ALUNO
                  INNER JOIN AVALIACAO AV
                  ON AV.CODIGO = N.CODIGO_AVALIACAO
                  INNER JOIN DISCIPLINA D
                  ON D.CODIGO = N.CODIGO_DISCIPLINA
                  WHERE A.RA = @RA AND AV.CODIGO = @CODIGO_AVALIACAO AND D.CODIGO = @CODIGO_DISCIPLINA )
                  