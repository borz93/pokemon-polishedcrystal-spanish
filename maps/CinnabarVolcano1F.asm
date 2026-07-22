CinnabarVolcano1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, CinnabarVolcano1FBouldersFall

	def_warp_events
	warp_event 13, 25, CINNABAR_ISLAND, 2
	warp_event  5, 13, CINNABAR_VOLCANO_B1F, 1
	warp_event 14, 20, CINNABAR_VOLCANO_B1F, 2
	warp_event 25, 19, CINNABAR_VOLCANO_B1F, 3
	warp_event 22,  8, CINNABAR_VOLCANO_B1F, 4
	warp_event  8, 21, CINNABAR_VOLCANO_B1F, 8
	warp_event 20, 19, CINNABAR_VOLCANO_B1F, 9
	warp_event 18,  9, CINNABAR_VOLCANO_B1F, 10
	warp_event 10,  7, CINNABAR_VOLCANO_B1F, 11
	warp_event 15,  3, CINNABAR_VOLCANO_B1F, 12

	def_coord_events

	def_bg_events
	bg_event 13,  1, BGEVENT_ITEM + FULL_RESTORE, EVENT_CINNABAR_VOLCANO_1F_HIDDEN_FULL_RESTORE

	def_object_events
	object_event  4,  9, SPRITE_BUCK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcano1FBuckScript, EVENT_CINNABAR_VOLCANO_BUCK
	strengthboulder_event  6, 16, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_1
	strengthboulder_event 15, 22, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_2
	strengthboulder_event 19,  4, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_3
	strengthboulder_event  5,  4, EVENT_BOULDER_IN_CINNABAR_VOLCANO_1F_4
	object_event  2, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerScientistOskar, -1
	object_event 17, 24, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuperNerdLuis, -1
	smashrock_event  5, 18
	smashrock_event 11, 21
	smashrock_event 35, 23
	smashrock_event 19, 11
	smashrock_event 25, 12
	smashrock_event 13, 2
	smashrock_event  8, 4

	object_const_def
	const CINNABARVOLCANO1F_BUCK
	const CINNABARVOLCANO1F_BOULDER1
	const CINNABARVOLCANO1F_BOULDER2
	const CINNABARVOLCANO1F_BOULDER3
	const CINNABARVOLCANO1F_BOULDER4

CinnabarVolcano1FBouldersFall:
	usestonetable .BoulderTable
	endcallback

.BoulderTable:
	stonetable 6, CINNABARVOLCANO1F_BOULDER1, .Disappear1
	stonetable 7, CINNABARVOLCANO1F_BOULDER2, .Disappear2
	stonetable 8, CINNABARVOLCANO1F_BOULDER3, .Disappear3
	stonetable 9, CINNABARVOLCANO1F_BOULDER4, .Disappear4
	db -1 ; end

.Disappear1:
	disappear CINNABARVOLCANO1F_BOULDER1
	sjumpfwd .Fall

.Disappear2:
	disappear CINNABARVOLCANO1F_BOULDER2
	sjumpfwd .Fall

.Disappear3:
	disappear CINNABARVOLCANO1F_BOULDER3
	sjumpfwd .Fall

.Disappear4:
	disappear CINNABARVOLCANO1F_BOULDER4
	; fallthrough

.Fall:
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "¡La roca cayó al"
	line "vacío!"
	done

CinnabarVolcano1FBuckScript:
	faceplayer
	checkevent EVENT_BEAT_BUCK
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked CINNABARVOLCANO1F_BUCK
	loadtrainer BUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUCK
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BELT
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear CINNABARVOLCANO1F_BUCK
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_BUCK
	end

.ChallengeText:
	text "¡Hola! Soy Buck."
	line "Y tú eres…"
	cont "<PLAYER>?"

	para "No me digas que tú"
	line "también buscas"
	cont "tesoros."

	para "El Monte Corona de"
	line "mi tierra tiene"

	para "tesoros en sus"
	line "profundidades, así"
	cont "que seguro este"
	cont "volcán también!"

	para "Por eso estoy"
	line "aquí."

	para "Entonces,"
	line "<PLAYER>, ¿qué tal"
	cont "si combatimos por"
	cont "él?"
	done

.YesText:
	text "¡Vale! Te lo digo"
	line "ya. Soy realmente"
	cont "duro."
	done

.NoText:
	text "Seguiré"
	line "preguntando hasta"
	cont "que digas"
	cont "“¡Sí!”"
	done

.BeatenText:
	text "¡Jijiji!"
	line "¡Qué caliente"
	cont "eres!"
	done

.ItemText:
	text "¡Fiuu! ¡Demasiado!"

	para "El tesoro de este"
	line "volcán no es para"
	cont "mí…"

	para "¡Pero oye,"
	line "<PLAYER>! ¡Eres un"
	cont "entrenador"
	cont "increíble!"

	para "¡Esto te va a"
	line "gustar!"
	done

.GoodbyeText:
	text "Supongo que"
	line "mejoraré mi equipo"
	cont "en la Torre"
	cont "Batalla."

	para "Nos vemos,"
	line "<PLAYER>!"
	cont "¡Adiós!"
	done

GenericTrainerScientistOskar:
	generictrainer SCIENTIST, OSKAR, EVENT_BEAT_SCIENTIST_OSKAR, ScientistOskarSeenText, ScientistOskarBeatenText

	text "Es importante"
	line "estudiar los"
	cont "desastres"

	para "naturales para"
	line "prepararnos para"
	cont "el próximo."
	done

GenericTrainerSuperNerdLuis:
	generictrainer SUPER_NERD, LUIS, EVENT_BEAT_SUPER_NERD_LUIS, SuperNerdLuisSeenText, SuperNerdLuisBeatenText

	text "¡Es tan"
	line "emocionante estar"
	cont "dentro de un"
	cont "volcán!"

	para "Pero da miedo a la"
	line "vez."
	done

ScientistOskarSeenText:
	text "Estudio el volcán"
	line "para saber por qué"
	cont "hizo erupción."
	done

ScientistOskarBeatenText:
	text "¡Más suerte la"
	line "próxima vez!"
	done

SuperNerdLuisSeenText:
	text "¿Sabías que el"
	line "magma solo se"

	para "llama lava cuando"
	line "llega a la"

	para "superficie por un"
	line "respiradero"
	cont "volcánico?"
	done

SuperNerdLuisBeatenText:
	text "Acabas de"
	line "enseñarme…"
	done
