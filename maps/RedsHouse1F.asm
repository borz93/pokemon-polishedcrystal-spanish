RedsHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_UP, RedsHouse1FTVScript

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1

RedsMom:
	checkevent EVENT_MET_REDS_MOM
	iftrue_jumptextfaceplayer .Text2
	setevent EVENT_MET_REDS_MOM
	jumpthistextfaceplayer

	text "¡Hola!"

	para "Red lleva mucho"
	line "tiempo fuera."

	para "Tampoco ha"
	line "llamado, así que"

	para "no sé dónde está"
	line "ni qué anda"
	cont "haciendo."

	para "Dicen que sin"
	line "noticias, buenas"

	para "noticias, pero"
	line "aun así me"
	cont "preocupo por él."
	done

.Text2:
	text "Me preocupa que"
	line "Red se lastime o"

	para "enferme, pero es"
	line "un chico. Estoy"

	para "orgullosa de que"
	line "haga lo que"
	cont "quiere hacer."
	done

RedsHouse1FTVScript:
	jumpthistext

	text "Tienen programas"
	line "que no se ven"
	cont "en Johto…"
	done
