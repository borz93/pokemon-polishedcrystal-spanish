OptionNames:
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
	db "Velocidad texto@"
.TextAutoscroll:
	db "Autoavance texto@"
.Frame:
	db "Marco@"
.Typeface:
	db "Fuente@"
.Keyboard:
	db "Teclado@"
.Sound:
	db "Sonido@"
.BattleEffects:
	db "Efectos batalla@"
.BattleStyle:
	db "Estilo batalla@"
.Nicknames:
	db "Motes@"
.RunningShoes:
	db "Zapatillas@"
.TurningSpeed:
	db "Velocidad giro@"
.ClockFormat:
	db "Formato reloj@"
.PokedexUnits:
	db "Unidad #dex@"
