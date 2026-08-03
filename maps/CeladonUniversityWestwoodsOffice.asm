CeladonUniversityWestwoodsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_UNIVERSITY_2F, 5
	warp_event  4,  5, CELADON_UNIVERSITY_2F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeSignpost1Text
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeSignpost2Text
	bg_event  4,  1, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeBookshelfText
	bg_event  5,  1, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeBookshelfText

	def_object_events
	object_event  4,  3, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityWestwoodsOfficeChildScript, -1
	object_event  1,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityWestwoodsOfficeBookText, -1

CeladonUniversityWestwoodsOfficeChildScript:
	checkevent EVENT_GOT_RAGECANDYBAR_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem RAGECANDYBAR
	iffalse_endtext
	setevent EVENT_GOT_RAGECANDYBAR_IN_UNIVERSITY
	jumpthisopenedtext

.Text2:
	text "Me compraré"
	line "ramen en la"
	cont "cafetería."
	done

.Text1:
	text "¡Me dijeron que"
	line "habría pizza"
	cont "gratis aquí!"

	para "¿Dónde está?"

	para "¡ESTOY FURIOSO!"

	para "…Quizá debería"
	line "dejar de picar"
	cont "Pastel Furia."

	para "Puedes quedarte"
	line "con este."
	done

CeladonUniversityWestwoodsOfficeBookText:
	text "Querido diario:"

	para "mi trabajo"
	line "recopilando"
	cont "entradas para la"
	cont "#dex"

	para "sigue siendo"
	line "bien recibido."

	para "¡Prueba de que no"
	line "siempre hay que"
	cont "salir de la"
	cont "oficina para"
	cont "triunfar!"

	para "Usar los informes"
	line "que envían otros"

	para "también funciona"
	line "bien."
	done

CeladonUniversityWestwoodsOfficeSignpost1Text:
	text "Es un retrato de"
	line "Westwood I."
	done

CeladonUniversityWestwoodsOfficeSignpost2Text:
	text "Es un retrato de"
	line "Westwood III."
	done

CeladonUniversityWestwoodsOfficeBookshelfText:
	text "Las Obras"
	line "Completas del"
	cont "Prof. Westwood."

	para "…Mejor me lo"
	line "salto."
	done
