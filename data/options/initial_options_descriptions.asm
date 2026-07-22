; These are in the same order as InitialOptions_CallOptionRoutine.Pointers,
; not the *_OPT bit order.
InitialOptionDescriptions:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .AffectionBonus
	dw .RTC
	dw .PerfectIVs
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	assert_table_length NUM_INITIAL_MENU_OPTIONS

.Natures:
	text "Las Naturalezas"
	line "suben una"
	cont "estad. y bajan"
	cont "otra un 10%."

	para "Introducidas en"
	line "la Gen. 3."
	prompt

.Abilities:
	text "Las habilidades"
	line "pueden tener"
	cont "efectos dentro"

	para "y fuera del"
	line "combate."

	para "Introducidas en"
	line "la Gen. 3."
	prompt

.PSS:
	text "Los movs. son"
	line "Físicos o Espe-"
	cont "ciales, no según"
	cont "su tipo."

	para "Introducido en"
	line "la Gen. 4."
	prompt

.EVs:
	assert MODERN_MAX_EV % 4 == 0
	text "Los EV suben"
	line STRFMT("estad. hasta %d,", MODERN_MAX_EV / 4) ; 252 / 4 == 63
	cont "1 por cada 4 EV."

	para "Puedes permitir"
	line "que cada estad."

	para "llegue a {d:MODERN_MAX_EV} EV,"
	line "como antes,"

	para "o limitarlos a"
	line "un total de {d:MODERN_EV_LIMIT}."

	para "Sustituyeron a la"
	line "exp. de estad. en"
	cont "la Gen. 3."
	prompt

.Experience:
	text "La fórmula de"
	line "experiencia vieja"

	para "(Gen. 1 a 4) no"
	line "estaba ajustada."

	para "La nueva, de la"
	line "Gen. 5, readopt."
	cont "en la Gen. 7,"

	para "da más Exp. al"
	line "vencer rivales de"
	cont "más nivel,"

	para "y menos con los"
	line "de menos nivel."

	para "La ganancia Exp."
	line "se puede desac-"
	cont "tivar como reto,"

	para "pero el Caramelo"
	line "Exp. y el Raro"
	cont "seguirán"
	cont "funcionando."
	prompt

.AffectionBonus:
	text "Tus #mon"
	line "ganan beneficios"
	cont "en combate cuando"
	cont "os tenéis"
	cont "cariño."

	para "Introducido en"
	line "la Gen. 6."
	prompt

.RTC:
	text "Usa el Reloj en"
	line "Tiempo Real para"
	cont "medir el tiempo."

	para "Si tu cartucho o"
	line "emulador no"
	cont "soporta RTC,"

	assert 24 % NO_RTC_SPEEDUP == 0
	para "desactívalo para"
	line "que cada día del"
	cont STRFMT("juego dure %dh.", 24 / NO_RTC_SPEEDUP) ; 24 / 6 == 4
	prompt

.PerfectIVs:
	text "Las estad. se"
	line "calculan como si"

	para "los IV fueran"
	line "perfectos (15),"
	cont "tanto en tus"
	cont "#mon como en"
	cont "los rivales."
	prompt

.TradedMon:
	text "Los #mon"
	line "cambiados te"
	cont "obedecen y puedes"
	cont "ponerles mote,"

	para "pero no ganan más"
	line "Exp."
	prompt

.EvolveInBattle:
	text "Tus #mon pueden"
	line "evolucionar en"
	cont "combates contra"
	cont "entrenadores."

	para "Inspirado en los"
	line "combates del"
	cont "anime."
	prompt

.ColorVariation:
	text "Cada #mon,"
	line "normal o"
	cont "variocolor, tendrá"
	cont "colores algo"
	cont "distintos."

	para "La variación es"
	line "pseudoaleatoria,"

	para "sin relación con"
	line "sus estad."

	para "Inspirado en la"
	line "variación de"
	cont "color de Stadium"
	cont "según el mote."
	prompt

InitialOptionsDoneDescription:
	text "¡Guarda tus"
	line "opciones y juega!"
	prompt
