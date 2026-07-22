VioletNicknameSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 4
	warp_event  4,  7, VIOLET_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseTeacherText, -1
	object_event  6,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseLassText, -1
	object_event  5,  2, SPRITE_EEVEE, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseBirdScript, -1
	object_event  0,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletNicknameSpeechHouseGrampsText, -1

VioletNicknameSpeechHouseBirdScript:
	faceplayer
	showcrytext VioletNicknameSpeechHouseBirdText, EEVEE
	end

VioletNicknameSpeechHouseTeacherText:
	text "Usa los nombres"
	line "de sus comidas"
	cont "favoritas,"

	para "para ponerles"
	line "apodo a sus"
	cont "#mon."
	done

VioletNicknameSpeechHouseLassText:
	text "¡A mi Eevee le"
	line "llamo Fresa!"
	done

VioletNicknameSpeechHouseGrampsText:
	text "La Medalla Céfiro"
	line "lleva el nombre"
	cont "de un antiguo"

	para "dios del viento"
	line "del oeste."

	para "Encaja bien para"
	line "un gimnasio"
	cont "Volador."
	done

VioletNicknameSpeechHouseBirdText:
	text "Fresa: ¡Vui!"
	done
