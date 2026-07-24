CianwoodPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CIANWOOD_CITY, 3
	warp_event  6,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalChuckScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  6,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  1,  5, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FLassText, -1
	object_event  9,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FSuperNerdText, -1
	object_event 11,  5, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FRichBoyText, -1

PokemonJournalChuckScript:
	setflag ENGINE_READ_CHUCK_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Líder Aníbal!"

	para "Dicen que a Aníbal"
	line "le encantan los"
	cont "postres dulces."

	para "Pero también lo"
	line "han visto"

	para "entrenando bajo"
	line "una gran cascada"
	cont "para quemarlos."
	done

CianwoodGymGuyScript:
	checkevent EVENT_GOT_HM04_STRENGTH
	iffalsefwd .no_strength
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer .WinText
	jumptextfaceplayer .Text

.no_strength
	faceplayer
	opentext
	writetext .Text
	waitbutton
	writetext .StrengthText1
	promptbutton
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext .StrengthText2
	waitendtext

.Text:
	text "Los entrenadores"
	line "del Gimnasio"
	cont "#mon de aquí"
	cont "son unos"
	cont "machotes."

	para "Si me quedo por"
	line "aquí, podrían ir"
	cont "a por mí."

	para "Un consejo: el"
	line "Líder usa tipo"
	cont "Lucha."

	para "Así que confúndelo"
	line "con #mon"
	cont "Psíquicos."

	para "Elimina a sus"
	line "#mon antes de"
	cont "que usen su fuerza"
	cont "física."

	para "¿Y esas rocas en"
	line "medio del"
	cont "Gimnasio?"

	para "Si no las mueves"
	line "bien, no llegarás"
	cont "al Líder."

	para "Si te atascas, sal"
	line "afuera."
	done

.StrengthText1:
	text "¿No puedes mover"
	line "las rocas?"

	para "Ten, ¡usa esto y"
	line "enséñale Fuerza a"
	cont "tu #mon!"
	done

.StrengthText2:
	text "¡Buena suerte!"
	done

.WinText:
	text "¡<PLAYER>!"
	line "¡Ganaste! ¡Lo supe"
	cont "con solo mirarte!"
	done

CianwoodPokeCenter1FLassText:
	text "¿Conociste al"
	line "#Maníaco?"

	para "Siempre presume"
	line "de sus #mon"
	cont "raros."
	done

CianwoodPokeCenter1FSuperNerdText:
	text "Me encanta"
	line "presumir de los"
	cont "#mon que crié."

	para "¿A ti no?"

	para "Voy a meterme en"
	line "un montón de"
	cont "combates,"

	para "¡Y presumir de mis"
	line "#mon!"
	done

CianwoodPokeCenter1FRichBoyText:
	text "No hay Tienda #"
	line "aquí en el"
	cont "pueblo,"

	para "así que"
	line "importamos"
	cont "productos de"
	cont "allende el mar."
	done
