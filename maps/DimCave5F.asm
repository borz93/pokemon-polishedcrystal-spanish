DimCave5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, DimCave5FSetUpStoneTable

	def_warp_events
	warp_event 13, 31, ROUTE_10_NORTH, 5
	warp_event  2, 16, DIM_CAVE_4F, 1
	warp_event 27, 29, DIM_CAVE_4F, 2
	warp_event 28, 25, DIM_CAVE_4F, 3

	def_coord_events

	def_bg_events
	bg_event 12, 28, BGEVENT_ITEM + X_SP_ATK, EVENT_DIM_CAVE_5F_HIDDEN_X_SP_ATK

	def_object_events
	strengthboulder_event 25,  5, EVENT_BOULDER_IN_DIM_CAVE_5F
	object_event 13,  4, SPRITE_RILEY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, DimCave5FRileyScript, EVENT_DIM_CAVE_RILEY
	object_event 24, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSuper_nerdFoote, -1
	object_event 13, 25, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerHoward, -1
	object_event 21, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSuper_nerdDave, -1
	itemball_event 13, 13, RARE_CANDY, 1, EVENT_DIM_CAVE_5F_RARE_CANDY
	itemball_event  9, 27, DUSK_STONE, 1, EVENT_DIM_CAVE_5F_DUSK_STONE
	itemball_event 31, 14, HYPER_POTION, 1, EVENT_DIM_CAVE_5F_HYPER_POTION

	object_const_def
	const DIMCAVE5F_BOULDER
	const DIMCAVE5F_RILEY

DimCave5FSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 4, DIMCAVE5F_BOULDER, .Boulder
	db -1 ; end

.Boulder:
	disappear DIMCAVE5F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "¡La roca cayó al"
	line "vacío!"
	done

DimCave5FRileyScript:
	faceplayer
	checkevent EVENT_BEAT_RILEY
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked DIMCAVE5F_RILEY
	loadtrainer RILEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RILEY
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BRACER
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear DIMCAVE5F_RILEY
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_RILEY
	end

.ChallengeText:
	text "…¿Y tú eres?"

	para "Vale, eres"
	line "<PLAYER>."

	para "Soy Riley. Sí, soy"
	line "entrenador."

	para "Tengo una mina"
	line "como esta, así que"
	cont "es un buen lugar"
	cont "de entrenamiento"
	cont "para mí."

	para "Si quieres,"
	line "podríamos"
	cont "combatir."
	done

.YesText:
	text "Sacaremos todo lo"
	line "que tenemos para"

	para "derribar a tus"
	line "#mon."
	done

.NoText:
	text "Oh, está bien."
	line "Entonces"
	cont "seguiremos"
	cont "entrenando aquí."
	done

.BeatenText:
	text "A veces"
	line "combatimos, y a"
	cont "veces nos"
	cont "aliamos."

	para "Es genial cómo"
	line "interactúan los"
	cont "entrenadores."
	done

.ItemText:
	text "Conoce a tu"
	line "enemigo."

	para "Si conoces a los"
	line "#mon y"
	cont "movimientos de tu"

	para "rival, tus"
	line "posibilidades de"
	cont "ganar mejoran"
	cont "mucho."

	para "Pero fortalecer tu"
	line "propio equipo"
	cont "también es"
	cont "importante."

	para "Esto te ayudará a"
	line "lograrlo."
	done

.GoodbyeText:
	text "Combatir contigo"
	line "fue muy"
	cont "agradable."

	para "Pienso poner a"
	line "prueba mis"
	cont "habilidades en la"
	cont "Torre Batalla."

	para "¡Nos veremos de"
	line "nuevo!"

	para "Ten cuidado al"
	line "salir."
	done

GenericTrainerSuper_nerdFoote:
	generictrainer SUPER_NERD, FOOTE, EVENT_BEAT_SUPER_NERD_FOOTE, .SeenText, .BeatenText

	text "¿Salvar una vida o"
	line "salvar cinco?"

	para "Como entrenador"
	line "#mon, ¡puede"
	cont "que tengas el"
	cont "poder de salvar"
	cont "los seis!"
	done

.SeenText:
	text "¡Tengo un dilema"
	line "para ti!"

	para "¿Empujarías a un"
	line "#mon frente a"

	para "una vagoneta para"
	line "salvar a cinco?"
	done

.BeatenText:
	text "Respondiste sin"
	line "palabras…"
	cont "¡Qué Zen!"
	done

GenericTrainerEngineerHoward:
	generictrainer ENGINEER, HOWARD, EVENT_BEAT_ENGINEER_HOWARD, .SeenText, .BeatenText

	text "El agua fluye al"
	line "sur desde el Cabo"
	cont "Celeste"

	para "y sigue un curso"
	line "constante hacia la"
	cont "Central"
	cont "Eléctrica."
	done

.SeenText:
	text "¡Esta cascada da"
	line "energía a todo"
	cont "Kanto!"
	done

.BeatenText:
	text "¡No! Un apagón…"
	done

GenericTrainerSuper_nerdDave:
	generictrainer SUPER_NERD, DAVE, EVENT_BEAT_SUPER_NERD_DAVE, .SeenText, .BeatenText

	text "Necesitas un pico"
	line "minero para"
	cont "minar."

	para "Pero no puedes"
	line "conseguir uno por"
	cont "aquí."
	done

.SeenText:
	text "¡Maximicé mis"
	line "habilidades de"
	cont "minería, joyería,"

	para "fundición y"
	line "artesanía!"
	done

.BeatenText:
	text "Pero no de"
	line "combate…"
	done
