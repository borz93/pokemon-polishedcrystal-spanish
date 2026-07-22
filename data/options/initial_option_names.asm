InitialOptionNames:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .Affection
	dw .RTC
	dw .PerfectStats
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	assert_table_length NUM_INITIAL_MENU_OPTIONS

.Natures:
	db "Naturalezas@"
.Abilities:
	db "Habilidades@"
.PSS:
	db "Div. Fís./Esp.@"
.EVs:
	db "Ganancia EV@"
.Experience:
	db "Ganancia exp.@"
.Affection:
	db "Bonus cariño@"
.RTC:
	db "Reloj real@"
.PerfectStats:
	db "Estadí. perfectas@"
.TradedMon:
	db "Intercambiados@"
.EvolveInBattle:
	db "Evol. en batalla@"
.ColorVariation:
	db "Var. de color@"
