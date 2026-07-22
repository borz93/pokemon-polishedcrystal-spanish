BillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CAPE, 1
	warp_event  3,  7, CERULEAN_CAPE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, PokemonJournalBillScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalBillScript
	bg_event  5,  1, BGEVENT_JUMPTEXT, BillsHousePCText

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsHouseBillScript, EVENT_NEVER_MET_BILL

PokemonJournalBillScript:
	setflag ENGINE_READ_BILL_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: Bill,"
	cont "el #Maniaco!"

	para "Bill inventó el"
	line "Sistema de"
	cont "Almacenamiento"
	cont "para guardar su"
	cont "enorme colección"
	cont "#mon."

	para "Al parecer, el"
	line "primero que"
	cont "atrapó fue un"
	cont "Abra."
	done

BillsHousePCText:
	text "Hay un modelo 3D"
	line "de Porygon"
	cont "girando."
	done

BillsHouseBillScript:
	checkevent EVENT_BEAT_POKEMANIAC_BILL
	iftrue_jumptextfaceplayer .AfterText
	special SpecialBeastsCheck
	iffalse_jumptextfaceplayer .IntroText
	faceplayer
	opentext
	writetext .IntroText
	waitbutton
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer BILL_T, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEMANIAC_BILL
	jumpthistext

.AfterText:
	text "¡Menudo combate"
	line "tan guay!"

	para "Cualquier"
	line "#Maniaco se"
	cont "emocionaría al"
	cont "ver lo que has"
	cont "atrapado."
	done

.IntroText:
	text "Bill: Eevee es"
	line "un #mon"
	cont "fascinante."

	para "Dicen que las tres"
	line "bestias"

	para "legendarias de"
	line "Johto fueron antes"

	para "tres #mon que"
	line "evolucionan de"
	cont "Eevee."

	para "Pero puede que"
	line "solo sea un rumor."

	para "Aun así, me"
	line "encantaría verlas…"
	done

.SeenText:
	text "¿Atrapaste las"
	line "tres bestias"
	cont "legendarias?"

	para "¡Qué pasada,"
	line "<PLAYER>!"

	para "¿Crees que"
	line "estaban antes"
	cont "relacionadas con"
	cont "Eevee?"

	para "Vaya, ahora tengo"
	line "que enseñarte"
	cont "mi equipo!"

	para "Puedes comparar"
	line "las tres leyendas"

	para "que combatiste con"
	line "mis #mon!"
	done

.BeatenText:
	text "¡Yija!"
	done
