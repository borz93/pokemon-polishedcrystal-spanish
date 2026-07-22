ItemPocketNames:
	table_width 1
	dr .Item
	dr .Medicine
	dr .Ball
	dr .TM ; impossible
	dr .Berry
	dr .Key ; impossible
	assert_table_length NUM_POCKETS

.Item:
	db "Objetos@"
.Medicine:
	db "Medicinas@"
.Ball:
	db "Poké Balls@"
.TM:
	db "MTs@"
.Berry:
	db "Bayas@"
.Key:
	db "Obj. Clave@"
