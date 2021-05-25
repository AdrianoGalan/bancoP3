
CREATE PROCEDURE sp_gerar_aulas
AS

DELETE FROM Aulas

DECLARE @cta AS INT,
		@dt_aula AS DATE,
		@horario AS CHAR(13),
		@codigo_disciplina AS INT,
		@ct AS INT

		SET @cta = 0
		SET @ct = 0

	WHILE (@ct < 2)
	BEGIN
		IF (@ct = 0)
		BEGIN
			SET @codigo_disciplina = 4203010
		END
		ELSE
		BEGIN
			SET @codigo_disciplina = 4203020
		END

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
		SET @ct = @ct + 1
		SET @cta = 0
	END

	SET @ct = 0
	SET @cta = 0

	WHILE (@ct < 2)
	BEGIN

		IF (@ct = 0)
		BEGIN
			SET @codigo_disciplina = 4213003
		END
		ELSE
		BEGIN
			SET @codigo_disciplina = 4213013
		END

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
		SET @ct = @ct + 1
		SET @cta = 0
	END

	SET @ct = 0
	SET @cta = 0

	WHILE (@ct < 2)
	BEGIN

		IF (@ct = 0)
		BEGIN
			SET @codigo_disciplina = 4226004
		END
		ELSE
		BEGIN
			SET @codigo_disciplina = 4233005
		END
		
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
		SET @ct = @ct + 1
		SET @cta = 0
	END

	SET @codigo_disciplina = 4208010
	SET @cta = 0
	
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

	SET @codigo_disciplina = 5005220
	SET @cta = 0

	IF (@codigo_disciplina = 5005220)
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

-- Testando a procedure
-- Codigos das disciplinas: 4203010, 4203020, 4208010, 4213003, 4213013, 4226004, 4233005, 5005220

EXEC sp_gerar_aulas
select * from aulas