SoulHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  9, LAVENDER_TOWN, 6
	warp_event  5,  9, LAVENDER_TOWN, 6
	warp_event  4,  2, SOUL_HOUSE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  7, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AgathaScript, -1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujiScript, -1 ; TODO: EVENT_SOUL_HOUSE_MR_FUJI
	object_event  7,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseTeacherText, -1
	object_event  2,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseLassText, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseGrannyText, -1

	object_const_def
	const SOULHOUSE_AGATHA

AgathaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_AGATHA
	iftruefwd AgathaAfterScript
	writetext AgathaSeenText
	waitbutton
	closetext
	winlosstext AgathaBeatenText, 0
	setlasttalked SOULHOUSE_AGATHA
	loadtrainer AGATHA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_AGATHA
	opentext
	writetext AgathaRewardText
	promptbutton
	verbosegivetmhm TM_SHADOW_CLAW
	setevent EVENT_GOT_TM65_SHADOW_CLAW_FROM_AGATHA
AgathaAfterScript:
	jumpthisopenedtext

	text "Espero grandes"
	line "cosas de ti, si"
	cont "tú las quieres."
	done

MrFujiScript:
	faceplayer
	opentext
	writetext MrFujiText
	waitbutton
	checkevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	iftruefwd .AlreadyGaveScope
	writetext MrFujiGiveSilphScopeText
	waitbutton
	verbosegivekeyitem SILPHSCOPE2
	writetext MrFujiUseThisText
	waitbutton
	setevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	endtext

.AlreadyGaveScope:
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iffalse_endtext
	checkevent EVENT_GOT_MASTER_BALL_FROM_MR_FUJI
	iftrue_endtext
	writetext MrFujiThanksForExorcisingText
	promptbutton
	verbosegiveitem MASTER_BALL
	setevent EVENT_GOT_MASTER_BALL_FROM_MR_FUJI
	endtext

MrFujiText:
	text "Sr. Fuji:"
	line "Bienvenido."

	para "Hmm… Parece que"
	line "estás criando a"

	para "tus #mon con"
	line "cariño y bondad."

	para "Los amantes de"
	line "los #mon"
	cont "vienen aquí a"
	cont "rendir homenaje"
	cont "a los #mon"
	cont "fallecidos."

	para "Ofrece tus"
	line "condolencias por"

	para "las almas de los"
	line "#mon"
	cont "fallecidos, por"
	cont "favor."

	para "Seguro que eso"
	line "los hará felices."
	done

MrFujiGiveSilphScopeText:
	text "Ten, tengo un"
	line "regalo para ti."

	para "Tómalo, por"
	line "favor."
	done

MrFujiUseThisText:
	text "Puedes usarlo"
	line "para calmar las"
	cont "almas de #mon"
	cont "inquietos."
	done

MrFujiThanksForExorcisingText:
	text "Sr. Fuji: Sentí"
	line "cómo aquella alma"
	cont "por fin"
	cont "descansaba."

	para "Gracias a ti, la"
	line "Torre Radio ya"
	cont "no sufre."

	para "Como muestra de"
	line "gratitud, quiero"
	cont "que tengas esto."

	para "Silph Co. lo"
	line "fabricó hace"
	cont "años, pero nunca"
	cont "supieron usarlo"
	cont "con respeto."

	para "Tú sí sabes"
	line "hacerlo."
	done

SoulHouseTeacherText:
	text "Creo que hay otras"
	line "tumbas de #mon"
	cont "por aquí."

	para "Hay muchas"
	line "cámaras donde solo"
	cont "puede entrar el"
	cont "Sr. Fuji."
	done

SoulHouseLassText:
	text "Vine con mi madre"
	line "a visitar tumbas"
	cont "de #mon…"
	done

SoulHouseGrannyText:
	text "Los #mon que"
	line "vivían conmigo…"

	para "Los quería como a"
	line "mis nietos…"
	done

AgathaSeenText:
	text "Agatha: Hola,"
	line "criatura."

	para "Me llamo Agatha."

	para "Combatí durante"
	line "años como miembro"
	cont "del Alto Mando."

	para "…………"

	para "¿Has venido a"
	line "llorar a un"
	cont "#mon?"

	para "Puede que ya no"
	line "esté aquí."

	para "El Sr. Fuji"
	line "guardó muchas"
	cont "tumbas en otro"
	cont "sitio tras"

	para "la toma de control"
	line "de la compañía de"
	cont "radio."

	para "…………"

	para "¡Pudo haber"
	line "luchado para"
	cont "preservar la"
	cont "torre! Pero no"

	para "quiso"
	line "involucrarse."
	cont "Demasiado miedo"
	cont "de abusar de su"
	cont "influencia."

	para "Ese viejo"
	line "necio…"

	para "¡El poder está"
	line "para usarse!"

	para "Está claro que me"
	line "entiendes."

	para "¡Te mostraré lo"
	line "que un entrenador"
	cont "poderoso puede"
	cont "hacer!"
	done

AgathaBeatenText:
	text "¡Vaya!"
	done

AgathaRewardText:
	text "Eres algo"
	line "especial,"
	cont "criatura."

	para "Un entrenador"
	line "fuerte con una"

	para "conexión profunda"
	line "con tus #mon."

	para "Toma, ¡esta MT!"
	done
