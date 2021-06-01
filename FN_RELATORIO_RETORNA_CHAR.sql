USE SIGA
GO

CREATE FUNCTION FN_RELATORIO_RETORNA_CHAR(@N_FALTA INT)
RETURNS @table TABLE (
D1          CHAR(4)
)
AS
BEGIN

    DECLARE @F AS CHAR(4)

   


            IF(@N_FALTA IS NULL)
            BEGIN
                INSERT @table(D1)
                SELECT 'PPPP'
            END ELSE
            BEGIN
                IF(@N_FALTA = 1)
                BEGIN
                    INSERT @table(D1)
                    SELECT 'FPPP'
                    
                END
                IF(@N_FALTA = 2)
                BEGIN
                    INSERT @table(D1)
                    SELECT 'FFPP'
                END
                IF(@N_FALTA = 3)
                BEGIN
                    INSERT @table(D1)
                    SELECT 'FFFP'
                END
                IF(@N_FALTA = 4)
                BEGIN
                   INSERT @table(D1)
                   SELECT 'FFFF'
                END
            END


     
    RETURN

END