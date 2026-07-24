Route37_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SunnyCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_JUMPTEXT, Route37SignText
	bg_event  4,  2, BGEVENT_ITEM + ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

	def_object_events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event  6, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil1, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil2, -1
	object_event 14, 11, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicGreg, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCallie, -1
	object_event  9,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassandra, -1
	fruittree_event 13,  5, FRUITTREE_ROUTE_37_1, RED_APRICORN, PAL_NPC_RED
	fruittree_event 16,  5, FRUITTREE_ROUTE_37_2, BLU_APRICORN, PAL_NPC_BLUE
	fruittree_event 15,  7, FRUITTREE_ROUTE_37_3, BLK_APRICORN, PAL_NPC_BLACK

	object_const_def
	const ROUTE37_SUNNY

SunnyCallback:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

GenericTrainerTwinsToriandtil1:
	generictrainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil1SeenText, TwinsToriandtil1BeatenText

	text "Til: Sé lo que mi"
	line "hermana y mis"

	para "#mon están"
	line "pensando."
	done

GenericTrainerTwinsToriandtil2:
	generictrainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil2SeenText, TwinsToriandtil2BeatenText

	text "Tori: Compartimos"
	line "los mismos"
	cont "sentimientos que"
	cont "nuestros #mon."
	done

GenericTrainerPsychicGreg:
	generictrainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText

	text "Dormir o"
	line "paralizar a los"
	cont "#mon son buenas"
	cont "técnicas de"
	cont "combate."
	done

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftruefwd SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftruefwd .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	writetext SunnyGivesGiftText
	promptbutton
	verbosegiveitem MAGNET
	iffalsefwd SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	jumpthisopenedtext

	text "Dominga: Esa"
	line "cosa…"

	para "Um…"

	para "…¿Qué era ahora…?"

	para "…"

	para "¡Oh! ¡Ya recuerdo!"

	para "Un #mon que"
	line "conozca"
	cont "movimientos"
	cont "Eléctricos debería"
	cont "llevarlo."

	para "¡Mi hermana Luna"
	line "dijo que potencia"
	cont "los movimientos"
	cont "Eléctricos!"
	done

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	endtext

SunnyNotSundayScript:
	jumpthisopenedtext

	text "Dominga: ¿No es"
	line "hoy domingo?"
	cont "Um… ¡lo olvidé!"
	done

GenericTrainerBeautyCallie:
	generictrainer BEAUTY, CALLIE, EVENT_BEAT_BEAUTY_CALLIE, BeautyCallieSeenText, BeautyCallieBeatenText

	text "¡Vaya, eres linda"
	line "y hábil también!"
	done

TrainerBeautyCassandra:
	trainer BEAUTY, CASSANDRA, EVENT_BEAT_BEAUTY_CASSANDRA, BeautyCassandraSeenText, BeautyCassandraBeatenText, 0, .Script, TRAINERPAL_DARK_BEAUTY

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "La gente como tú"
	line "es hábil aun"

	para "siendo joven…"
	done

TwinsToriandtil1SeenText:
	text "Til: ¡Tori y yo"
	line "estamos juntas en"
	cont "esto!"
	done

TwinsToriandtil1BeatenText:
TwinsToriandtil2BeatenText:
	text "Til y Tori: Nnn…"
	line "Muy fuerte."
	done

TwinsToriandtil2SeenText:
	text "Tori: ¡Til y yo"
	line "estamos juntas en"
	cont "esto!"
	done

PsychicGregSeenText:
	text "Los #mon no"
	line "pueden hacer nada"
	cont "si están"
	cont "dormidos."

	para "¡Te mostraré qué"
	line "tan aterrador es"
	cont "eso!"
	done

PsychicGregBeatenText:
	text "Perdí. Qué"
	line "triste…"
	done

MeetSunnyText:
	text "Dominga: ¡Hola!"

	para "¡Soy Dominga, así"
	line "que hoy debe ser"
	cont "domingo!"
	done

SunnyGivesGiftText:
	text "¡Me dijeron que te"
	line "diera esto si te"
	cont "veía!"
	done


SunnySundayText:
	text "Dominga: Mis"
	line "hermanas y"
	cont "hermanos son"
	cont "Luna, Marta,"
	cont "Marcial, Julio,"
	cont "Vera y Sabas."

	para "¡Todos son mayores"
	line "que yo!"
	done


BeautyCallieSeenText:
	text "Oh, ¡eres un"
	line "entrenador"
	cont "pequeñ y lindo!"

	para "¿Por qué no"
	line "combates conmigo?"
	done

BeautyCallieBeatenText:
	text "Eres buena…"
	done

BeautyCassandraSeenText:
	text "Oye, oye,"
	line "¡entrenador"
	cont "joven!"

	para "¿No quieres"
	line "combatir conmigo?"
	done

BeautyCassandraBeatenText:
	text "Vaya, eres"
	line "fuerte…"
	done

Route37SignText:
	text "Ruta 37"
	done
