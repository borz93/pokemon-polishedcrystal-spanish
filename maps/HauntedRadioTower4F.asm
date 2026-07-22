HauntedRadioTower4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, HAUNTED_RADIO_TOWER_3F, 2
	warp_event  8,  0, HAUNTED_RADIO_TOWER_5F, 1

	def_coord_events

	def_bg_events
	bg_event  1,  6, BGEVENT_JUMPTEXT, HauntedRadioTower4FStaticText
	bg_event 14,  6, BGEVENT_READ, HauntedRadioTower4FDiaryPageScript

	def_object_events
	object_event  7,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HauntedRadioTower4FEmployeeScript, EVENT_HAUNTED_RADIO_TOWER_FAKE_EMPLOYEE

	object_const_def
	const HAUNTEDRADIOTOWER4F_EMPLOYEE

HauntedRadioTower4FEmployeeScript:
	faceplayer
	opentext
	writetext HauntedRadioTower4FEmployeeGreetingText
	waitbutton
	writetext HauntedRadioTower4FEmployeeTurnsText
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_SANDSTORM
	waitsfx
	writetext HauntedRadioTower4FEmployeeVanishesText
	waitbutton
	closetext
	setevent EVENT_HAUNTED_RADIO_TOWER_FAKE_EMPLOYEE
	disappear HAUNTEDRADIOTOWER4F_EMPLOYEE
	opentext
	writetext HauntedRadioTower4FFoundSpellTagText
	promptbutton
	verbosegiveitem SPELL_TAG
	endtext

HauntedRadioTower4FDiaryPageScript:
	checkevent EVENT_HAUNTED_RADIO_TOWER_DIARY_3
	iftrue_jumptext HauntedRadioTower4FDiaryPageAgainText
	setevent EVENT_HAUNTED_RADIO_TOWER_DIARY_3
	jumptext HauntedRadioTower4FDiaryPageText

HauntedRadioTower4FStaticText:
	text "Un viejo micro."

	para "Aún desprende"
	line "electricidad"
	cont "estática."
	done

HauntedRadioTower4FEmployeeGreetingText:
	text "Buenas… ¿Vienes a"
	line "solicitar el"
	cont "puesto?"

	para "Llevo aquí desde"
	line "la mudanza de las"
	cont "tumbas…"
	done

HauntedRadioTower4FEmployeeTurnsText:
	text "…"

	para "Nunca me dejaron"
	line "irme."
	done

HauntedRadioTower4FEmployeeVanishesText:
	text "El empleado se"
	line "desvanece en el"
	cont "aire."
	done

HauntedRadioTower4FFoundSpellTagText:
	text "Donde estaba,"
	line "encuentras algo"
	cont "que se le cayó."
	done

HauntedRadioTower4FDiaryPageText:
	text "Otra página de"
	line "diario, medio"
	cont "quemada."

	para "“…ya no soporto"
	line "los ruidos por"
	cont "las noches…”"

	para "“Dicen que solo"
	line "descansará si le"

	para "devuelven lo que"
	line "le pertenece.”"
	done

HauntedRadioTower4FDiaryPageAgainText:
	text "Ya has leído esta"
	line "página."
	done
