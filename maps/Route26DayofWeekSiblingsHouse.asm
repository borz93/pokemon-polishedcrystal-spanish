Route26DayofWeekSiblingsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_26, 4
	warp_event  3,  7, ROUTE_26, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	endtext

DayOfWeekSiblingsHousePokedexText1:
	text "Hay algo"
	line "escrito aquí."

	para "¿Leerlo?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Para mis"
	line "hermanos:"

	para "Nos enorgullece"
	line "servir a los"
	cont "entrenadores"
	cont "#mon."

	para "Cuando un"
	line "entrenador os"
	cont "hable, dadle"
	cont "algo útil."

	para "Con cariño,"
	line "Luna"

	para "¿Sigo leyendo?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Lunes, Luna"
	line "Ruta 40"

	para "Martes, Marta"
	line "Ruta 29"

	para "Miércoles Marcial"
	line "Lago de la Furia"

	para "Jueves, Julio"
	line "Ruta 36"

	para "Viernes, Vera"
	line "Ruta 32"

	para "Sábado, Sabas"
	line "Ciudad Endrino"

	para "Domingo, Dominga"
	line "Ruta 37"
	done
