MagnetTunnelInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, MagnetTunnelInsideTileCallback

	def_warp_events
	warp_event  5, 19, MAGNET_TUNNEL_WEST, 1
	warp_event 43,  3, MAGNET_TUNNEL_EAST, 1
	warp_event 27,  3, MAGNET_TUNNEL_INSIDE, 4
	warp_event 27, 31, MAGNET_TUNNEL_INSIDE, 3
	warp_event 34,  5, MAGNET_TUNNEL_INSIDE, 6
	warp_event 34, 33, MAGNET_TUNNEL_INSIDE, 5

	def_coord_events

	def_bg_events
	bg_event  6, 10, BGEVENT_UP, MagnetTunnelInsideMachine1
	bg_event  7, 10, BGEVENT_UP, MagnetTunnelInsideMachine1
	bg_event 22, 21, BGEVENT_UP, MagnetTunnelInsideMachine2
	bg_event 23, 21, BGEVENT_UP, MagnetTunnelInsideMachine2
	bg_event 20,  8, BGEVENT_UP, MagnetTunnelInsideMachine3
	bg_event 21,  8, BGEVENT_UP, MagnetTunnelInsideMachine3
	bg_event 34,  8, BGEVENT_UP, MagnetTunnelInsideMachine4
	bg_event 35,  8, BGEVENT_UP, MagnetTunnelInsideMachine4
	bg_event 38, 30, BGEVENT_ITEM + METAL_POWDER, EVENT_MAGNET_TUNNEL_HIDDEN_METAL_POWDER

	def_object_events
	object_event  3, 10, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_1
	object_event 20, 23, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_2
	object_event 20,  5, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_3
	object_event 35,  5, SPRITE_N64, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GRAY, OBJECTTYPE_COMMAND, jumptext, MagnetTunnelInsideLodestoneText, EVENT_MAGNET_TUNNEL_LODESTONE_4
	object_event 11, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideEngineerText1, -1
	object_event  8, 13, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideEngineerText2, -1
	object_event 32, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MagnetTunnelInsideScientistText, -1
	object_event 22,  8, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerEngineerGraden, -1
	object_event 31, 12, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerEngineerGustav, -1
	object_event 24, 23, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerNicolas, -1
	tmhmball_event 19, 21, TM_GYRO_BALL, EVENT_MAGNET_TUNNEL_TM_GYRO_BALL

	object_const_def
	const MAGNETTUNNELINSIDE_STONE_1
	const MAGNETTUNNELINSIDE_STONE_2
	const MAGNETTUNNELINSIDE_STONE_3
	const MAGNETTUNNELINSIDE_STONE_4

MagnetTunnelInsideTileCallback:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_1
	iffalsefwd .NoMachine1
	changeblock 6, 10, $6b
	changeblock 6, 8, $6d
.NoMachine1
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_2
	iffalsefwd .NoMachine2
	changeblock 22, 20, $66
.NoMachine2
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_3
	iffalsefwd .NoMachine3
	changeblock 20, 8, $6b
	changeblock 20, 6, $6f
.NoMachine3
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	iffalsefwd .NoPit
	changeblock 34, 8, $70
	changeblock 34, 4, $68
	endcallback
.NoPit
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_4
	iffalsefwd .NoMachine4
	changeblock 34, 8, $36
	changeblock 34, 6, $35
.NoMachine4
	endcallback

MagnetTunnelInsideMachine1:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_1
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 6, 10, $6b
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_1, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 6, 8, $6d
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_1
	end

.StoneMovement:
	fix_facing
	slow_slide_step_up
	slow_slide_step_right
	slow_slide_step_right
	slow_slide_step_right
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine2:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_2
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 22, 20, $67
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_2, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 22, 20, $66
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_2
	end

.StoneMovement:
	fix_facing
	slow_slide_step_up
	slow_slide_step_up
	slow_slide_step_up
	slow_slide_step_right
	slow_slide_step_right
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine3:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_3
	iftrue_jumptextfaceplayer MagnetTunnelInsideMachineText3
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 20, 8, $6b
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_3, .StoneMovement
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 20, 6, $6f
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_3
	end

.StoneMovement:
	fix_facing
	slow_slide_step_down
	slow_slide_step_down
	remove_fixed_facing
	step_end

MagnetTunnelInsideMachine4:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_4
	iftruefwd .MachineOn
	opentext
	writetext MagnetTunnelInsideMachineText1
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	changeblock 34, 8, $36
	refreshmap
	writetext MagnetTunnelInsideMachineText2
	waitbutton
	closetext
	playsound SFX_THUNDERSHOCK
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_4, .StoneMovement1
	playsound SFX_THUNDERSHOCK
	earthquake 15
	playsound SFX_STRENGTH
	changeblock 34, 6, $35
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_4
	scall MagnetTunnelAlarmSounds
	showemote EMOTE_QUESTION, PLAYER, 15
	showtext MagnetTunnelInsideMachineText4
	end

.StoneMovement1:
	fix_facing
	slow_slide_step_down
	slow_slide_step_down
	slow_slide_step_left
	remove_fixed_facing
	step_end

.MachineOn:
	checkevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	iftrue_jumptext MagnetTunnelInsideMachineText7
	scall MagnetTunnelAlarmSounds
	opentext
	writetext MagnetTunnelInsideMachineText5
	yesorno
	iffalse_endtext
	playsound SFX_GLASS_TING
	writetext MagnetTunnelInsideMachineText6
	waitbutton
	closetext
	changeblock 34, 8, $70
	changeblock 34, 6, $34
	refreshmap
	moveobject MAGNETTUNNELINSIDE_STONE_4, 34, 7
	appear MAGNETTUNNELINSIDE_STONE_4
	playsound SFX_EMBER
	earthquake 15
	applymovement MAGNETTUNNELINSIDE_STONE_4, .StoneMovement2
	playsound SFX_STRENGTH
	earthquake 15
	changeblock 34, 4, $68
	refreshmap
	disappear MAGNETTUNNELINSIDE_STONE_4
	setevent EVENT_MAGNET_TUNNEL_LODESTONE_IN_PIT
	end

.StoneMovement2:
	fix_facing
	slide_step_up
	slide_step_up
	remove_fixed_facing
	step_end

MagnetTunnelAlarmSounds:
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	waitsfx
	special RestoreMusic
	end

MagnetTunnelInsideMachineText1:
	text "La máquina está"
	line "apagada."

	para "¿La enciendes?"
	done

MagnetTunnelInsideMachineText2:
	text "¡Ping! La máquina"
	line "se encendió."
	done

MagnetTunnelInsideMachineText3:
	text "La máquina"
	line "funciona bien."
	done

MagnetTunnelInsideMachineText4:
	text "¿¡Eh?! ¡Algo va"
	line "mal!"
	done

MagnetTunnelInsideMachineText5:
	text "¡Esta máquina no"
	line "funciona bien!"

	para "Varios mensajes de"
	line "AVISO parpadean"

	para "rápido en la"
	line "pequeña pantalla"

	para "y un olor a"
	line "quemado llena el"
	cont "aire."

	para "¿Pulsas el botón"
	line "de parada de"
	cont "emergencia?"
	done

MagnetTunnelInsideMachineText6:
	text "¡Din! La máquina"
	line "se apagó."
	done

MagnetTunnelInsideMachineText7:
	text "La máquina está"
	line "rodeada de un"

	para "leve hedor a"
	line "plástico"
	cont "derretido…"

	para "Parece estar"
	line "totalmente"
	cont "frita."
	done

MagnetTunnelInsideLodestoneText:
	text "La magnetita es"
	line "lisa y cálida."

	para "Tiene un leve aura"
	line "de estática."
	done

MagnetTunnelInsideEngineerText1:
	text "La magnetita de"
	line "aquí emite un"
	cont "campo magnético"
	cont "fuerte."

	para "Tuvimos que traer"
	line "equipo"

	para "especializado para"
	line "terminar este"
	cont "túnel a tiempo"
	cont "para el capataz."

	para "Nuestro equipo"
	line "estaba bajo mucha"
	cont "presión para"
	cont "entregarlo a"
	cont "tiempo."
	done

MagnetTunnelInsideEngineerText2:
	text "Desde el día que"
	line "empezamos a"

	para "construir este"
	line "túnel, el número"

	para "de #mon"
	line "eléctricos"
	cont "salvajes aquí se"
	cont "ha más que"
	cont "duplicado."
	done

MagnetTunnelInsideScientistText:
	text "Cada día llegan"
	line "más Magnemite y"
	cont "causan problemas."

	para "El capataz cree"
	line "que deben sentirse"

	para "atraídos por las"
	line "propiedades"
	cont "magnéticas únicas"
	cont "de la magnetita."

	para "¿Por qué será?"
	done

GenericTrainerEngineerGraden:
	generictrainer ENGINEER, GRADEN, EVENT_BEAT_ENGINEER_GRADEN, .SeenText, .BeatenText

	text "Soy el capataz de"
	line "esta obra."

	para "Excavamos este"
	line "túnel para hacer"

	para "un camino para la"
	line "nueva vía del Tren"
	cont "Imán, pero…"

	para "No sabía que toda"
	line "esa magnetita"

	para "iba a dar tantos"
	line "quebraderos de"
	cont "cabeza."
	done

.SeenText:
	text "¿Admirando todo"
	line "nuestro trabajo?"

	para "¡Jaja!"
	line "¡Admira esto!"
	done

.BeatenText:
	text "¡Jaja! Tienes"
	line "agallas. ¡Me"
	cont "gusta!"
	done

GenericTrainerEngineerGustav:
	generictrainer ENGINEER, GUSTAV, EVENT_BEAT_ENGINEER_GUSTAV, .SeenText, .BeatenText

	text "He intentado"
	line "arreglarla, pero"
	cont "no ha servido de"
	cont "nada…"

	para "¡No consigo"
	line "averiguar qué"
	cont "pasa!"

	para "Me preocupa que si"
	line "la enciendo otra"
	cont "vez,"

	para "la máquina se"
	line "cortocircuite y se"
	cont "estropee…"
	done

.SeenText:
	text "¡Atrás!"

	para "¡Esta máquina ha"
	line "estado fallando!"
	done

.BeatenText:
	text "¡Se fundió! Como"
	line "un fusible…"
	done

GenericTrainerEngineerNicolas:
	generictrainer ENGINEER, NICOLAS, EVENT_BEAT_ENGINEER_NICOLAS, .SeenText, .BeatenText

	text "¡Estas cosas"
	line "pueden generar"
	cont "un voltaje serio!"

	para "Al encenderse,"
	line "crean un campo"

	para "magnético"
	line "extremadamente"
	cont "fuerte."

	para "Así que ten"
	line "cuidado aquí,"
	cont "¿vale, chaval?"
	done

.SeenText:
	text "¡Oye! ¡Ten cuidado"
	line "con el equipo,"
	cont "chaval!"
	done

.BeatenText:
	text "¡Apagado!"
	done
