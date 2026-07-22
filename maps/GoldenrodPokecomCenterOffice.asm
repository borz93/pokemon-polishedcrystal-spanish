GoldenrodPokecomCenterOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  8, GOLDENROD_POKECOM_CENTER_1F, 3
	warp_event  1,  8, GOLDENROD_POKECOM_CENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_UP, RangiComputerScript
	bg_event  6,  2, BGEVENT_UP, LunaComputerScript
	bg_event  9,  2, BGEVENT_UP, FredrikComputerScript
	bg_event 12,  2, BGEVENT_UP, EmiComputerScript
	bg_event  6,  5, BGEVENT_UP, AizawaComputerScript
	bg_event  9,  5, BGEVENT_UP, VulcanComputerScript
	bg_event 12,  5, BGEVENT_UP, SourComputerScript

	def_object_events
	object_event  4,  4, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RANGI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminRangiText, -1
	object_event  7,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminLunaText, -1
	object_event 10,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminFredrikText, -1
	object_event 13,  3, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_EMI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminEmiText, -1
	object_event  7,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminAizawaText, -1
	object_event 10,  6, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminVulcanText, -1
	object_event 13,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminSourText, -1
	object_event  4,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_ADMIN_MEOWTH, 0, MEOWTH, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, AdminEldredScript, -1

AdminRangiText:
	text "Rangi: ¡Espero"
	line "que estés"
	cont "disfrutando"

	para "tu viaje por este"
	line "juego!"

	para "Nos costó mucho"
	line "meter todos los"
	cont "datos."

	para "¡Apenas hubo"
	line "sitio para mi"
	cont "propio sprite!"
	done

RangiComputerScript:
	jumpthistext

	text "“Optimizando…”"
	line "parpadea en la"
	cont "pantalla."

	para "Parece que está"
	line "tardando bastante."
	done

AdminLunaText:
	text "Luna: Cuando"
	line "hiciste un"

	para "Intercambio"
	line "Sorpresa con"

	para "alguien de otra"
	line "región por"
	cont "primera vez, ¿no"
	cont "te impresionó?"

	para "¡Yo construí el"
	line "sistema original"
	cont "aquí en Ciudad"
	cont "Trigal!"
	done

LunaComputerScript:
	jumpthistext

	text "Una pantalla"
	line "llena de notas"

	para "densas, mapas de"
	line "lugares"

	para "desconocidos y"
	line "una foto de Johto"
	cont "cubierto de nieve."
	done

AdminFredrikText:
	text "Fredrik: El"
	line "Sistema de"
	cont "Almacenaje PC de"
	cont "Bill es de código"
	cont "abierto,"

	para "¡así que pude"
	line "reescribir y"

	para "mejorar por"
	line "completo su base"
	cont "de datos!"
	done

FredrikComputerScript:
	jumpthistext

	text "Hay una docena de"
	line "ventanas abiertas"

	para "a la vez, cada una"
	line "de una función"
	cont "distinta."
	done

AdminEmiText:
	text "Emi: ¿Has visto el"
	line "Resumen de tu"
	cont "#mon?"

	para "Vengo de visita"
	line "desde la región"
	cont "Beria"

	para "¡para traer esa"
	line "interfaz a Johto!"

	para "¡Ven a saludar si"
	line "alguna vez estás"
	cont "en Pueblo"
	cont "Amatista!"
	done

EmiComputerScript:
	jumpthistext

	text "Mucho código está"
	line "tapado por una"
	cont "partida de"
	cont "Solitario."
	done

AdminAizawaText:
	text "Aizawa: Diálogos,"
	line "diseños de mapas,"
	cont "sprites de"
	cont "personajes,"
	cont "equipos"
	cont "rivales…"

	para "¡Game Freak, allá"
	line "en Kanto, tiene"

	para "suerte de tener"
	line "toda una empresa"
	cont "para esto!"
	done

AizawaComputerScript:
	jumpthistext

	text "Un programa"
	line "llamado Polished"
	cont "Map++ muestra"

	para "una isla tropical"
	line "a medio dibujar."
	done

AdminVulcanText:
	text "Vulcan: ¿Qué tal"
	line "el clima?"

	para "No es charla"
	line "trivial… ¡de"
	cont "verdad lo"
	cont "implementé!"

	para "Pensábamos que no"
	line "se podía hacer…"

	para "¡Me demostré a mí"
	line "mismo que estaba"
	cont "equivocado!"
	done

VulcanComputerScript:
	jumpthistext

	text "Un mapa del clima"
	line "se muestra en la"
	cont "pantalla."

	para "Está mostrando"
	line "lluvia en Johto."
	done

AdminSourText:
	text "Sour: ¿Qué tal te"
	line "parecen las"

	para "animaciones de"
	line "movimientos en"
	cont "combate?"

	para "¡Me encanta hacer"
	line "que cada"
	cont "movimiento sea un"
	cont "placer de usar!"
	done

SourComputerScript:
	jumpthistext

	text "Hay una imagen"
	line "graciosa de un"
	cont "hombre con forma"
	cont "de huevo y"
	cont "bigote."
	done

AdminEldredScript:
	opentext
	writetext AdminMeowthText
	cry MEOWTH
	promptbutton
	jumpthisopenedtext

	text "Un travieso"
	line "Meowth araña el"
	cont "teclado."
	done

AdminMeowthText:
	text "Eldred: ¡Miaou!"
	done
