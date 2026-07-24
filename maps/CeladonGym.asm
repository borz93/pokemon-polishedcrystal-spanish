CeladonGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassMichelle, -1
	object_event  2,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautyJulia, -1
	object_event  6,  5, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAroma_ladyDahlia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe2, -1

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_AROMA_LADY_DAHLIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	givebadge RAINBOWBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue_jumpopenedtext ErikaAfterBattleText
	writetext ErikaExplainTMText
	promptbutton
	verbosegivetmhm TM_GIGA_DRAIN
	setevent EVENT_GOT_TM19_GIGA_DRAIN
	jumpthisopenedtext

	text "Es Gigadrenado."

	para "Es un movimiento"
	line "maravilloso que"
	cont "absorbe la mitad"
	cont "del daño causado"
	cont "para curar a tu"
	cont "#mon."

	para "Utilízalo si te"
	line "complace…"
	done

GenericTrainerLassMichelle:
	generictrainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText

	text "¡Solo me despisté,"
	line "nada más!"
	done

GenericTrainerPicnickerTanya:
	generictrainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText

	text "Vaya, mira todas"
	line "tus Medallas. No"

	para "¡es de extrañar"
	line "que no pudiera"
	cont "ganar!"
	done

GenericTrainerBeautyJulia:
	generictrainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText

	text "¿Cómo hago para"
	line "ser tan elegante"
	cont "como Erika?"
	done

GenericTrainerAroma_ladyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, Aroma_ladyDahliaSeenText, Aroma_ladyDahliaBeatenText

	text "Gloom libera una"
	line "fragancia"
	cont "desagradable,"

	para "pero Erika sabe"
	line "convertirla en un"

	para "dulce perfume."
	done

GenericTrainerTwinsJoandzoe1:
	generictrainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText

	text "¡Erika nos"
	line "vengará!"
	done

GenericTrainerTwinsJoandzoe2:
	generictrainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText

	text "¡Erika es mucho,"
	line "mucho más fuerte!"
	done

CeladonGymStatue:
	gettrainername ERIKA, 1, STRING_BUFFER_4
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "Erika: Hola…"
	line "Qué tiempo tan"
	cont "agradable,"
	cont "¿Verdad?"

	para "Es tan"
	line "placentero…"

	para "…Me temo que"
	line "podría"
	cont "quedarme dormida…"

	para "Me llamo Erika."
	line "Soy la Líder del"
	cont "Gimnasio Azulona."

	para "…¿Oh? ¿Desde"
	line "Johto, dices? Qué"
	cont "amable…"

	para "Oh. Lo siento, no"
	line "me di cuenta de"

	para "que deseabas"
	line "retarme."

	para "Muy bien, pero no"
	line "pienso perder."
	done

ErikaBeatenText:
	text "Erika: ¡Oh!"
	line "Admito la"
	cont "derrota…"

	para "Eres"
	line "extraordinaria-"
	cont "mente fuerte…"

	para "Te daré la"
	line "Medalla Arcoíris…"
	done

ErikaExplainTMText:
	text "Erika: Ha sido un"
	line "combate delicioso."

	para "Me sentí"
	line "inspirada. Por"
	cont "favor, quiero que"
	cont "tengas esta MT."
	done


ErikaAfterBattleText:
	text "Erika: Perder deja"
	line "un regusto"
	cont "amargo…"

	para "Pero saber que hay"
	line "entrenadores"

	para "fuertes me anima a"
	line "mejorar…"
	done

LassMichelleSeenText:
	text "¿Crees que un"
	line "Gimnasio solo para"
	cont "chicas es raro?"
	done

LassMichelleBeatenText:
	text "¡Oh, puaj!"
	done

PicnickerTanyaSeenText:
	text "Oh, ¿Un combate?"
	line "Da un poco de"
	cont "miedo, ¡pero vale!"
	done

PicnickerTanyaBeatenText:
	text "Oh, ¿Eso es todo?"
	done

BeautyJuliaSeenText:
	text "¿Mirabas estas"
	line "flores o me"
	cont "mirabas a mí?"
	done

BeautyJuliaBeatenText:
	text "¡Qué molesto!"
	done

Aroma_ladyDahliaSeenText:
	text "Hay un aroma"
	line "intrigante a tu"
	cont "alrededor…"
	done

Aroma_ladyDahliaBeatenText:
	text "El desagradable"
	line "aroma de la"
	cont "derrota…"
	done

TwinsJoandzoe1SeenText:
	text "¡Te enseñaremos"
	line "movimientos"
	cont "#mon que Erika"
	cont "nos enseñó!"
	done

TwinsJoandzoe1BeatenText:
	text "Oh… Perdimos…"
	done

TwinsJoandzoe2SeenText:
	text "¡Vamos a proteger"
	line "a Erika!"
	done

TwinsJoandzoe2BeatenText:
	text "No pudimos ganar…"
	done
