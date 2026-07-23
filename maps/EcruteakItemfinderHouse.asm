EcruteakItemfinderHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1

EcruteakItemfinderGuy:
	checkevent EVENT_GOT_ITEMFINDER
	iftrue_jumptextfaceplayer ItemfinderExplanationText
	faceplayer
	opentext
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse_jumpopenedtext EcruteakItemfinderToEachHisOwnText
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegivekeyitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
	jumpthisopenedtext

ItemfinderExplanationText:
	text "Hay muchos"
	line "objetos por ahí"

	para "que no son"
	line "obvios."

	para "Usa el Buscatesoro"
	line "para ver si hay"

	para "un objeto en el"
	line "suelo cerca de"
	cont "ti."

	para "No muestra el"
	line "punto exacto,"

	para "así que tendrás"
	line "que buscar tú"
	cont "mismo."

	para "¡Ah sí! Oí que hay"
	line "objetos en la"

	para "Torre Quemada de"
	line "Ciudad Iris."
	done

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iffalse_endtext
	writetext EcruteakTwoTowersText
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "Ciudad Iris"
	line "también fue hogar"

	para "de tres #mon"
	line "que corrían por"
	cont "la ciudad."

	para "Se decía que"
	line "nacieron del"

	para "agua, el rayo y"
	line "el fuego."

	para "Pero no podían"
	line "contener su"
	cont "poder excesivo."

	para "Así que dicen que"
	line "los tres corrieron"

	para "como el viento"
	line "hacia la pradera."
	done

EcruteakItemfinderAdventureText:
	text "Ah. ¿Estás de"
	line "aventura con tu"
	cont "#mon?"

	para "¿Qué es una"
	line "aventura sin"
	cont "buscar tesoros?"

	para "¿A que sí, o a"
	line "que sí?"
	done

EcruteakItemfinderTrueSpiritText:
	text "¡Bien! Entiendes"
	line "el verdadero"

	para "espíritu de la"
	line "aventura."

	para "¡Me gusta eso!"
	line "Toma esto."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Ah… Cada cual a"
	line "lo suyo, supongo…"
	done

EcruteakHistoryBookText:
	text "Historia de"
	line "Ciudad Iris"

	para "¿Quieres leerla?"
	done

EcruteakTwoTowersText:
	text "En Ciudad Iris"
	line "había dos torres."

	para "Cada torre era"
	line "hogar de #mon"
	cont "voladores"
	cont "poderosos."

	para "Pero una de las"
	line "torres se quemó"
	cont "por completo."

	para "Los dos #mon no"
	line "se han visto"
	cont "desde entonces…"

	para "¿Sigues leyendo?"
	done
