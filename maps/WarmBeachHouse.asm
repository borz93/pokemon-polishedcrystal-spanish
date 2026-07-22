WarmBeachHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, WARM_BEACH, 3
	warp_event  3,  7, WARM_BEACH, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachHouseGrampsText, -1
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachHouseGrannyText, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachHouseBookScript, -1

WarmBeachHouseGrampsText:
	text "TODO"
	done

WarmBeachHouseGrannyText:
	text "TODO"
	done

WarmBeachHouseBookScript:
	opentext
	writetext .Text0
	yesorno
	iffalse_endtext
	writetext .Text1
	yesorno
	iffalse_endtext
	writetext .Text2
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "Del trío de"
	line "islas, esferas"
	cont "antiguas"
	cont "tomarás."

	para "Pues entre la"
	line "vida y la muerte,"
	cont "toda la"
	cont "diferencia harás."

	para "Sube al"
	line "santuario para"
	cont "enderezar lo que"
	cont "está mal,"

	para "y el mundo"
	line "sanará con la"
	cont "canción del"
	cont "guardián…"
	done

.Text0:
	text "La Profecía de"
	line "Shamouti"

	para "¿Quieres leerla?"
	done

.Text1:
	text "No perturbes la"
	line "armonía del"
	cont "fuego, hielo o"
	cont "rayo,"

	para "no sea que estos"
	line "titanes traigan"
	cont "destrucción al"
	cont "mundo donde"
	cont "combaten."

	para "Aunque el gran"
	line "guardián del agua"
	cont "surja para calmar"
	cont "la lucha,"

	para "su canto fallará,"
	line "y así la tierra"
	cont "se volverá"
	cont "ceniza."

	para "¿Sigo leyendo?"
	done

.Text2:
	text "Oh, Elegido, en"
	line "tus manos reúne"
	cont "a los tres."

	para "Sus tesoros"
	line "unidos doman"
	cont "a la bestia"
	cont "del mar."

	para "¿Sigo leyendo?"
	done
