USE SIGA
GO

CREATE FUNCTION FN_DATA_AULAS(@CODIGO_DISCIPLINA INT)
RETURNS @table TABLE (

ID                  INT,
CODIGO_DISCIPLINA   INT,
DATA                DATE,
HORARIO             CHAR(13)

)
AS
BEGIN

INSERT INTO @table(ID, CODIGO_DISCIPLINA, DATA, HORARIO)
SELECT A.ID, A.CODIGO_DISCIPLINA, A.[DATA], A.HORARIO FROM AULAS A
WHERE A.CODIGO_DISCIPLINA = @CODIGO_DISCIPLINA 
ORDER BY A.DATA

    RETURN

END