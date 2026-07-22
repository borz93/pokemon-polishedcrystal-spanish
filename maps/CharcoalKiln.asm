CharcoalKiln_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 2
	warp_event  4,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  9,  1, BGEVENT_JUMPTEXT, CharcoalKilnBucketText

	def_object_events
	object_event  1,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  4,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  8,  6, SPRITE_FARFETCH_D, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchdScript, EVENT_CHARCOAL_KILN_FARFETCH_D

CharcoalKilnBoss:
	checkevent EVENT_GOT_HM01_CUT
	iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Todos los"
	line "Slowpoke han"
	cont "desaparecido del"
	cont "pueblo."

	para "El protector del"
	line "bosque debe estar"
	cont "enfadado con"
	cont "nosotros…"

	para "Puede ser un mal"
	line "augurio."
	cont "Deberíamos"
	cont "quedarnos dentro."
	done

.Text2:
	text "Los Slowpoke han"
	line "vuelto…"

	para "Pero mi aprendiz"
	line "no ha vuelto del"
	cont "Encinar."

	para "¿Dónde estará ese"
	line "vago?"
	done

.Text3:
	text "¿Ahuyentaste al"
	line "Team Rocket y"
	cont "fuiste solo al"
	cont "Encinar?"

	para "¡Eso tiene"
	line "agallas! Me gusta."
	cont "Ven a entrenar"
	cont "con nosotros."
	done

CharcoalKilnApprentice:
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_GOT_HM01_CUT
	iffalse_jumptextfaceplayer .Text1
	faceplayer
	opentext
	writetext .Text2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse_endtext
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	endtext

.Text1:
	text "¿A dónde se"
	line "fueron todos los"
	cont "Slowpoke?"

	para "¿Estarán jugando"
	line "por ahí?"
	done

.Text2:
	text "Perdona, olvidé"
	line "darte las gracias."

	para "Este es el Carbón"
	line "que hice."

	para "A los #mon de"
	line "tipo Fuego les"
	cont "encantará"
	cont "sujetarlo."
	done

.Text3:
	text "Los Slowpoke"
	line "volvieron, y hasta"
	cont "encontraste a"
	cont "Farfetch'd."

	para "¡Eres el más"
	line "genial, tío!"
	done

CharcoalKilnFarfetchdScript:
	faceplayer
	showcrytext .Text, FARFETCH_D
	end

.Text:
	text "Farfetch'd: Kwaa!"
	done

CharcoalKilnBucketText:
	text "Es un cubo."
	done
