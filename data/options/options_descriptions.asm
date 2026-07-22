OptionsDescriptions:
	table_width 2
	dw .TextSpeed
	dw .TextAutoscroll
	dw .Frame
	dw .Typeface
	dw .Keyboard
	dw .Sound
	dw .BattleEffects
	dw .BattleStyle
	dw .Nicknames
	dw .RunningShoes
	dw .TurningSpeed
	dw .ClockFormat
	dw .PokedexUnits
	assert_table_length NUM_OPTIONS

.TextSpeed:
	text "Lo rápido que"
	line "aparece el texto."
	prompt

.TextAutoscroll:
	text "Avanza el texto"
	line "solo con mantener"
	cont "pulsado un botón."
	prompt

.Frame:
	text "El marco de casi"
	line "todos los cuadros"
	cont "de texto."
	prompt

.Typeface:
	text "La fuente usada"
	line "para el texto"
	cont "normal."
	prompt

.Keyboard:
	text "La distribución"
	line "del teclado para"
	cont "nombres y correo."
	prompt

.Sound:
	text "Salida de audio:"
	line "mono (un canal)"

	para "o estéreo (dos,"
	line "izq. y derecha)."
	prompt

.BattleEffects:
	text "Animaciones de"
	line "movs. y estados."
	prompt

.BattleStyle:
	text "Al debilitar a"
	line "un rival:"

	para "Fijo: manda al"
	line "siguiente rival."

	para "Cambio: puedes"
	line "cambiar antes."

	para "Predicción: dice"
	line "el próximo rival."
	prompt

.Nicknames:
	text "Si se ponen"
	line "motes a #mon"
	cont "nuevos."
	prompt

.RunningShoes:
	text "Mantén B para"
	line "correr si las"
	cont "Zapatillas están"
	cont "Desactivadas,"

	para "o para andar si"
	line "están Activadas."
	prompt

.TurningSpeed:
	text "Lo rápido que"
	line "cambias de"
	cont "dirección al"
	cont "andar por el mapa."
	prompt

.ClockFormat:
	text "El formato del"
	line "reloj:"
	cont "12h tiene AM/PM."
	prompt

.PokedexUnits:
	text "Unidades de"
	line "altura y peso de"
	cont "la #dex:"

	para "Imperial: pies,"
	line "pulgadas y libras."

	para "Métrico: metros"
	line "y kilogramos."
	prompt

OptionsDoneDescription:
	text "Guardar opciones y"
	line "salir del menú."
	prompt
