CeladonUniversityPrincipalsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_UNIVERSITY_1F, 5
	warp_event  3,  7, CELADON_UNIVERSITY_1F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeSignpost1Text
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeSignpost2Text
	bg_event  5,  4, BGEVENT_RIGHT, CeladonUniversityPrincipalsOfficeComputer
	bg_event  1,  1, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeBookshelfText

	def_object_events
	object_event  2,  2, SPRITE_MATSUMOTO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityPrincipalsOfficeMatsumotoScript, -1

CeladonUniversityPrincipalsOfficeMatsumotoScript:
	checkevent EVENT_GOT_RARE_CANDY_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_GOT_RARE_CANDY_IN_UNIVERSITY
	jumpthisopenedtext

.Text2:
	text "Trabajo duro"
	line "para que todo"
	cont "funcione bien,"

	para "así que me relajo"
	line "con caramelos de"
	cont "vez en cuando."
	done

.Text1:
	text "¡Hola, joven"
	line "entrenador!"

	para "Soy el Profesor"
	line "Matsumoto."

	para "Soy el director"
	line "de la Universidad"
	cont "Azulona."

	para "Pero puedes"
	line "llamarme tu"
	cont "colega!"

	para "Toma, coge"
	line "caramelos de mi"
	cont "cajón."
	done

CeladonUniversityPrincipalsOfficeSignpost1Text:
	text "Es el título del"
	line "Prof. Matsumoto"
	cont "en Educación."
	done

CeladonUniversityPrincipalsOfficeSignpost2Text:
	text "Es una foto del"
	line "Prof. Matsumoto"

	para "frente a una"
	line "clase"
	cont "graduándose."
	done

CeladonUniversityPrincipalsOfficeComputer:
	jumpthistext

	text "Hay un borrador"
	line "de correo"
	cont "pidiendo"

	para "donaciones a los"
	line "exalumnos."
	done

CeladonUniversityPrincipalsOfficeBookshelfText:
	text "Es la colección"
	line "completa de la"

	para "Enciclopedia"
	line "#monica."
	done
