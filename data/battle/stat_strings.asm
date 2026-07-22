StatStrings:
; entries correspond to stat constants
	table_width 1
	dr .health
	dr .attack
	dr .defense
	dr .speed
	dr .sp_atk
	dr .sp_def
	assert_table_length NUM_STATS

.health:  db "PS@"
.attack:  db "Ataque@"
.defense: db "Defensa@"
.speed:   db "Velocidad@"
.sp_atk:  db "At. Esp.@"
.sp_def:  db "Def. Esp.@"
