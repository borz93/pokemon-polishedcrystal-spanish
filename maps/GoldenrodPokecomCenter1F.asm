GoldenrodPokecomCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, JudgeMachineScreenCallback

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  1,  6, GOLDENROD_POKECOM_CENTER_OFFICE, 2
	warp_event  0, 15, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, PokemonJournalWhitneyScript
	bg_event 24,  5, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  6, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  7, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  8, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  9, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24, 10, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 25, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 26, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 27, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 28, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 29,  5, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  6, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  7, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  8, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  9, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29, 10, BGEVENT_LEFT, JudgeMachineScript
	bg_event 24,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_GOLDENROD_POKECOM_CENTER_1F_HIDDEN_RARE_CANDY

	def_object_events
	object_event 23, 10, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, JudgeMachineEngineerScript, EVENT_JUDGE_MACHINE_ENGINEER
	object_event  7,  7, SPRITE_BOWING_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  0, 12, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FGameboyKidText, -1
	object_event  3, 11, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FLassText, -1
	object_event 12, 14, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, WonderTradeReceptionistScript, -1
	object_event  8, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FSuperNerdText, -1
	object_event 27, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FPokefanFText_Sunflora, -1
	object_event 21,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FRockerText, -1
	object_event 18, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FGrampsText, -1
	object_event 18,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FLassText_PidgeyMail, -1
	object_event  3,  9, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_SCRIPT, 0, InfoSignScript, -1
	object_event 23,  3, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_COMMAND, end, NULL, -1

	object_const_def
	const GOLDENRODPOKECOMCENTER1F_ENGINEER

JudgeMachineScreenCallback:
	checkflag ENGINE_JUDGE_MACHINE
	iffalsefwd .Done
	changeblock 24, 0, $49
	changeblock 26, 0, $4a
	changeblock 28, 0, $4b
	changeblock 24, 2, $4c
	changeblock 26, 2, $4d
	changeblock 28, 2, $4e
.Done
	endcallback

GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMING_TO_POKECOM_CENTER
	jumpstd pokecenternurse

GoldenrodPokecenter1FGameboyKidText:
	text "El Coliseo de"
	line "arriba es para"
	cont "combates por"
	cont "cable."

	para "Los récords de"
	line "combate se"

	para "publican en la"
	line "pared, así que no"
	cont "puedo permitirme"
	cont "perder."
	done

GoldenrodPokecenter1FLassText:
	text "Un #mon de"
	line "nivel más alto no"
	cont "siempre gana."

	para "Al fin y al cabo,"
	line "puede tener"
	cont "desventaja de"
	cont "tipo."

	para "No creo que haya"
	line "un solo #mon"

	para "que sea el más"
	line "fuerte de todos."
	done

GoldenrodPokecenter1FPokefanF:
	checkevent EVENT_GOT_EVIOLITE_IN_GOLDENROD
	iftrue_jumptextfaceplayer GoldenrodPokecenter1FPokefanFGotEvioliteText
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	checkitem EON_MAIL
	iffalse_jumpopenedtext GoldenrodPokecenter1FPokefanFTooBadText
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse_jumpopenedtext GoldenrodPokecenter1FPokefanFTooBadText
	takeitem EON_MAIL
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem EVIOLITE
	iffalsefwd .NoRoomForEviolite
	setevent EVENT_GOT_EVIOLITE_IN_GOLDENROD
	jumpthisopenedtext

	text "¡Mi hija se pondrá"
	line "contentísima!"
	done

.NoRoomForEviolite:
	giveitem EON_MAIL
	jumpthisopenedtext

	text "Oh… Bueno, será"
	line "otro día."
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Vaya, ¡tu mochila"
	line "se ve pesadísima!"

	para "¡Oh! ¿Tendrás por"
	line "casualidad algo"
	cont "llamado Correo"
	cont "Eón?"

	para "Mi hija anda"
	line "detrás de uno."

	para "Podrías"
	line "desprenderte de"
	cont "uno, ¿no?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "¿Regalar un"
	line "Correo Eón?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "¡Oh, genial!"
	line "¡Gracias, cielo!"

	para "¡Toma, esto es"
	line "para ti a cambio!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "¿Oh? ¿No tienes"
	line "uno? Qué pena."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> regaló el"
	line "Correo Eón."
	done

GoldenrodPokecenter1FPokefanFGotEvioliteText:
	text "¡Gracias por el"
	line "Correo Eón!"

	para "¡Mi hija se pondrá"
	line "contentísima!"
	done

WonderTradeReceptionistScript:
	opentext
	writetext WonderTradeIntroText
	waitbutton
	checkevent EVENT_INTRODUCED_TEALA
	iftruefwd .introduced
	writetext IntroduceTealaText
	waitbutton
	setevent EVENT_INTRODUCED_TEALA
.introduced
	writetext WonderTradeExplanationText
	promptbutton
	special WonderTrade
	iffalsefwd .done
	playmusic MUSIC_POKECOM_CENTER
	writetext WonderTradeCompleteText
	playsound SFX_DEX_FANFARE_80_109
	waitsfx
	ifnotequal 2, .done
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	playmusic MUSIC_SPIKY_EARED_PICHU_HGSS
	writetext WonderTradeForGSBallPichuText
	promptbutton
	verbosegivekeyitem GS_BALL
	writetext WonderTradeForGSBallPichuText2
	waitbutton
.done
	jumpthisopenedtext

	text "Esperamos verte de"
	line "nuevo."
	done

WonderTradeIntroText:
	text "¡Hola! Bienvenido"
	line "al Centro de"
	cont "Intercambio"
	cont "Milagroso del"
	cont "Centro #Com."
	done

IntroduceTealaText:
	text "Soy Teala, tu"
	line "encargada de"
	cont "intercambios."
	done

WonderTradeExplanationText:
	text "Puedes"
	line "intercambiar"
	cont "#mon con gente"
	cont "de muy lejos."
	done

WonderTradeCompleteText:
	text "Este es tu nuevo"
	line "compañero."

	para "Cuídalo con"
	line "cariño, por"
	cont "favor."
	done


WonderTradeForGSBallPichuText:
	text "…¿Pero qué es"
	line "esto? ¿Va algo"

	para "mal con la"
	line "máquina de"
	cont "Intercambio"
	cont "Milagroso?"

	para "Parece que acabas"
	line "de intercambiar"

	para "un #mon contigo"
	line "mismo."

	para "Pero eso no puede"
	line "ser… No puedes"

	para "estar en dos"
	line "sitios a la vez."

	para "Además, la máquina"
	line "se comunica"

	para "a través del"
	line "espacio, no del"
	cont "tiempo…"

	para "¿Y qué es esa"
	line "Ball extraña que"

	para "lleva? ¿Es una"
	line "Ball de Bonguri?"

	para "Toma, échale un"
	line "vistazo…"
	done

WonderTradeForGSBallPichuText2:
	text "Será inusual, pero"
	line "un #mon es un"
	cont "#mon."

	para "Cuídalo bien, por"
	line "favor."
	done

InfoSignScript:
	jumpthistext

	text "Centro #Com"
	line "Información 1F"

	para "Izquierda:"
	line "Administración"

	para "Centro:"
	line "Intercambio"
	cont "Milagroso"

	para "Derecha:"
	line "Máquina"
	cont "Evaluadora"
	cont "<PK><MN>"
	done

PokemonJournalWhitneyScript:
	setflag ENGINE_READ_WHITNEY_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "Especial: ¡Líder"
	cont "Blanca!"

	para "Dicen que Blanca"
	line "admira a Bruno del"
	cont "Alto Mando."
	done

JudgeMachineScript:
	opentext
	special JudgeMachine
	waitendtext

GoldenrodPokecenter1FSuperNerdText:
	text "Vaya, este Centro"
	line "#mon es enorme."

	para "Acaban de"
	line "construir este"

	para "sitio. También"
	line "instalaron muchas"
	cont "máquinas nuevas."
	done

GoldenrodPokecenter1FLassText_PidgeyMail:
	text "¡Se me ocurrió"
	line "algo divertido"
	cont "para el Centro de"
	cont "Intercambio"
	cont "Milagroso!"

	para "Hago que un Pidgey"
	line "lleve un Correo, y"

	para "luego lo pongo"
	line "para"
	cont "¡intercambiarlo"
	cont "por otro!"

	para "Si todos hicieran"
	line "eso, el Correo"

	para "¡podría"
	line "intercambiarse con"
	cont "todo tipo de"
	cont "gente!"

	para "¡Lo llamo Correo"
	line "Pidgey!"

	para "Si se hace"
	line "popular, ¡podría"

	para "hacer muchos"
	line "amigos nuevos!"
	done

JudgeMachineEngineerScript:
	checkevent EVENT_BRED_AN_EGG
	iffalsefwd .NotBredYet
	showtextfaceplayer JudgeMachineEngineerFinishedText
	readvar VAR_FACING
	ifnotequal RIGHT, .GoLeft
	applyonemovement GOLDENRODPOKECOMCENTER1F_ENGINEER, step_down
	applyonemovement GOLDENRODPOKECOMCENTER1F_ENGINEER, step_left
.GoLeft
	applymovement GOLDENRODPOKECOMCENTER1F_ENGINEER, JudgeMachineEngineerLeavesMovement
	disappear GOLDENRODPOKECOMCENTER1F_ENGINEER
	setflag ENGINE_JUDGE_MACHINE
	changeblock 24, 0, $49
	changeblock 26, 0, $4a
	changeblock 28, 0, $4b
	changeblock 24, 2, $4c
	changeblock 26, 2, $4d
	changeblock 28, 2, $4e
	end

.NotBredYet:
	showtextfaceplayer JudgeMachineEngineerWorkingText
	turnobject LAST_TALKED, RIGHT
	end

JudgeMachineEngineerWorkingText:
	text "La Máquina"
	line "Evaluadora"
	cont "#mon…"

	para "Ha sido mi sueño"
	line "durante mucho"
	cont "tiempo."

	para "Y con el Centro"
	line "#Com"
	cont "financiando mi"
	cont "trabajo, puede"
	cont "hacerse realidad,"

	para "¡aunque necesite"
	line "un ordenador del"
	cont "tamaño de una"
	cont "habitación!"

	para "¡Piensa en lo útil"
	line "que será para los"
	cont "Criadores que"
	cont "incuban muchos"
	cont "Huevos!"

	para "Ya casi acabo…"
	done

JudgeMachineEngineerFinishedText:
	text "La Máquina"
	line "Evaluadora"
	cont "#mon…"

	para "¡Por fin está"
	line "lista! ¡Mi sueño"
	cont "se hizo realidad!"

	para "¿Qué es? Es una"
	line "máquina para"

	para "juzgar las"
	line "estadísticas de"
	cont "cualquier #mon."

	para "Usa la última"
	line "tecnología de IA"

	para "para evaluar el"
	line "potencial innato"
	cont "de un #mon,"

	para "así como el"
	line "esfuerzo puesto en"
	cont "volverse más"
	cont "fuerte."

	para "¡Es la forma"
	line "perfecta de medir"
	cont "el poder de un"
	cont "#mon!"

	para "Adelante,"
	line "pruébala. Es"
	cont "totalmente"
	cont "segura."

	para "En cuanto a mí,"
	line "¡me voy de"
	cont "vacaciones!"
	done

JudgeMachineEngineerLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

GoldenrodPokecenter1FPokefanFText_Sunflora:
	text "Una chica que no"
	line "conozco me envió"
	cont "su Sunflora."

	para "Deberías"
	line "intercambiar por"
	cont "un #mon que"
	cont "quieras."
	done

GoldenrodPokecenter1FRockerText:
	text "Aún no se pueden"
	line "usar todas las"
	cont "máquinas de aquí."

	para "Aun así, mola"
	line "venir a un sitio"

	para "de moda antes que"
	line "los demás."
	done

GoldenrodPokecenter1FGrampsText:
	text "Solo con ver todas"
	line "estas novedades"

	para "aquí, ¡me siento"
	line "más joven!"
	done
