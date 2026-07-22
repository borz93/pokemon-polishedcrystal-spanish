CeladonHotelRoom1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_HOTEL_2F, 2
	warp_event  4,  5, CELADON_HOTEL_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotelRoom1CooltrainerMText, -1
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotelRoom1LassText, -1
	itemball_event  3,  1, POKE_DOLL, 1, EVENT_CELADON_HOTEL_ROOM_1_POKE_DOLL

CeladonHotelRoom1CooltrainerMText:
	text "De donde vengo,"
	line "no hay # Balls."

	para "La gente usa"
	line "Estilos Captura"
	cont "para hacerse"
	cont "amigos de los"
	cont "#mon."
	done

CeladonHotelRoom1LassText:
	text "Aquí el personal"
	line "dobla nuestras"
	cont "toallas con forma"
	cont "de flor cada día."

	para "Debería pedirles"
	line "que me enseñen"
	cont "cómo."
	done
