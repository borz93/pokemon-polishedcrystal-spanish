OlivineGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
	object_event  3, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymGentlemanPreston, EVENT_OLIVINE_GYM_JASMINE
	object_event  6,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymLassConnie, EVENT_OLIVINE_GYM_JASMINE

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftruefwd .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	givebadge MINERALBADGE, JOHTO_REGION
	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setmapscene ROUTE_42, SCENE_ROUTE42_LYRA
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue_jumpopenedtext Jasmine_GoodLuck
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegivetmhm TM_IRON_TAIL
	setevent EVENT_GOT_TM23_IRON_TAIL
	jumpthisopenedtext

	text "…Podrías usar esa"
	line "MT para enseñar"
	cont "Cola Férrea."
	done

OlivineGymGuyScript:
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer OlivineGymGuyWinText
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse_jumptextfaceplayer OlivineGymGuyPreText
	jumpthistextfaceplayer

	text "Yasmina usa el"
	line "tipo Acero,"
	cont "recién"
	cont "descubierto."

	para "No sé mucho sobre"
	line "él."
	done

OlivineGymLassConnie:
	trainer 0, 0, EVENT_SPOKE_TO_LASS_CONNIE, .SeenText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer .AfterText
	jumpthistextfaceplayer

.SeenText:
	text "Jeje… Sé lo"
	line "capaz que eres"

	para "por lo del Faro."

	para "¡Es hora de que"
	line "se lo demuestres"
	cont "a Yasmina!"

	para "¡Buena suerte!"
	done

.AfterText:
	text "Eres increíble…"
	line "Deberías apuntar"

	para "aún más alto, con"
	line "ese potencial."

	para "¿Has ido a Pueblo"
	line "Caoba?"
	done

OlivineGymGentlemanPreston:
	trainer 0, 0, EVENT_SPOKE_TO_GENTLEMAN_PRESTON, .SeenText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_JASMINE
	iftrue_jumptextfaceplayer .AfterText
	jumpthistextfaceplayer

.SeenText:
	text "Sabía que"
	line "vendrías aquí."

	para "Gracias por"
	line "ayudar a la Líder"
	cont "de Gimnasio,"

	para "pero el combate es"
	line "otro asunto."

	para "¡Adelante!"
	done

.AfterText:
	text "¡Impresionante!"
	line "Deberías ganar"

	para "más Medallas con"
	line "esa habilidad."
	done

OlivineGymStatue:
	gettrainername JASMINE, 1, STRING_BUFFER_4
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftruefwd .Returned
	jumpstd gymstatue0
.Returned
	checkflag ENGINE_MINERALBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten
	readvar VAR_BADGES
	ifgreater 13, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

Jasmine_SteelTypeIntro:
	text "…Gracias por tu"
	line "ayuda en el"
	cont "Faro…"

	para "Pero esto es"
	line "distinto. Permite"

	para "que me presente."

	para "Soy Yasmina, Líder"
	line "de Gimnasio. Uso"
	cont "el tipo Acero."

	para "…¿Sabes sobre el"
	line "tipo Acero?"

	para "Es muy duro, frío,"
	line "afilado y muy"
	cont "fuerte."

	para "…Um… ¿Puedo"
	line "empezar?"
	done

Jasmine_BetterTrainer:
	text "…Eres mejor"
	line "entrenador que yo,"

	para "tanto en"
	line "habilidad como en"
	cont "bondad."

	para "De acuerdo con las"
	line "reglas de la Liga,"

	para "te otorgo esta"
	line "Medalla."
	done

Jasmine_BadgeSpeech:
	text "Con esa Medalla,"
	line "todos los #mon"

	para "hasta <LV>70,"
	line "incluso"
	cont "intercambiados, te"
	cont "obedecerán sin"
	cont "cuestionarlo."

	para "…Um… Toma esto"
	line "también, por"
	cont "favor…"
	done

Jasmine_GoodLuck:
	text "Um… No sé cómo"
	line "decir esto, pero"
	cont "buena suerte…"
	done

OlivineGymGuyWinText:
	text "Eso fue"
	line "impresionante."

	para "¿El tipo Acero,"
	line "eh?"

	para "¡Fue un encuentro"
	line "cercano de un tipo"
	cont "desconocido!"
	done

OlivineGymGuyPreText:
	text "Yasmina, la Líder"
	line "de Gimnasio, está"
	cont "en el Faro."

	para "Está cuidando a un"
	line "#mon enfermo."

	para "Un entrenador"
	line "fuerte debe ser"
	cont "compasivo."
	done
