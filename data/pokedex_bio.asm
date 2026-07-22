HatchSpeedNames:
; entries correspond to HATCH_* (see constants/pokemon_data_constants.asm)
; "step cycles to hatch" are stored in one nybble, and
; only 0-7 are used for hatchable mons (legendaries use 15)
	table_width 1
	dr Fastest
	dr Faster
	dr Fast
	dr MediumFast
	dr MediumSlow
	dr Slow
	dr Slower
	dr Slowest
	assert_table_length NUM_HATCH_RATES

GrowthRateNames:
; entries correspond to GROWTH_* (see constants/pokemon_data_constants.asm)
	table_width 1
	dr MediumFast
	dr MediumSlow
	dr Fast
	dr Slow
	assert_table_length NUM_GROWTH_RATES

Fastest:    db "Rapidísimo@"
Faster:     db "Más rápido@"
Fast:       db "Rápido@"
MediumFast: db "Medio rápido@"
MediumSlow: db "Medio lento@"
Slow:       db "Lento@"
Slower:     db "Más lento@"
Slowest:    db "Lentísimo@"
Unknown:    db "Desconocido@"

BodyColorNames:
; entries correspond to colors (see constants/pokemon_data_constants.asm)
	table_width 1
	dr BodyRed
	dr BodyBlue
	dr BodyYellow
	dr BodyGreen
	dr BodyBlack
	dr BodyBrown
	dr BodyPurple
	dr BodyGray
	dr BodyWhite
	dr BodyPink
	assert_table_length NUM_BODY_COLORS

BodyRed:    db "Rojo@"
BodyBlue:   db "Azul@"
BodyYellow: db "Amarillo@"
BodyGreen:  db "Verde@"
BodyBlack:  db "Negro@"
BodyBrown:  db "Marrón@"
BodyPurple: db "Morado@"
BodyGray:   db "Gris@"
BodyWhite:  db "Blanco@"
BodyPink:   db "Rosa@"
