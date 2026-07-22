OlivineLighthouse3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 14, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse3FBattleGirlEmy, -1
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanPreston, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  3,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperTheo, -1
	itemball_event  8,  2, ETHER, 1, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER

	object_const_def
	const OLIVINELIGHTHOUSE3F_COOLTRAINER_F

OlivineLighthouse3FBattleGirlEmy:
	checkevent EVENT_GOT_PROTECT_PADS_FROM_LIGHTHOUSE_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_BATTLE_GIRL_EMY
	iftruefwd .Beaten
	opentext
	checkevent EVENT_BEAT_GENTLEMAN_ALFRED
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_HUEY
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_THEO
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_GENTLEMAN_PRESTON
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_TERRELL
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_LASS_CONNIE
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_KENT
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_DENIS
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_ERNEST
	iffalse_jumpopenedtext .IntroText
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked OLIVINELIGHTHOUSE3F_COOLTRAINER_F
	loadtrainer BATTLE_GIRL, EMY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BATTLE_GIRL_EMY
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem PROTECT_PADS
	iffalse_endtext
	setevent EVENT_GOT_PROTECT_PADS_FROM_LIGHTHOUSE_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Uno del Alto"
	line "Mando, Bruno, es"
	cont "luchador como yo."

	para "Llegar a ser tan"
	line "fuerte como él…"
	cont "ese es mi"
	cont "objetivo."
	done

.IntroText:
	text "Como Luchadora,"
	line "entreno"
	cont "intensamente cada"
	cont "día."

	para "Hay algo intenso"
	line "en ti."

	para "¿Puedes vencer a"
	line "todos los"
	cont "entrenadores de"
	cont "este Faro?"

	para "Si puedes,"
	line "combatiré"
	cont "contigo."
	done

.QuestionText:
	text "Así que venciste"
	line "toda esta torre."

	para "Entonces te queda"
	line "un rival: ¡la"
	cont "propia alumna de"
	cont "Aníbal, yo!"

	para "¿Listo para"
	line "combatir?"
	done

.RefusedText:
	text "De vuelta a"
	line "entrenar sola…"
	done

.SeenText:
	text "Desde detrás de"
	line "mis Almoh.Protec,"
	cont "¡ataco! ¡Ki-yaah!"
	done

.BeatenText:
	text "¡Rompiste mi"
	line "defensa!"
	done

.AfterText1:
	text "¡Tu equipo es"
	line "formidable!"

	para "Pero puedes ser"
	line "aún más fuerte."

	para "Estas Almoh.Protec"
	line "te permitirán"

	para "hacer contacto con"
	line "el rival sin"
	cont "recibir daño."
	done

TrainerBird_keeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, Bird_keeperTheoSeenText, Bird_keeperTheoBeatenText, 0, Bird_keeperTheoScript

Bird_keeperTheoScript:
	endifjustbattled
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer Bird_keeperTheoFinalText
	jumpthistextfaceplayer

	text "¿Cómo diablos se"
	line "sube por ahí?"

	para "Quiero visitar al"
	line "#mon enfermo,"

	para "pero no puedo"
	line "subir…"
	done

GenericTrainerGentlemanPreston:
	generictrainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText

	text "Yasmina solía usar"
	line "#mon tipo Roca"
	cont "como Onix."
	done

GenericTrainerSailorTerrell:
	generictrainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText

	text "Cada vez que"
	line "vuelvo a Olivo,"
	cont "visito el"
	cont "Gimnasio."

	para "El tipo de #mon"
	line "de la Líder ha"

	para "cambiado sin que"
	line "me diera cuenta."
	done

Bird_keeperTheoSeenText:
	text "¿Por qué estás"
	line "aquí? ¿Solo vas a"

	para "mirar"
	line "boquiabierto? ¡Te"
	cont "sugiero que te"
	cont "vayas!"
	done

Bird_keeperTheoBeatenText:
	text "De verdad te"
	line "importa…"
	done

Bird_keeperTheoFinalText:
	text "¿Cómo diablos se"
	line "sube por ahí?"

	para "Oí que el #mon"
	line "enfermo está"
	cont "mejor, pero no"
	cont "puedo subir…"
	done

SailorTerrellSeenText:
	text "Los marineros son"
	line "amables y fuertes"
	cont "a la vez. ¿Y tú?"
	done

SailorTerrellBeatenText:
	text "Eres amable y"
	line "fuerte a la vez…"
	done

GentlemanPrestonSeenText:
	text "Viajo por el mundo"
	line "para entrenar a"
	cont "mis #mon."
	cont "Quiero combatir"
	cont "contigo."
	done

GentlemanPrestonBeatenText:
	text "…suspiro… debo"
	line "entrenar más…"
	done
