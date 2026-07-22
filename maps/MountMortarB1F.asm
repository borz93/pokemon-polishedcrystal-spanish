MountMortarB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM + MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 11, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FHikerScript, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	strengthboulder_event  9, 10
	itemball_event 29, 12, HYPER_POTION, 1, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	itemball_event  4, 16, CARBOS, 1, EVENT_MOUNT_MORTAR_B1F_CARBOS
	itemball_event 34, 24, PROTECTOR, 1, EVENT_MOUNT_MORTAR_B1F_PROTECTOR
	itemball_event 32,  3, MAX_ETHER, 1, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	itemball_event 21, 26, PP_UP, 1, EVENT_MOUNT_MORTAR_B1F_PP_UP

MountMortarB1FHikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
	iftruefwd MountMortarB1FTutorDefenseCurlScript
	writetext MountMortarB1FHikerText
	waitbutton
	setevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
MountMortarB1FTutorDefenseCurlScript:
	writetext Text_MountMortarB1FTutorDefenseCurl
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MountMortarB1FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DEFENSE_CURL
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Me quedaré aquí"
	line "esperando."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Vaya, no tienes"
	line "una Hoja"
	cont "Plata."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Listo! Tu #mon"
	line "ya puede usar"
	cont "Rizo Defensa!"
	done

MountMortarB1FKiyoScript:
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue_jumptextfaceplayer MountMortarB1FKiyoGotTyrogueText
	faceplayer
	checkevent EVENT_BEAT_KIYO
	iftruefwd .BeatKiyo
	showtext MountMortarB1FKiyoIntroText
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer KARATE_KING, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIYO
.BeatKiyo:
	opentext
	writetext MountMortarB1FTyrogueRewardText
	promptbutton
	waitsfx
	givepoke TYROGUE, PLAIN_FORM, 10, NO_ITEM, PREMIER_BALL
	iffalse_jumpopenedtext MountMortarB1FKiyoFullPartyAndBoxText
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	jumpthisopenedtext

MountMortarB1FKiyoGotTyrogueText:
	text "Tyrogue es de"
	line "tipo Lucha."

	para "Evoluciona a"
	line "un #mon más"
	cont "fuerte."

	para "Sigue"
	line "esforzándote."
	cont "Yo también"
	cont "seguiré"
	cont "entrenando."

	para "¡Adiós!"
	done

MountMortarB1FHikerText:
	text "Mi #mon usó"
if DEF(FAITHFUL)
	line "Golpe Roca en"
else
	line "Demolición en"
endc
	cont "una roca,"

	para "pero no sufrió"
	line "daño."

	para "Resultó ser un"
	line "Geodude que usó"
	cont "¡Rizo Defensa!"
	done

Text_MountMortarB1FTutorDefenseCurl:
	text "Puedo enseñar a"
	line "tu #mon"

	para "Rizo Defensa por"
	line "una Hoja Plata."
	done


Text_MountMortarB1FTutorQuestion:
	text "¿Le enseño a tu"
	line "#mon"
	cont "Rizo Defensa?"
	done



MountMortarB1FKiyoIntroText:
	text "¡Eh!"

	para "¡Soy el Rey del"
	line "Karate!"

	para "¡Entreno solo"
	line "aquí en la"
	cont "oscuridad!"

	para "¡Tú!"
	line "¡Combate"
	cont "conmigo!"

	para "¡Hwaaarggh!"
	done

MountMortarB1FKiyoWinText:
	text "¡Waaaarggh!"
	line "¡Me han vencido!"
	done

MountMortarB1FTyrogueRewardText:
	text "Yo… Estoy"
	line "destrozado…"

	para "Mi entrenamiento"
	line "aún no basta…"

	para "Pero una derrota"
	line "es derrota."
	cont "Lo admito."

	para "Como prueba de"
	line "que me venciste,"
	cont "te daré un raro"
	cont "#mon de lucha."
	done

MountMortarB1FKiyoFullPartyAndBoxText:
	text "No tienes sitio"
	line "en tu equipo"
	cont "ni en tu Caja!"
	done
