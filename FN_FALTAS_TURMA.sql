CREATE FUNCTION FN_FALTASTURMA (@CODIGO_DISCIPLINA INT)
RETURNS @TABLE TABLE (
RA_ALUNO INT,
NOME_ALUNO VARCHAR(MAX),
DATAS DATE,
FALTAS INT,
TOTAL_FALTAS INT
)
AS
BEGIN
DECLARE @ra	INT,
		@nome VARCHAR(MAX),
		@data DATE,
		@falta INT,			
		@total_faltas INT

	INSERT INTO @TABLE (RA_ALUNO, NOME_ALUNO, DATAS, FALTAS)
	SELECT A.RA, A.NOME, AU.DATA, F.FALTA
	FROM ALUNO A, FALTAS F, AULAS AU
	WHERE F.RA_ALUNO = A.RA AND AU.CODIGO_DISCIPLINA = @CODIGO_DISCIPLINA AND AU.ID = F.ID_AULA

	DECLARE c CURSOR FOR SELECT RA_ALUNO, NOME_ALUNO, datas, faltas FROM @TABLE

	OPEN c

	FETCH NEXT FROM c INTO @ra, @nome, @data, @falta

	WHILE @@FETCH_STATUS = 0
	BEGIN

		UPDATE @TABLE
		SET TOTAL_FALTAS = (SELECT SUM(F.FALTA) AS TOTAL_FALTAS FROM FALTAS F WHERE F.RA_ALUNO = @ra)
		
		FETCH NEXT FROM c INTO @ra, @nome, @data, @falta
	END

	CLOSE c
	DEALLOCATE c

	RETURN
END

