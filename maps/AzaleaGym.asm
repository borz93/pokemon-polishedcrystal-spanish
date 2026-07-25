AzaleaGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 23, AZALEA_TOWN, 5
	warp_event  7, 23, AZALEA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  5, 21, BGEVENT_READ, AzaleaGymStatue
	bg_event  8, 21, BGEVENT_READ, AzaleaGymStatue
	bg_event  1, 10, BGEVENT_READ, AzaleaGymRedSwitch
	bg_event  3,  4, BGEVENT_READ, AzaleaGymBlueSwitch
	bg_event  8,  5, BGEVENT_READ, AzaleaGymBlueSwitch
	bg_event  8, 10, BGEVENT_READ, AzaleaGymBlueSwitch

	def_object_events
	object_event  2, 18, SPRITE_SPINARAK_CART, SPRITEMOVEDATA_SPINARAK_CART, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SpinarakCart1Script, -1
	object_event  6, 18, SPRITE_SPINARAK_CART, SPRITEMOVEDATA_SPINARAK_CART, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SpinarakCart2Script, -1
	object_event 11, 18, SPRITE_SPINARAK_CART, SPRITEMOVEDATA_SPINARAK_CART, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SpinarakCart3Script, -1
	object_event  6,  9, SPRITE_SPINARAK_CART, SPRITEMOVEDATA_SPINARAK_CART, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SpinarakCart4Script, -1
	object_event  7,  3, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  9, 21, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
	object_event  5, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_catcherBenny, -1
	object_event 11, 13, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBug_catcherAl, -1
	object_event 11,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBug_catcherJosh, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsAmyandmimi1, -1
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsAmyandmimi2, -1

	object_const_def
	const AZALEAGYM_SPINARAKCART1
	const AZALEAGYM_SPINARAKCART2
	const AZALEAGYM_SPINARAKCART3
	const AZALEAGYM_SPINARAKCART4

AzaleaGymStatue:
	gettrainername BUGSY, 1, STRING_BUFFER_4
	checkflag ENGINE_HIVEBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 9, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

AzaleaGymBugsyScript:
	checkevent EVENT_BEAT_BUGSY
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer BUGSY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	givebadge HIVEBADGE, JOHTO_REGION
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writethistext
		text "¿Sabes qué"
		line "beneficios tiene"
		cont "la Med. Colmena?"

		para "Si la tienes, tus"
		line "#mon hasta Nv30"

		para "te obedecerán,"
		line "incluso los"
		cont "intercambiados."

		para "Los #mon que"
		line "sepan Corte"

		para "podrán usarlo"
		line "fuera del combate"
		cont "también."

		para "Toma, quiero que"
		line "tengas esto."
		done
	promptbutton
	verbosegivetmhm TM_U_TURN
	setevent EVENT_GOT_TM69_U_TURN
	jumpthisopenedtext

	text "La MT69 contiene"
	line "Ida y Vuelta."

	para "Deja que #mon"
	line "ataque y luego"

	para "cambie de"
	line "inmediato."

	para "¿A que es genial?"
	line "¡Lo descubrí yo!"
	done

.SeenText:
	text "¡Soy Antón!"
	line "Nunca pierdo con"

	para "#mon tipo"
	line "Bicho."

	para "Mi investigación"
	line "hará de mí"

	para "la máxima autori-"
	line "dad en #mon"
	cont "Bicho!"

	para "Deja que te"
	line "muestre lo que"
	cont "he aprendido."
	done

.BeatenText:
	text "¡Vaya, increíble!"
	line "Eres un experto"
	cont "en #mon!"

	para "Mi investigación"
	line "no está completa."

	para "Vale, ganas."
	line "Toma la Medalla."
	done

.AfterText:
	text "Los #mon Bicho"
	line "son profundos."

	para "Hay muchos"
	line "misterios por"
	cont "explorar."

	para "Estudia bien a"
	line "tus favoritos."
	done

AzaleaGymGuyScript:
	checkevent EVENT_BEAT_BUGSY
	iftrue_jumptextfaceplayer .WinText
	jumpthistextfaceplayer

	text "¡Eh, aspirante!"

	para "Antón es joven,"
	line "pero su conocim."
	cont "de #mon Bicho"
	cont "es real."

	para "Va a ser duro"
	line "sin mis consejos."

	para "Veamos… A los"
	line "#mon Bicho no"
	cont "les gusta el"
	cont "fuego."

	para "Los movs. Volador"
	line "también son"
	cont "supereficaces."
	done

.WinText:
	text "¡Bien hecho! Fue"
	line "un gran choque"

	para "de jóvenes"
	line "entrenadores con"
	cont "talento."

	para "¡Con gente como"
	line "tú, el futuro"
	cont "#mon es"
	cont "prometedor!"
	done

GenericTrainerBug_catcherBenny:
	generictrainer BUG_CATCHER, BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, .SeenText, .BeatenText

	text "¡Los #mon se"
	line "hacen más fuertes"
	cont "al evolucionar!"
	done

.SeenText:
	text "Los #mon Bicho"
	line "evolucionan"
	cont "jóvenes. Por eso"
	cont "se fortalecen"
	cont "antes."
	done

.BeatenText:
	text "¡Con evolucionar"
	line "no basta!"
	done

GenericTrainerBug_catcherAl:
	generictrainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, .SeenText, .BeatenText

	text "Molan mucho, pero"
	line "a la mayoría de"
	cont "chicas no les"
	cont "gustan los #mon"
	cont "Bicho."

	para "No sé por qué…"
	done

.SeenText:
	text "¡Los #mon Bicho"
	line "son geniales y"
	cont "fuertes!"

	para "¡Te lo voy a"
	line "demostrar!"
	done

.BeatenText:
	text "Has demostrado lo"
	line "fuerte que eres…"
	done

GenericTrainerBug_catcherJosh:
	generictrainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, .SeenText, .BeatenText

	text "Supongo que debo"
	line "enseñarles mejores"
	cont "movimientos…"
	done

.SeenText:
	text "¿Salvaste a todos"
	line "los Slowpoke? ¡Uf,"
	cont "eres poderoso!"

	para "¡Pero mis #mon"
	line "adultos también"
	cont "son fuertes!"
	done

.BeatenText:
	text "¡Aaaargh!"
	done

GenericTrainerTwinsAmyandmimi1:
	generictrainer TWINS, AMYANDMIMI1, EVENT_BEAT_TWINS_AMY_AND_MAY, .SeenText, TrainerTwinsAmyandmimiBeatenText

	text "Amy: ¡Eres"
	line "muy fuerte!"
	done

.SeenText:
	text "Amy: ¡Hola! ¿Vas"
	line "a retar al"
	cont "Líder? ¡Anda ya!"
	done

GenericTrainerTwinsAmyandmimi2:
	generictrainer TWINS, AMYANDMIMI2, EVENT_BEAT_TWINS_AMY_AND_MAY, .SeenText, TrainerTwinsAmyandmimiBeatenText

	text "Mimi: ¡Nuestro"
	line "#mon Bicho"
	cont "perdió!"

	para "Vaya, qué"
	line "pena."
	done

.SeenText:
	text "Mimi: ¿Quieres"
	line "ver al Líder?"
	cont "¡Primero nosotras!"
	done

TrainerTwinsAmyandmimiBeatenText:
	text "Amy y Mimi: ¡Vaya,"
	line "doble bien!"
	done

SpinarakCartStartUpScript:
	applymovement PLAYER, .Movement
	loadmem wFollowInSync, TRUE
	end

.Movement:
	step_up
	fix_facing
	set_sliding
	step_end

SpinarakCartFinishUpScript:
	stopfollow
	loadmem wFollowInSync, FALSE
	applymovement PLAYER, .Movement
	end

.Movement:
	remove_sliding
	remove_fixed_facing
	step_up
	step_end

SpinarakCartStartDownScript:
	applymovement PLAYER, .Movement
	loadmem wFollowInSync, TRUE
	end

.Movement:
	step_down
	fix_facing
	set_sliding
	step_end

SpinarakCartFinishDownScript:
	stopfollow
	loadmem wFollowInSync, FALSE
	applymovement PLAYER, .Movement
	end

.Movement:
	remove_sliding
	remove_fixed_facing
	step_down
	step_end

SpinarakCart1Script:
	readvar VAR_FACING
	ifequalfwd UP, .CrawlUp
	ifequalfwd DOWN, .CrawlDown
	end

.CrawlUp:
	scall SpinarakCartStartUpScript
	follow PLAYER, AZALEAGYM_SPINARAKCART1
	applymovement PLAYER, .CrawlUpMovement
	sjump SpinarakCartFinishUpScript

.CrawlDown:
	scall SpinarakCartStartDownScript
	follow PLAYER, AZALEAGYM_SPINARAKCART1
	applymovement PLAYER, .CrawlDownMovement
	sjump SpinarakCartFinishDownScript

.CrawlUpMovement:
	step_up
rept 4
	step_right
endr
	half_step_up
rept 5
	step_right
endr
	step_up
rept 5
	step_left
endr
	half_step_up
	step_end

.CrawlDownMovement:
	half_step_down
rept 5
	step_right
endr
	step_down
rept 5
	step_left
endr
	half_step_down
rept 4
	step_left
endr
	step_down
	step_end

SpinarakCart2Script:
	readvar VAR_FACING
	ifequalfwd UP, .CrawlUp
	ifequalfwd DOWN, .CrawlDown
	end

.CrawlUp:
	scall SpinarakCartStartUpScript
	follow PLAYER, AZALEAGYM_SPINARAKCART2
	applymovement PLAYER, .CrawlUpMovement
	sjump SpinarakCartFinishUpScript

.CrawlDown:
	scall SpinarakCartStartDownScript
	follow PLAYER, AZALEAGYM_SPINARAKCART2
	applymovement PLAYER, .CrawlDownMovement
	sjump SpinarakCartFinishDownScript

.CrawlUpMovement:
	step_up
rept 4
	step_left
endr
	step_up
rept 4
	step_right
endr
	half_step_up
rept 5
	step_right
endr
	half_step_up
	step_end

.CrawlDownMovement:
	half_step_down
rept 5
	step_left
endr
	half_step_down
rept 4
	step_left
endr
	step_down
rept 4
	step_right
endr
	step_down
	step_end

SpinarakCart3Script:
	readvar VAR_FACING
	ifequalfwd UP, .CrawlUp
	ifequalfwd DOWN, .CrawlDown
	end

.CrawlUp:
	scall SpinarakCartStartUpScript
	follow PLAYER, AZALEAGYM_SPINARAKCART3
	applymovement PLAYER, .CrawlUpMovement
	sjump SpinarakCartFinishUpScript

.CrawlDown:
	scall SpinarakCartStartDownScript
	follow PLAYER, AZALEAGYM_SPINARAKCART3
	applymovement PLAYER, .CrawlDownMovement
	sjump SpinarakCartFinishDownScript

.CrawlUpMovement:
	step_up
	half_step_up
rept 5
	step_left
endr
	half_step_up
rept 4
	step_left
endr
	step_up
	step_end

.CrawlDownMovement:
	step_down
rept 4
	step_right
endr
	half_step_down
rept 5
	step_right
endr
	half_step_down
	step_down
	step_end

AzaleaGymRedSwitch:
	callasm ReanchorBGMap_NoOAMUpdate
	playsound SFX_SWITCH_POCKETS
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .EnableRedWeb
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	changeblock 0, 10, $f5
	changeblock 2, 6, $e5
	changeblock 4, 6, $e6
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .DisableRedWebWithBlueDisabled
	changeblock 6, 6, $e7
	sjumpfwd .FinishDisableRedWeb
.DisableRedWebWithBlueDisabled:
	changeblock 6, 6, $eb
.FinishDisableRedWeb:
	refreshmap
	end

.EnableRedWeb:
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	changeblock 0, 10, $f4
	changeblock 2, 6, $dc
	changeblock 4, 6, $dd
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .EnableRedWebWithBlueDisabled
	changeblock 6, 6, $de
	sjumpfwd .FinishEnableRedWeb
.EnableRedWebWithBlueDisabled:
	changeblock 6, 6, $e8
.FinishEnableRedWeb:
	refreshmap
	end

AzaleaGymBlueSwitch:
	callasm ReanchorBGMap_NoOAMUpdate
	playsound SFX_SWITCH_POCKETS
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .EnableBlueWeb
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	changeblock 2, 4, $ef
	changeblock 8, 4, $f1
	changeblock 8, 10, $f3
	changeblock 8, 6, $e9
	changeblock 10, 6, $ea
	changeblock 6, 8, $ec
	changeblock 8, 8, $ed
	changeblock 10, 8, $ee
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .DisableBlueWebWithRedDisabled
	changeblock 6, 6, $e8
	sjumpfwd .FinishDisableBlueWeb
.DisableBlueWebWithRedDisabled:
	changeblock 6, 6, $eb
.FinishDisableBlueWeb:
	refreshmap
	end

.EnableBlueWeb:
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	changeblock 2, 4, $d9
	changeblock 8, 4, $f0
	changeblock 8, 10, $f2
	changeblock 8, 6, $db
	changeblock 10, 6, $df
	changeblock 6, 8, $e2
	changeblock 8, 8, $e4
	changeblock 10, 8, $e3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .EnableBlueWebWithRedDisabled
	changeblock 6, 6, $de
	sjumpfwd .FinishEnableBlueWeb
.EnableBlueWebWithRedDisabled:
	changeblock 6, 6, $e7
.FinishEnableBlueWeb:
	refreshmap
	end

SpinarakCart4Script:
	readvar VAR_FACING
	ifequalfwd UP, .CrawlUp
	ifequalfwd DOWN, .CrawlDown
	end

.CrawlUp:
	scall SpinarakCartStartUpScript
	follow PLAYER, AZALEAGYM_SPINARAKCART4
	readvar VAR_XCOORD
	ifequalfwd 2, .CrawlUpLeft
	ifequalfwd 6, .CrawlUpMiddle
	ifequalfwd 11, .CrawlUpRight
	end

.CrawlDown:
	scall SpinarakCartStartDownScript
	follow PLAYER, AZALEAGYM_SPINARAKCART4
	readvar VAR_XCOORD
	ifequalfwd 2, .CrawlDownLeft
	ifequalfwd 6, .CrawlDownMiddle
	ifequalfwd 11, .CrawlDownRight
	end

.CrawlUpLeft:
	applymovement PLAYER, .CrawlUpLeftMovement1
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalsefwd .CrawlUpLeft_BlueEnabled
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalsefwd .CrawlUpLeft_BlueDisabled_RedEnabled
	applymovement PLAYER, .CrawlUpLeftMovement2_BlueDisabled_RedDisabled
	sjump SpinarakCartFinishUpScript

.CrawlUpLeft_BlueEnabled:
	applymovement PLAYER, .CrawlUpLeftMovement2_BlueEnabled
	sjump SpinarakCartFinishUpScript

.CrawlUpLeft_BlueDisabled_RedEnabled:
	applymovement PLAYER, .CrawlUpLeftMovement2_BlueDisabled_RedEnabled
	sjump SpinarakCartFinishUpScript

.CrawlUpMiddle:
	applymovement PLAYER, .CrawlUpMiddleMovement1
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .CrawlUpMiddle_BlueDisabled
	applymovement PLAYER, .CrawlUpMiddleMovement2_BlueEnabled
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalsefwd .CrawlUpMiddle_BlueEnabled_RedEnabled
	applymovement PLAYER, .CrawlUpMiddleMovement3_BlueEnabled_RedDisabled
	sjump SpinarakCartFinishUpScript

.CrawlUpMiddle_BlueDisabled:
	applymovement PLAYER, .CrawlUpMiddleMovement2_BlueDisabled
	sjump SpinarakCartFinishUpScript

.CrawlUpMiddle_BlueEnabled_RedEnabled:
	applymovement PLAYER, .CrawlUpMiddleMovement3_BlueEnabled_RedEnabled
	sjump SpinarakCartFinishUpScript

.CrawlUpRight:
	applymovement PLAYER, .CrawlUpRightMovement1
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalsefwd .CrawlUpRight_RedEnabled
	applymovement PLAYER, .CrawlUpRightMovement2_RedDisabled
	sjump SpinarakCartFinishUpScript

.CrawlUpRight_RedEnabled:
	applymovement PLAYER, .CrawlUpRightMovement2_RedEnabled
	sjump SpinarakCartFinishUpScript

.CrawlDownLeft:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .CrawlDownLeft_RedDisabled
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .CrawlDownLeft_RedEnabled_BlueDisabled
	applymovement PLAYER, .CrawlDownLeftMovement_RedEnabled_BlueEnabled
	sjump SpinarakCartFinishDownScript

.CrawlDownLeft_RedDisabled:
	applymovement PLAYER, .CrawlDownLeftMovement_RedDisabled
	sjump SpinarakCartFinishDownScript

.CrawlDownLeft_RedEnabled_BlueDisabled:
	applymovement PLAYER, .CrawlDownLeftMovement_RedEnabled_BlueDisabled
	sjump SpinarakCartFinishDownScript

.CrawlDownMiddle:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalsefwd .CrawlDownMiddle_RedEnabled
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalsefwd .CrawlDownMiddle_RedDisabled_BlueEnabled
	applymovement PLAYER, .CrawlDownMiddleMovement_RedDisabled_BlueDisabled
	sjump SpinarakCartFinishDownScript

.CrawlDownMiddle_RedEnabled:
	applymovement PLAYER, .CrawlDownMiddleMovement_RedEnabled
	sjump SpinarakCartFinishDownScript

.CrawlDownMiddle_RedDisabled_BlueEnabled:
	applymovement PLAYER, .CrawlDownMiddleMovement_RedDisabled_BlueEnabled
	sjump SpinarakCartFinishDownScript

.CrawlDownRight:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .CrawlDownRight_BlueDisabled
	applymovement PLAYER, .CrawlDownRightMovement_BlueEnabled
	sjump SpinarakCartFinishDownScript

.CrawlDownRight_BlueDisabled:
	applymovement PLAYER, .CrawlDownRightMovement_BlueDisabled
	sjump SpinarakCartFinishDownScript

.CrawlUpLeftMovement1:
	step_up
	half_step_up
rept 4
	step_right
endr
	step_end

.CrawlUpLeftMovement2_BlueEnabled:
	half_step_up
rept 5
	step_right
endr
	step_up
	step_end

.CrawlUpLeftMovement2_BlueDisabled_RedEnabled:
	step_up
rept 4
	step_left
endr
	half_step_up
	step_end

.CrawlUpLeftMovement2_BlueDisabled_RedDisabled:
	step_up
	half_step_up
	step_end

.CrawlUpMiddleMovement1:
	step_up
rept 5
	step_right
endr
.CrawlUpMiddleMovement2_BlueDisabled:
.CrawlUpMiddleMovement3_BlueEnabled_RedDisabled:
	step_up
	step_end

.CrawlUpMiddleMovement2_BlueEnabled:
rept 5
	step_left
endr
	step_end

.CrawlUpMiddleMovement3_BlueEnabled_RedEnabled:
	half_step_up
rept 4
	step_left
endr
	half_step_up
	step_end

.CrawlUpRightMovement1:
	step_up
rept 5
	step_left
endr
	half_step_up
rept 4
	step_left
endr
	step_up
	step_end

.CrawlUpRightMovement2_RedEnabled:
rept 4
	step_right
endr
.CrawlUpRightMovement2_RedDisabled:
	half_step_up
	step_end

.CrawlDownLeftMovement_RedDisabled:
	step_down
	half_step_down
rept 4
	step_right
endr
	half_step_down
rept 5
	step_right
endr
	step_down
	step_end

.CrawlDownLeftMovement_RedEnabled_BlueDisabled:
	half_step_down
rept 4
	step_right
endr
	step_down
rept 4
	step_left
endr
	step_down
	half_step_down
	step_end

.CrawlDownLeftMovement_RedEnabled_BlueEnabled:
	half_step_down
rept 4
	step_right
endr
	half_step_down
rept 5
	step_right
endr
	step_down
rept 5
	step_left
endr
	step_down
	step_end

.CrawlDownMiddleMovement_RedEnabled:
	half_step_down
rept 4
	step_left
endr
	step_down
rept 4
	step_right
endr
	half_step_down
rept 5
	step_right
endr
	step_down
	step_end

.CrawlDownMiddleMovement_RedDisabled_BlueEnabled:
	step_down
rept 5
	step_right
endr
	step_down
rept 5
	step_left
endr
	step_down
	step_end

.CrawlDownMiddleMovement_RedDisabled_BlueDisabled:
	step_down
	half_step_down
rept 4
	step_left
endr
	step_down
	half_step_down
	step_end

.CrawlDownRightMovement_BlueEnabled:
	step_down
rept 5
	step_left
endr
	half_step_down
rept 4
	step_left
endr
	step_down
	half_step_down
	step_end

.CrawlDownRightMovement_BlueDisabled:
	step_down
	step_down
rept 5
	step_left
endr
	step_down
	step_end
