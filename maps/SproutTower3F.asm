SproutTower3F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER
	scene_const SCENE_SPROUTTOWER3F_NOOP

	def_callbacks

	def_warp_events
	warp_event  8, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event  9,  9, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER, SproutTower3FRivalScene

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPTEXT, SproutTower3FStatueText
	bg_event  9,  1, BGEVENT_JUMPTEXT, SproutTower3FStatueText
	bg_event  7,  0, BGEVENT_JUMPTEXT, SproutTower3FPaintingText
	bg_event  8,  0, BGEVENT_JUMPTEXT, SproutTower3FPaintingText
	bg_event  3, 15, BGEVENT_JUMPTEXT, SproutTower3FStatueText
	bg_event 12, 15, BGEVENT_JUMPTEXT, SproutTower3FStatueText

	def_object_events
	object_event  8,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
	object_event  6, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageJin, -1
	object_event  6,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageTroy, -1
	object_event  9, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageNeal, -1
	object_event  8,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ElderLiScript, -1
	itemball_event  4, 14, POTION, 1, EVENT_SPROUT_TOWER_3F_POTION
	itemball_event 12,  1, ESCAPE_ROPE, 1, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE

	object_const_def
	const SPROUTTOWER3F_RIVAL

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	playsound SFX_TACKLE
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applyonemovement SPROUTTOWER3F_RIVAL, step_up
	showtext SproutTowerElderLecturesRivalText
	showemote EMOTE_SHOCK, SPROUTTOWER3F_RIVAL, 15
	turnobject SPROUTTOWER3F_RIVAL, DOWN
	pause 15
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext SproutTowerRivalOnlyCareAboutStrongText
	turnobject SPROUTTOWER3F_RIVAL, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_RIVAL
	waitsfx
	special Special_FadeInQuickly
	setscene SCENE_SPROUTTOWER3F_NOOP
	special RestartMapMusic
	end

ElderLiScript:
	checkevent EVENT_GOT_TM70_FLASH
	iftrue_jumptextfaceplayer SageLiAfterBattleText
	faceplayer
	showtext SageLiSeenText
	winlosstext SageLiBeatenText, 0
	loadtrainer ELDER, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegivetmhm TM_FLASH
	setevent EVENT_GOT_TM70_FLASH
	setevent EVENT_BEAT_ELDER_LI
	jumpthisopenedtext

	text "Destello ilumina"
	line "incluso los"
	cont "lugares más"
	cont "oscuros."

	para "No necesitas"
	line "enseñárselo a tus"

	para "#mon a menos"
	line "que quieras usar"
	cont "Destello en"
	cont "combate."

	para "Solo pulsa A en la"
	line "oscuridad, y si"

	para "alguno de tus"
	line "#mon sabe usar"
	cont "Destello, lo hará."
	done

GenericTrainerSageJin:
	generictrainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText

	text "A medida que los"
	line "#mon se"
	cont "fortalecen, el"
	cont "entrenador"
	cont "también."

	para "No, espera. A"
	line "medida que el"

	para "entrenador se"
	line "fortalece, los"
	cont "#mon también."
	done

GenericTrainerSageTroy:
	generictrainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText

	text "No queda lejos"
	line "hasta el Anciano."
	done

GenericTrainerSageNeal:
	generictrainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText

	text "Que haya luz en tu"
	line "camino."
	done

SproutTower3FPlayerApproachesRivalMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

SproutTower3FRivalLeavesElderMovement:
	step_right
	step_down
	step_end

SproutTowerElderLecturesRivalText:
	text "Anciano: Eres"
	line "realmente hábil"
	cont "como entrenador."

	para "Como prometí, aquí"
	line "tienes tu MT."

	para "Pero déjame decir"
	line "algo: deberías"

	para "tratar mejor a tus"
	line "#mon."

	para "Tu forma de"
	line "combatir es"
	cont "demasiado dura."

	para "Los #mon no son"
	line "herramientas de"
	cont "guerra…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…¡Já!"

	para "Dice ser el"
	line "Anciano pero es"
	cont "débil."

	para "Es de esperar."

	para "Nunca perdería"
	line "contra tontos que"

	para "parlotean sobre"
	line "ser buenos con los"
	cont "#mon."

	para "Solo me importan"
	line "los #mon"
	cont "fuertes que pueden"
	cont "ganar."

	para "No me importan en"
	line "absoluto los"
	cont "#mon débiles."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> usó"
	line "¡Cuerda Huida!"
	done

SageLiSeenText:
	text "¡Qué bien que"
	line "hayas venido!"

	para "La Torre"
	line "Bellsprout es un"
	cont "lugar de"
	cont "entrenamiento."

	para "Personas y #mon"
	line "ponen a prueba sus"

	para "lazos para"
	line "construir juntos"
	cont "un futuro"
	cont "brillante."

	para "Yo soy la prueba"
	line "final."

	para "Permíteme"
	line "comprobar los"

	para "¡lazos entre tus"
	line "#mon y tú!"
	done

SageLiBeatenText:
	text "¡Ah, excelente!"
	done

SageLiTakeThisFlashText:
	text "Tú y tus #mon"
	line "no deberíais tener"

	para "problema usando"
	line "este movimiento."

	para "Toma esta MT de"
	line "Destello."
	done

SageLiAfterBattleText:
	text "Espero que"
	line "aprendas y crezcas"
	cont "en tu viaje."
	done

SageJinSeenText:
	text "¡Entreno para"
	line "hallar la"
	cont "iluminación en los"
	cont "#mon!"
	done

SageJinBeatenText:
	text "Mi entrenamiento"
	line "está incompleto…"
	done

SageTroySeenText:
	text "Veamos cuánto"
	line "confías en tus"
	cont "#mon."
	done

SageTroyBeatenText:
	text "Sí, ¡tu confianza"
	line "es real!"
	done

SageNealSeenText:
	text "La MT del Anciano"
	line "ilumina incluso la"
	cont "oscuridad total."
	done

SageNealBeatenText:
	text "¡Es mi cabeza la"
	line "que brilla!"
	done

SproutTower3FPaintingText:
	text "Es una pintura"
	line "poderosa de un"
	cont "Bellsprout."
	done

SproutTower3FStatueText:
	text "Una estatua"
	line "#mon…"

	para "Parece muy"
	line "distinguida."
	done
