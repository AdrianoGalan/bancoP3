CREATE PROCEDURE sp_gerar_aulas (@codigo_disciplina INT)
AS

DECLARE @cta AS INT,
		@dt_aula AS DATE,
		@horario AS CHAR(13)

		SET @cta = 0

IF ((SELECT NUM_AULAS FROM DISCIPLINA WHERE CODIGO = @codigo_disciplina) = 80)
BEGIN

	IF (@codigo_disciplina = 4203010 OR @codigo_disciplina = 4203020)
	BEGIN
		
		SET @dt_aula = '2021-07-28'

		IF (@codigo_disciplina = 4203010)
		BEGIN
			SET @horario = '14:50 - 18:20'
		END
		ELSE
		BEGIN
			SET @horario = '19:00 - 22:00'
		END

		WHILE (@cta < 20)
		BEGIN
			INSERT INTO Aulas VALUES
			(@codigo_disciplina, @dt_aula, @horario)

			SET @dt_aula = (DATEADD(DAY, 7, @dt_aula))
			SET @cta = @cta + 1
		END
	END

	IF (@codigo_disciplina = 4213003 OR @codigo_disciplina = 4213013)
	BEGIN

		SET @dt_aula = '2021-07-30'

		IF (@codigo_disciplina = 4213003)
		BEGIN
			SET @horario = '14:50 - 18:20'
		END
		ELSE
		BEGIN
			SET @horario = '19:00 - 22:00'
		END

		WHILE (@cta < 20)
		BEGIN
			INSERT INTO Aulas VALUES
			(@codigo_disciplina, @dt_aula, @horario)

			SET @dt_aula = (DATEADD(DAY, 7, @dt_aula))
			SET @cta = @cta + 1
		END
	END

	IF (@codigo_disciplina = 4226004 OR @codigo_disciplina = 4233005)
	BEGIN

		SET @dt_aula = '2021-08-02'

		IF (@codigo_disciplina = 4226004)
		BEGIN
			SET @horario = '14:50 - 18:20'
		END
		ELSE
		BEGIN
			SET @horario = '19:00 - 22:00'
		END

		WHILE (@cta < 20)
		BEGIN
			INSERT INTO Aulas VALUES
			(@codigo_disciplina, @dt_aula, @horario)

			SET @dt_aula = (DATEADD(DAY, 7, @dt_aula))
			SET @cta = @cta + 1
		END
	END
END

ELSE
BEGIN
	
	IF (@codigo_disciplina = 4208010)
	BEGIN

		SET @dt_aula = '2021-08-03'
		SET @horario = '13:00 - 14:40'

		WHILE (@cta < 20)
		BEGIN
			INSERT INTO Aulas VALUES
			(@codigo_disciplina, @dt_aula, @horario)

			SET @dt_aula = (DATEADD(DAY, 7, @dt_aula))
			SET @cta = @cta + 1
		END

	END

	ELSE
	BEGIN

		SET @dt_aula = '2021-07-29'
		SET @horario = '09:20 - 11:00'

		WHILE (@cta < 20)
		BEGIN
			INSERT INTO Aulas VALUES
			(@codigo_disciplina, @dt_aula, @horario)

			SET @dt_aula = (DATEADD(DAY, 7, @dt_aula))
			SET @cta = @cta + 1
		END

	END

END