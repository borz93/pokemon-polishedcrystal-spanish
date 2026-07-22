ViridianForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, VIRIDIAN_FOREST_PEWTER_GATE, 1
	warp_event 18, 47, VIRIDIAN_FOREST_VIRIDIAN_GATE, 1
	warp_event 19, 47, VIRIDIAN_FOREST_VIRIDIAN_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  4,  7, BGEVENT_JUMPTEXT, ViridianForestSignText1
	bg_event  6, 26, BGEVENT_JUMPTEXT, ViridianForestSignText2
	bg_event 28, 19, BGEVENT_JUMPTEXT, ViridianForestSignText3
	bg_event 18, 34, BGEVENT_JUMPTEXT, ViridianForestSignText4
	bg_event 26, 42, BGEVENT_JUMPTEXT, ViridianForestSignText5
	bg_event 20, 44, BGEVENT_JUMPTEXT, ViridianForestSignText6
	bg_event 32, 44, BGEVENT_ITEM + MAX_ETHER, EVENT_VIRIDIAN_FOREST_HIDDEN_MAX_ETHER
	bg_event 18, 43, BGEVENT_ITEM + FULL_HEAL, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_HEAL
	bg_event  4, 43, BGEVENT_ITEM + MULCH, EVENT_VIRIDIAN_FOREST_HIDDEN_MULCH
	bg_event 30,  9, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_VIRIDIAN_FOREST_HIDDEN_BIG_MUSHROOM
	bg_event  3, 14, BGEVENT_ITEM + LEAF_STONE, EVENT_VIRIDIAN_FOREST_HIDDEN_LEAF_STONE

	def_object_events
	object_event 29, 42, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBug_maniacDane, -1
	object_event 33, 35, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBug_maniacDion, -1
	object_event 32, 21, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBug_maniacStacey, -1
	object_event 31,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacEllis, -1
	object_event  5, 24, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBug_maniacAbner, -1
	itemball_event 14, 31, DIRE_HIT, 1, EVENT_ROUTE_2_DIRE_HIT
	itemball_event  3, 33, MAX_POTION, 1, EVENT_ROUTE_2_MAX_POTION

GenericTrainerBug_maniacDane:
	generictrainer BUG_MANIAC, DANE, EVENT_BEAT_BUG_MANIAC_DANE, BugManiacDaneSeenText, BugManiacDaneBeatenText

	text "¡Muy"
	line "impresionante!"

	para "¡Seguro que puedes"
	line "ir a cualquier"
	cont "sitio con esa"
	cont "habilidad!"
	done

GenericTrainerBug_maniacDion:
	generictrainer BUG_MANIAC, DION, EVENT_BEAT_BUG_MANIAC_DION, BugManiacDionSeenText, BugManiacDionBeatenText

	text "Los #mon"
	line "bicho hacen todo"
	cont "tipo de sonidos."

	para "Para los fans de"
	line "#mon bicho,"
	cont "saber"
	cont "distinguirlos es"
	cont "clave!"
	done

GenericTrainerBug_maniacStacey:
	generictrainer BUG_MANIAC, STACEY, EVENT_BEAT_BUG_MANIAC_STACEY, BugManiacStaceySeenText, BugManiacStaceyBeatenText

	text "¿Alguna vez te han"
	line "dicho que de"
	cont "espaldas pareces"
	cont "un Venonat?"
	done

GenericTrainerBug_maniacEllis:
	generictrainer BUG_MANIAC, ELLIS, EVENT_BEAT_BUG_MANIAC_ELLIS, BugManiacEllisSeenText, BugManiacEllisBeatenText

	text "Si es así, no me"
	line "importa"
	cont "perder!"
	done

GenericTrainerBug_maniacAbner:
	generictrainer BUG_MANIAC, ABNER, EVENT_BEAT_BUG_MANIAC_ABNER, BugManiacAbnerSeenText, BugManiacAbnerBeatenText

	text "No importa qué"
	line "tipo de #mon"
	cont "sea…"

	para "mientras te"
	line "gusten, todos se"
	cont "ven monos."
	done

BugManiacDaneSeenText:
	text "Bienvenido al"
	line "Bosque Verde."
	cont "Disfruta de mis"
	cont "#mon bicho."
	done

BugManiacDaneBeatenText:
	text "Qué maravilla…"
	done

BugManiacDionSeenText:
	text "¡Shh! ¡Silencio!"
	line "¡Los #mon bicho"
	cont "huirán!"
	done

BugManiacDionBeatenText:
	text "Uf…"
	done

BugManiacStaceySeenText:
	text "Vaya, ¡qué #mon"
	line "tan ENORME!"

	para "…"
	line "…¿Qué clase de"
	cont "entrenador?!"
	done

BugManiacStaceyBeatenText:
	text "¡No pude"
	line "atraparlo!"
	done

BugManiacEllisSeenText:
	text "No hay nada más"
	line "eficaz y bello que"
	cont "un #mon tipo"
	cont "Bicho."
	done

BugManiacEllisBeatenText:
	text "Perdí"
	line "hermosamente!"
	done

BugManiacAbnerSeenText:
	text "Muchos prefieren"
	line "#mon bicho"
	cont "sólidos a los"
	cont "blandos."
	done

BugManiacAbnerBeatenText:
	text "Gracias por su"
	line "esfuerzo, mis"
	cont "amados #mon…"
	done

ViridianForestSignText1:
	text "Saliendo del"
	line "Bosque Verde"
	cont "Ciudad Plateada"
	cont "próxima"
	done

ViridianForestSignText2:
	text "Consejos"

	para "¡Guarda esa Seta"
	line "Grande!"

	para "¡Algunos"
	line "maniáticos pagan"
	cont "mucho dinero por"
	cont "objetos inútiles!"
	done

ViridianForestSignText3:
	text "Consejos"

	para "¡Los #mon tipo"
	line "Planta no se ven"

	para "afectados por"
	line "polvos ni"
	cont "esporas!"
	done

ViridianForestSignText4:
	text "Para el veneno,"
	line "¡usa Antídoto! Se"
	cont "vende en tiendas"
	cont "#mon!"
	done

ViridianForestSignText5:
	text "Consejos"

	para "¡Los #mon tipo"
	line "Veneno no pueden"
	cont "envenenarse a sí"
	cont "mismos!"
	done

ViridianForestSignText6:
	text "Consejos"

	para "¡Debilita a los"
	line "#mon antes de"
	cont "intentar"
	cont "capturarlos!"

	para "¡Sanos, pueden"
	line "escapar!"
	done
