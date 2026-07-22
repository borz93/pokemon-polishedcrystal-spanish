BluesHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2
	warp_event  7,  0, BLUES_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_UP, RedsHouse1FTVScript

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1

DaisyScript:
	readvar VAR_HOUR
	ifequalfwd 15, .Massage
	checkflag ENGINE_TEA_IN_BLUES_HOUSE
	iftrue .After
	jumpthistextfaceplayer

	text "Daisy: ¡Hola! Mi"
	line "hermanito es el"

	para "Líder de Gimnasio"
	line "de Ciudad Verde."

	para "Pero sale de la"
	line "ciudad tan a"
	cont "menudo que causa"

	para "problemas a los"
	line "entrenadores."
	done

.Massage:
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalsefwd .NoMassage
	writetext .QuestionText
	waitbutton
	special Special_DaisyMassage
	ifequalfwd 0, .NoMassage
	ifequal 1, .EggMassage
	setflag ENGINE_TEA_IN_BLUES_HOUSE
	writetext .OkayText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestoreMusic
	opentext
	writetext .LooksContentText
	special PlayCurMonCry
	promptbutton
	jumpthisopenedtext

	text "Daisy: ¡Ya está!"
	line "Listo."

	para "¿Ves? ¿A que se"
	line "ve bien?"

	para "Es un #mon muy"
	line "mono."
	done

.IntroText:
	text "Daisy: ¡Hola! Qué"
	line "bien. Voy a tomar"
	cont "un té."

	para "¿Quieres unirte?"

	para "Ah, tus #mon"
	line "están un poco"
	cont "sucios."

	para "¿Quieres que"
	line "arregle a uno?"
	done

.After:
	jumpthistextfaceplayer

	text "Daisy: Siempre"
	line "tomo té a esta"

	para "hora. Ven a"
	line "acompañarme."
	done

.NoMassage:
	jumpthistext

	text "Daisy: ¿No"
	line "quieres que"
	cont "arregle a"
	cont "ninguno?"

	para "Vale, solo"
	line "tomamos té."
	done

.QuestionText:
	text "Daisy: ¿A cuál"
	line "arreglo?"
	done

.OkayText:
	text "Daisy: Vale, lo"
	line "dejaré perfecto"
	cont "enseguida."
	done

.LooksContentText:
	text_ram wStringBuffer3
	text " se ve"
	line "feliz."
	done

.EggMassage:
	jumpthistext

	text "Daisy: Ay, perdón."
	line "No puedo arreglar"
	cont "un Huevo."
	done
