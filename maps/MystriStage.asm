MystriStage_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_MYSTRISTAGE_NOOP
	scene_const SCENE_MYSTRISTAGE_ARCEUS_EVENT

	def_callbacks

	def_warp_events
	warp_event  6, 19, SINJOH_RUINS, 1
	warp_event  7, 19, SINJOH_RUINS, 1

	def_coord_events
	coord_event  6, 11, SCENE_MYSTRISTAGE_ARCEUS_EVENT, MystriStageTrigger1Script
	coord_event  7, 11, SCENE_MYSTRISTAGE_ARCEUS_EVENT, MystriStageTrigger2Script

	def_bg_events

	def_object_events
	object_event  6, 10, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MystriStageCynthiaSafeguardScript, EVENT_LISTENED_TO_CYNTHIA_INTRO
	object_event  7,  7, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MystriStageCynthiaScript, EVENT_MYSTRI_STAGE_CYNTHIA
	object_event  6,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, EGG, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, MystriStageEggScript, EVENT_MYSTRI_STAGE_EGG

	object_const_def
	const MYSTRISTAGE_CYNTHIA1
	const MYSTRISTAGE_CYNTHIA2
	const MYSTRISTAGE_EGG

MystriStageTrigger2Script:
	applyonemovement PLAYER, step_up
MystriStageTrigger1Script:
	faceobject PLAYER, MYSTRISTAGE_CYNTHIA1
	pause 10
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA1, 15
	pause 10
	faceobject MYSTRISTAGE_CYNTHIA1, PLAYER
MystriStageCynthiaSafeguardScript:
	showtext MystriStageCynthiaIntroText
	follow MYSTRISTAGE_CYNTHIA1, PLAYER
	applymovement MYSTRISTAGE_CYNTHIA1, MystriStageMovementData_CynthiaStepsUp
	stopfollow
	turnobject MYSTRISTAGE_CYNTHIA1, LEFT
	turnobject PLAYER, RIGHT
	showtext MystriStageCynthiaSpeechText
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA1, 15
	showtext MystriStageCynthiaLeadText2
	pause 10
	appear MYSTRISTAGE_CYNTHIA2
	disappear MYSTRISTAGE_CYNTHIA1
	setlasttalked MYSTRISTAGE_CYNTHIA2
	setevent EVENT_LISTENED_TO_CYNTHIA_INTRO
	setscene SCENE_MYSTRISTAGE_NOOP
	; fallthrough

MystriStageCynthiaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CYNTHIA
	iftruefwd MystriStageBeatCynthiaScript
	writetext MystriStageCynthiaIdeaText
	waitbutton
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse_jumpopenedtext MystriStageCynthiaNotNowText
	writetext MystriStageCynthiaChallengeText
	yesorno
	iffalse_jumpopenedtext MystriStageCynthiaNoText
	writetext MystriStageCynthiaYesText
	waitbutton
	closetext
	winlosstext MystriStageCynthiaWinText, 0
	setlasttalked MYSTRISTAGE_CYNTHIA2
	loadtrainer CYNTHIA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	opentext
MystriStageBeatCynthiaScript:
	checkevent EVENT_GOT_WISE_GLASSES_FROM_CYNTHIA
	iftrue_jumpopenedtext MystriStageCynthiaFinalText
	writetext MystriStageCynthiaItemText
	waitbutton
	verbosegiveitem WISE_GLASSES
	iffalse_endtext
	setevent EVENT_GOT_WISE_GLASSES_FROM_CYNTHIA
	writetext MystriStageCynthiaAfterText
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA2, 15
	special Special_FadeOutMusic
	pause 15
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	pause 15
	playsound SFX_UNKNOWN_60
	waitsfx
	pause 20
	playsound SFX_METRONOME
	waitsfx
	special Special_FadeInQuickly
	pause 10
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playsound SFX_PROTECT
	waitsfx
	special Special_FadeInQuickly
	pause 10
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	pause 20
	playsound SFX_EGG_HATCH
	waitsfx
	appear MYSTRISTAGE_EGG
	faceplayer
	pause 30
	special RestartMapMusic
	special Special_FadeInQuickly
	pause 20
	turnobject MYSTRISTAGE_CYNTHIA2, DOWN
	pause 40
	jumpthistextfaceplayer

	text "Cynthia: ¿Podría"
	line "ser… un Huevo?"

	para "¿Acabamos de"
	line "presenciar el"

	para "momento exacto en"
	line "que un Huevo llegó"
	cont "a este mundo?"

	para "¿Un momento que"
	line "nadie ha visto"
	cont "jamás?"
	done

MystriStageEggScript:
	special GiveMystriEgg
	iffalse_jumptext MystriStageNoRoomText
	disappear MYSTRISTAGE_EGG
	opentext
	writetext MystriStageEggText
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .InParty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
.InParty
	waitendtext

MystriStageCynthiaIntroText:
	text "Me llamo"
	line "Cynthia. Soy"
	cont "entrenadora"
	cont "#mon."

	para "¿Y tú eres?"

	para "…Ya veo. El poder"
	line "de los Unown te"
	cont "trajo aquí."
	done

MystriStageCynthiaSpeechText:
	text "Cynthia: Estas son"
	line "las Ruinas de"
	cont "Sinjoh."

	para "Hace mucho"
	line "tiempo… vino gente"

	para "de Sinnoh, mi"
	line "región natal, a"
	cont "vivir aquí."

	para "Debieron añorar su"
	line "hogar,"

	para "y construyeron"
	line "este templo para"
	cont "honrar sus"
	cont "tradiciones."

	para "Estamos sobre el"
	line "Estrado Mistrío."

	para "La gente"
	line "celebraba aquí con"
	cont "música y baile."

	para "Cynthia: Estudio"
	line "mitos sobre"

	para "sitios antiguos"
	line "como las Ruinas de"
	cont "Sinjoh."

	para "Uno afirma que"
	line "este estrado está"

	para "imbuido con el"
	line "poder de la"
	cont "creación."

	para "Habla de cuando"
	line "“el líder entra"

	para "por fin en el"
	line "Estrado Mistrío…”"
	done

MystriStageCynthiaLeadText2:
	text "Cynthia: ¿Qué?"
	line "¿Leíste esa frase"

	para "en las Ruinas"
	line "Alfa?"

	para "Eso es muy"
	line "intrigante."

	para "¿Podría “el líder”"
	line "ser un #mon?"
	cont "¿O una persona?"
	done

MystriStageCynthiaIdeaText:
	text "Cynthia: …Tengo"
	line "una idea. Llámalo"

	para "intuición de"
	line "entrenadora."

	para "Cuando tú y yo"
	line "combatamos en este"

	para "estrado, algo"
	line "sucederá."
	done

MystriStageCynthiaNotNowText:
	text "Cynthia: Pero no"
	line "creo que debamos"

	para "combatir ahora."
	line "No estás lista."

	para "Vuelve cuando"
	line "hayas vencido al"
	cont "Alto Mando."
	done

MystriStageCynthiaChallengeText:
	text "Cynthia: ¿Estás"
	line "preparada para ser"
	cont "mi rival?"
	done

MystriStageCynthiaNoText:
	text "Cynthia: Vuelve"
	line "cuando estés"
	cont "lista."
	done

MystriStageCynthiaYesText:
	text "Cynthia: Antes de"
	line "sacar a mi"
	cont "#mon,"

	para "mi corazón siempre"
	line "empieza a"
	cont "acelerarse…"
	done

MystriStageCynthiaWinText:
	text "No recuerdo la"
	line "última vez que me"

	para "¡superaron así!"
	done

MystriStageCynthiaItemText:
	text "Cynthia: ¡Eso fue"
	line "más allá de mis"
	cont "expectativas!"

	para "¡Qué combate tan"
	line "excepcional!"

	para "Por favor, toma"
	line "este objeto. Creo"

	para "que sabrás usarlo"
	line "bien."
	done

MystriStageCynthiaAfterText:
	text "Cynthia: ¿Pero"
	line "nuestro combate"
	cont "afectó al Estrado"
	cont "Mistrío?"
	done


MystriStageCynthiaFinalText:
	text "Cynthia: Un Huevo"
	line "es la cuna de todo"
	cont "ser."

	para "El propio planeta"
	line "es un Huevo en"
	cont "cierto sentido…"

	para "La vida que viene"
	line "de un Huevo"
	cont "llegará a su fin"

	para "a su debido"
	line "tiempo… para"
	cont "comenzar de"
	cont "nuevo…"
	done

MystriStageEggText:
	text "<PLAYER> encontró"
	line "¡un Huevo"
	cont "misterioso!"
	done

MystriStageNoRoomText:
	text "No tienes"
	line "espacio para"
	cont "¡esto, ni en tu"
	cont "Caja!"
	done

MystriStageMovementData_CynthiaStepsUp:
	step_up
	step_up
	step_up
	step_right
	step_end
