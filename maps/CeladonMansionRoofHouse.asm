CeladonMansionRoofHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1

CeladonMansionRoofHousePharmacistScript:
	checkevent EVENT_GOT_TM03_CURSE
	iftrue_jumptextfaceplayer .CurseText
	faceplayer
	opentext
	writetext .IntroText
	promptbutton
	checktime 1 << NITE
	iffalse_jumpopenedtext .NotNiteText
	writetext .StoryText
	promptbutton
	verbosegivetmhm TM_CURSE
	setevent EVENT_GOT_TM03_CURSE
	jumpthisopenedtext

.CurseText:
	text "La MT03 es"
	line "Maldición."

	para "Es un movimiento"
	line "aterrador que va"

	para "reduciendo poco a"
	line "poco los PS de la"
	cont "víctima."
	done

.IntroText:
	text "Deja que te"
	line "cuente una"
	cont "historia de"
	cont "terror…"
	done

.NotNiteText:
	text "Aunque, no da"
	line "tanto miedo"
	cont "mientras aún hay"
	cont "luz fuera."

	para "Vuelve después"
	line "del atardecer,"
	cont "¿vale?"
	done

.StoryText:
	text "Érase una vez,"
	line "un niño al que"

	para "regalaron una"
	line "Bici nueva…"

	para "Quiso probarla"
	line "enseguida…"

	para "Se lo pasaba tan"
	line "bien que no notó"

	para "que el sol se"
	line "había puesto…"

	para "Mientras volvía a"
	line "casa en la noche"

	para "más oscura, ¡la"
	line "bici de repente"
	cont "frenó!"

	para "¡Los pedales se"
	line "volvieron"
	cont "pesados!"

	para "Cuando dejó de"
	line "pedalear, ¡la bici"
	cont "empezó a resbalar"
	cont "hacia atrás!"

	para "¡Era como si la"
	line "bici estuviera"
	cont "maldita y quisiera"
	cont "arrastrarlo al"
	cont "olvido!"

	para "…"

	para "…"

	para "¡¡¡CHILLIDO!!!"

	para "¡El niño estaba"
	line "subiendo cuesta"
	cont "arriba por el"
	cont "Ciclocamino!"

	para "…"
	line "¡Bum-bum,"
	cont "bum-bum!"

	para "Por escuchar con"
	line "tanta paciencia,"
	cont "toma esto: ¡la"
	cont "MT03!"
	done
