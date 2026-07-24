RuinsOfAlphResearchCenter_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterAcademicBooksText
	bg_event  3,  4, BGEVENT_READ, MapRuinsofAlphResearchCenterSignpost1Script
	bg_event  7,  1, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterPrinterText_DoesntWork
	bg_event  5,  0, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterProfSilktreePhotoText

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST

	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequalfwd $1, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer .Script
	end

.Script:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	showtext RuinsOfAlphResearchCenterModifiedDexText
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_up
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	checkevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	iftruefwd .Conclusion
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .PrinterAvailable
	jumpopenedtext RuinsOfAlphResearchCenterScientist3Text

.Conclusion:
	jumpthisopenedtext

	text "Vamos a estudiar"
	line "poco a poco"

	para "la cámara que se"
	line "abrió."

	para "Tenemos que tener"
	line "cuidado de no"
	cont "alterar el lugar."
	done

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	promptbutton
	setevent EVENT_DECO_UNOWN_DOLL
	writetext GotUnownDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext UnownDollSentText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistRewardText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistInterruptedText
	pause 30
	closetext
	pause 15
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	setevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST1, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST2, 15
	showtext RuinsofAlphResearchCenterScientistShockedText
	readvar VAR_FACING
	ifequalfwd UP, .GoAround
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterLeave2MovementData
	stopfollow
	sjumpfwd .Continue
.GoAround:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterScientistStepAsideMovementData
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	stopfollow
.Continue:
	playsound SFX_EXIT_BUILDING
	disappear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	setevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	pause 15
	warpfacing DOWN, RUINS_OF_ALPH_OUTSIDE, 19, 18
	end

RuinsofAlphResearchCenterScientistStepAsideMovementData:
	step_right
	step_down
	step_end

RuinsofAlphResearchCenterLeave2MovementData:
	step_down
	step_down
	step_end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpthisopenedtext

	text "Las ruinas tienen"
	line "unos 1.500 años"
	cont "de vida."

	para "Pero no se sabe"
	line "por qué ni quién"
	cont "las construyó."
	done

.UnownAppeared:
	jumpthisopenedtext

	text "¿#mon"
	line "aparecieron en"
	cont "las ruinas?"

	para "¡Eso es una"
	line "noticia"
	cont "increíble!"

	para "Tendremos que"
	line "investigar esto."
	done

.GotUnownDex:
	jumpthisopenedtext

	text "Me pregunto"
	line "cuántos tipos de"
	cont "#mon hay en las"
	cont "ruinas."
	done

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifgreater 3, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpthisopenedtext

	text "Hay patrones"
	line "extraños dibujados"
	cont "en las paredes"

	para "de las ruinas."

	para "Deben ser las"
	line "claves para"
	cont "resolver el"
	cont "misterio de las"
	cont "ruinas."
	done

.UnownAppeared:
	jumpthisopenedtext

	text "¿Los extraños"
	line "#mon que viste"
	cont "en las ruinas?"

	para "Parece que se"
	line "parecen mucho a"

	para "los dibujos de las"
	line "paredes de allí."

	para "Hmm…"

	para "Eso debe"
	line "significar que hay"
	cont "muchos tipos de"
	cont "ellos…"
	done

.GotAllUnown:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .ResearchComplete
	readvar VAR_UNOWNCOUNT
	ifgreater 10, .ResearchOngoing
	jumpthisopenedtext

	text "¿Por qué"
	line "aparecieron esos"

	para "patrones antiguos"
	line "en la pared ahora?"

	para "El misterio se"
	line "profundiza…"
	done

.ResearchComplete:
	writetext RuinsOfAlphResearchCenterScientist2Text_RadioWaves
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

.ResearchOngoing:
	jumpthisopenedtext

	text "Creemos que algo"
	line "causó que esos"

	para "patrones crípticos"
	line "aparecieran en las"
	cont "ruinas."

	para "Hemos centrado"
	line "nuestros estudios"
	cont "en eso."
	done

MapRuinsofAlphResearchCenterSignpost1Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iffalsefwd .SkipChecking
	checkevent EVENT_DECO_UNOWN_DOLL
	iftruefwd .SkipChecking
	jumpthisopenedtext

	text "Ruinas Alfa"

	para "Año 10 de"
	line "exploración"
	done

.SkipChecking:
	readvar VAR_UNOWNCOUNT
	jumpopenedtext RuinsOfAlphResearchCenterComputerText_GotAllUnown

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step_up
	step_up
	step_left
	turn_head_up
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "¡Listo!"

	para "Modifiqué tu"
	line "#dex."

	para "Añadí una #dex"
	line "opcional"

	para "para guardar"
	line "datos de Unown."

	para "Los registra en"
	line "orden"
	cont "alfabético."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "La #dex de"
	line "<PLAYER> se"
	cont "actualizó."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Todos los Unown"
	line "que atrapes se"
	cont "registrarán."

	para "Comprueba cuántos"
	line "tipos existen."

	para "Nos estás haciendo"
	line "un favor, así que"

	para "te daré algo"
	line "bonito si los"
	cont "encuentras todos."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "¿Atrapaste todas"
	line "las variantes de"
	cont "Unown?"

	para "¡Eso es un gran"
	line "logro!"

	para "Nos has ayudado"
	line "mucho con nuestra"
	cont "investigación."

	para "Deja que te dé"
	line "esto."
	done

GotUnownDollText:
	text "<PLAYER> recibió"
	line "el Muñeco Unown."
	done

UnownDollSentText:
	text "El Muñeco Unown"
	line "se envió a casa."
	done

RuinsofAlphResearchCenterScientistRewardText:
	text "¡Yo diseñé ese"
	line "muñeco!"
	done

RuinsofAlphResearchCenterScientistInterruptedText:
	text "Puedes…"
	done

RuinsofAlphResearchCenterScientistShockedText:
	text "¡¿QUÉ FUE ESO?!"
	done





RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Nuestra"
	line "investigación, con"
	cont "tu ayuda, nos está"

	para "dando información"
	line "sobre las ruinas."

	para "Parece que las"
	line "ruinas se"

	para "construyeron como"
	line "hábitat para"
	cont "#mon."
	done




RuinsOfAlphResearchCenterScientist2Text_RadioWaves:
	text "Según mi"
	line "investigación…"

	para "Esos patrones"
	line "misteriosos"

	para "aparecieron cuando"
	line "se construyó el"
	cont "Centro #Com."

	para "Debe significar"
	line "que las ondas de"
	cont "radio tienen algún"
	cont "tipo de conexión…"
	done



RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "#mon misterioso"
	line "Nombre: Unown"

	para "Un total de "
	text_decimal hScriptVar, 1, 2
	line "tipos"
	cont "encontrados."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Es una impresora."
	line "La pantalla dice"
	cont "“PC LOAD LETTER”."

	para "…¿Qué"
	line "significará?"
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "Es una foto del"
	line "fundador del"

	para "Centro de"
	line "Investigación, el"
	cont "Prof.Silktree."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Hay muchos libros"
	line "académicos."

	para "Ruinas Antiguas…"
	line "Misterios de los"
	cont "Antiguos…"
	done
