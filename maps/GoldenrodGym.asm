GoldenrodGym_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_GOLDENRODGYM_NOOP
	scene_const SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  9,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath1, -1
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCathy, -1
	object_event  9,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath2, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1

	object_const_def
	const GOLDENRODGYM_LASS2

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftruefwd .FightDone
	showtext WhitneyBeforeText
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CATHY
	setevent EVENT_BEAT_SR_AND_JR_JO_AND_CATH
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalsefwd .StoppedCrying
	jumpthisopenedtext

	text "¡Buaaaaa!"

	para "¡Buaaaaa!"

	para "…Sniff, hip…"
	line "…¡Eres malo!"
	done

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue_jumpopenedtext WhitneyGoodCryText
	checkflag ENGINE_PLAINBADGE
	iftruefwd .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	givebadge PLAINBADGE, JOHTO_REGION
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegivetmhm TM_ATTRACT
	setevent EVENT_GOT_TM45_ATTRACT
	jumpthisopenedtext

	text "¡Es Atracción!"
	line "Aprovecha al"

	para "máximo el"
	line "encanto de un"
	cont "#mon."

	para "¿No es perfecto"
	line "para una"
	cont "monada como yo? ♥"
	done

TrainerLassCathy:
	trainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathySeenText, LassCathyBeatenText, 0, .Script, TRAINERPAL_DARK_LASS

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¿Mis #mon creen"
	line "que soy mona?"
	done

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, JoWalksUpMovement
	turnobject PLAYER, DOWN
	showtext JoWhitneyCriesText
	applymovement GOLDENRODGYM_LASS2, JoWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

GenericTrainerSrandjrJoandcath1:
	generictrainer SR_AND_JR, JOANDCATH1, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath1SeenText, SrandjrJoandcath1BeatenText

	text "Jo: Estoy"
	line "ayudando a mi"
	cont "junior Cath a"

	para "ganar una Medalla"
	line "de Blanca."

	para "Está mejorando"
	line "poco a poco."
	done

GenericTrainerSrandjrJoandcath2:
	generictrainer SR_AND_JR, JOANDCATH2, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath2SeenText, SrandjrJoandcath2BeatenText

	text "Cath: Sigo"
	line "perdiendo contra"
	cont "Blanca. Es"
	cont "deprimente."

	para "¡Estoy bien! Si"
	line "pierdo, ¡lo"
	cont "intentaré más"
	cont "duro la próxima"
	cont "vez!"
	done

GenericTrainerBeautyVictoria:
	generictrainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText

	text "Vaya, ¡debes ser"
	line "buena para"
	cont "vencerme! ¡Sigue"
	cont "así!"
	done

GenericTrainerBeautySamantha:
	generictrainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText

	text "Le enseñé a Meowth"
	line "movimientos para"
	cont "enfrentar"
	cont "cualquier tipo…"
	done

GoldenrodGymGuyScript:
	checkevent EVENT_BEAT_WHITNEY
	iftrue_jumptextfaceplayer GoldenrodGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Futuro"
	line "Campeón!"

	para "Este Gimnasio es"
	line "hogar de"
	cont "entrenadores de"
	cont "#mon tipo"
	cont "Normal."

	para "Te recomiendo usar"
	line "#mon de tipo"
	cont "Lucha."

	para "Pero cuidado: los"
	line "#mon tipo Hada"

	para "resisten los"
	line "movimientos de"
	cont "tipo Lucha,"

	para "¡y también se usan"
	line "aquí!"
	done

GoldenrodGymStatue:
	gettrainername WHITNEY, 1, STRING_BUFFER_4
	checkflag ENGINE_PLAINBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 10, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

JoWalksUpMovement:
	step_left
	turn_head_up
	step_end

JoWalksAwayMovement:
	step_right
	turn_head_left
	step_end

WhitneyBeforeText:
	text "¡Hola! ¡Soy"
	line "Blanca!"

	para "A todos les"
	line "gustaban los"
	cont "#mon, ¡así que"
	cont "a mí también!"

	para "¡Los #mon son"
	line "supermonos!"

	para "¿Quieres"
	line "combatir? Te"
	cont "aviso, ¡soy"
	cont "buena!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Sob…"

	para "…¡Buaaaaaaa!"
	line "¡Eres malo!"

	para "¡No deberías ser"
	line "tan serio! ¡Eres"
	cont "un crío!"
	done


WhitneyWhatDoYouWantText:
	text "…Sniff…"

	para "¿Qué? ¿Qué"
	line "quieres? ¿Una"
	cont "Medalla?"

	para "Ah, cierto."
	line "Se me olvidó."
	cont "Toma la Medalla"
	cont "Planicie."
	done

WhitneyPlainBadgeText:
	text "La Medalla"
	line "Planicie deja"
	cont "que tus"

	para "#mon usen"
	line "Fuerza fuera de"
	cont "combate."

	para "Oh, ¡también"
	line "puedes quedarte"
	cont "esto!"
	done

WhitneyGoodCryText:
	text "Ah, ¡ese fue un"
	line "buen llanto!"

	para "¡Vuelve a"
	line "visitarme! ¡Adiós!"
	done

LassCathySeenText:
	text "No dejes que el"
	line "aspecto mono de"

	para "mis #mon te"
	line "engañe. ¡Pueden"
	cont "darte una paliza!"
	done

LassCathyBeatenText:
	text "Vaya… Pensé que"
	line "eras débil…"
	done

SrandjrJoandcath1SeenText:
	text "Jo: Si quieres"
	line "enfrentarte a"
	cont "Blanca,"

	para "¡tendrás que"
	line "pasar por mí!"

	para "Cath, ¿sonó eso"
	line "guay?"
	done

SrandjrJoandcath1BeatenText:
	text "Jo: ¡Perder no es"
	line "nada guay!"
	done

SrandjrJoandcath2SeenText:
	text "Cath: Intento"
	line "vencer a Blanca,"
	cont "pero mi senior y"

	para "yo podemos"
	line "¡vencerte primero!"
	done

SrandjrJoandcath2BeatenText:
	text "Cath: Oh, ¡no,"
	line "no, no!"
	done

JoWhitneyCriesText:
	text "Oh, no. Hiciste"
	line "llorar a Blanca."

	para "Está bien. Parará"
	line "pronto. Siempre"

	para "llora cuando"
	line "pierde."
	done

BeautyVictoriaSeenText:
	text "Oh, ¡eres una"
	line "entrenadora"
	cont "mona! ♥"

	para "Me caes bien, pero"
	line "¡no me contendré!"
	done

BeautyVictoriaBeatenText:
	text "Veamos… Vaya,"
	line "¿ya se acabó?"
	done

BeautySamanthaSeenText:
	text "¡Da todo lo que"
	line "tienes, o te"
	cont "venceré!"
	done

BeautySamanthaBeatenText:
	text "¡No! Oh, Meowth,"
	line "lo siento mucho."
	done

GoldenrodGymGuyWinText:
	text "¿Ganaste? ¡Genial!"
	line "Estaba ocupado"
	cont "admirando a las"
	cont "chicas de aquí."
	done
