BattleTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  1, BATTLE_TOWER_1F, 4

	def_coord_events

	def_bg_events
	bg_event  4,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event  5,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event 16,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event 17,  3, BGEVENT_UP, BattleTower2FTVScript

	def_object_events
	object_event  4,  6, SPRITE_CHERYL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FCherylScript, EVENT_BATTLE_TOWER_CHERYL
	object_event  7,  7, SPRITE_RILEY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FRileyScript, EVENT_BATTLE_TOWER_RILEY
	object_event  9,  4, SPRITE_BUCK, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FBuckScript, EVENT_BATTLE_TOWER_BUCK
	object_event 17,  8, SPRITE_MARLEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FMarleyScript, EVENT_BATTLE_TOWER_MARLEY
	object_event 12,  7, SPRITE_MIRA, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FMiraScript, EVENT_BATTLE_TOWER_MIRA
	object_event 15,  6, SPRITE_ANABEL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FAnabelScript, EVENT_BATTLE_TOWER_ANABEL
	object_event  4,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FCooltrainermText, EVENT_MURKY_SWAMP_CHERYL
	object_event  7,  7, SPRITE_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FLadyText, EVENT_DIM_CAVE_RILEY
	object_event  9,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FTwinText, EVENT_CINNABAR_VOLCANO_BUCK
	object_event 17,  8, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FSuperNerdText, EVENT_QUIET_CAVE_MARLEY
	pokemon_event 18,  8, PIKACHU, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, BattleTower2FPikachuText, EVENT_QUIET_CAVE_MARLEY
	object_event 12,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FYoungsterText, EVENT_SCARY_CAVE_MIRA
	object_event 15,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FBlackbeltText, EVENT_BATTLE_TOWER_OUTSIDE_ANABEL

	object_const_def
	const BATTLETOWER2F_CHERYL
	const BATTLETOWER2F_RILEY
	const BATTLETOWER2F_BUCK
	const BATTLETOWER2F_MARLEY
	const BATTLETOWER2F_MIRA
	const BATTLETOWER2F_ANABEL

BattleTower2FTVScript:
	jumpthistext

	text "Hay un combate"
	line "intenso en la TV."
	done

BattleTower2FCherylScript:
	checkflag ENGINE_CHERYL_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Oh, hola,"
		line "<PLAYER>."

		para "Ha pasado mucho"
		line "tiempo… ¿verdad?"

		para "¿Te gustaría"
		line "tener un combate"
		cont "conmigo?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_CHERYL_DONE_TODAY
	writethistext
		text "Debo avisarte de"
		line "que mis #mon"
		cont "pueden ser algo"
		cont "traviesos."
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_CHERYL
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Team2
	loadtrainer CHERYL, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer CHERYL, 2
	sjumpfwd .StartBattle
.Team3
	loadtrainer CHERYL, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Ser entrenadora"
	line "no es fácil."

	para "Cuanto más"
	line "combates, más"
	cont "descubres."

	para "Pero, ¿sabes? ¡Por"
	line "eso también amo a"
	cont "los #mon!"
	done

.BeatenText:
	text "Encontrar el"
	line "equilibrio justo"
	cont "entre ataque y"
	cont "defensa…"

	para "No es nada fácil"
	line "de lograr."
	done

.RefuseText:
	text "Jeje…"

	para "Los #mon se"
	line "agotarían si"

	para "combatiéramos todo"
	line "el rato, ¿no"
	cont "crees?"
	done

BattleTower2FRileyScript:
	checkflag ENGINE_RILEY_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Hola. Cuánto"
		line "tiempo."

		para "Esa mirada que"
		line "tienes… Diría que"

		para "estás listo para"
		line "combatir."
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_RILEY_DONE_TODAY
	writethistext
		text "¡Combatir es"
		line "nuestra forma de"
		cont "saludar!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_RILEY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer RILEY, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer RILEY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Si yo no hubiera"
	line "estado en la Cueva"
	cont "Tenue entonces…"

	para "Si tú no hubieras"
	line "estado en la Cueva"
	cont "Tenue entonces…"

	para "Quizás nunca nos"
	line "hubiéramos"
	cont "conocido."

	para "O, ¿nos hubiéramos"
	line "encontrado en otro"
	cont "lugar?"
	done

.BeatenText:
	text "A veces"
	line "combatimos, y a"
	cont "veces nos"
	cont "aliamos."

	para "Es genial cómo"
	line "los entrenadores"
	cont "pueden"
	cont "relacionarse."
	done

.RefuseText:
	text "Ah, está bien."
	line "Entonces"
	cont "esperaremos a que"
	cont "estés listo."
	done

BattleTower2FBuckScript:
	checkflag ENGINE_BUCK_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "¡Ejejeje! ¡Por"
		line "fin estás aquí!"

		para "¿Entonces vamos a"
		line "combatir?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_BUCK_DONE_TODAY
	writethistext
		text "¡Puedo sentir a"
		line "mis #mon"

		para "temblando dentro"
		line "de sus Balls de la"
		cont "emoción!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_BUCK
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer BUCK, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer BUCK, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "¡Fiu! ¡Demasiado!"

	para "Supongo que"
	line "seguiré mejorando"
	cont "mi equipo."
	done

.BeatenText:
	text "¡Jijiji!"
	line "¡Qué caña tienes!"
	done

.RefuseText:
	text "¿Eh, qué? Vaya"
	line "chasco te has"
	cont "marcado."
	done

BattleTower2FMarleyScript:
	checkflag ENGINE_MARLEY_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "…¿Oh? ¿Un"
		line "combate? ¿Conmigo?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_MARLEY_DONE_TODAY
	writethistext
		text "…Vale. No…"
		line "¡no voy a perder…!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_MARLEY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Team2
	loadtrainer MARLEY, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer MARLEY, 2
	sjumpfwd .StartBattle
.Team3
	loadtrainer MARLEY, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "…Puede que me"
	line "guste combatir"
	cont "contigo."

	para "…Solo un poco."
	line "Solo un poquito."
	done

.BeatenText:
	text "…Vaya."
	done

.RefuseText:
	text "…Ay, tú. Me estás"
	line "empezando a caer"
	cont "un poco mal."
	done

BattleTower2FMiraScript:
	checkflag ENGINE_MIRA_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "¡<PLAYER>! ¡Mira"
		line "ahora es más"
		cont "fuerte!"

		para "¡Por favor! ¡Ten"
		line "un combate con"
		cont "Mira!"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_MIRA_DONE_TODAY
	writethistext
		text "Mira te"
		line "demostrará que"
		cont "Mira ya no se"

		para "pierde más,"
		line "¡<PLAYER>!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_MIRA
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer MIRA, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer MIRA, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "<PLAYER>, siempre"
	line "estás con tus"
	cont "#mon."

	para "Así es como te"
	line "volviste tan"
	cont "fuerte."

	para "¡Mira empieza a"
	line "entenderlo!"
	done

.BeatenText:
	text "Mira se pregunta"
	line "si puede llegar"

	para "muy lejos en la"
	line "Torre de Combate."
	done

.RefuseText:
	text "Mira está un poco"
	line "triste…"
	done

BattleTower2FAnabelScript:
	checkflag ENGINE_ANABEL_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Al final sí"
		line "viniste a verme…"

		para "No tendré que"
		line "contenerme"
		cont "contigo…"

		para "¿Estás listo?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_ANABEL_DONE_TODAY
	writethistext
		text "Empecemos,"
		line "¿te parece?"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_ANABEL
	loadtrainer ANABEL, 2
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Eso fue"
	line "divertido…"

	para "Nunca había"
	line "disfrutado tanto"

	para "de un combate"
	line "#mon antes…"
	done

.BeatenText:
	text "Gracias…"
	done

.RefuseText:
	text "Es muy"
	line "decepcionante…"
	done

BattleTower2FCooltrainermText:
	text "Tengo que irme,"
	line "pero no puedo"

	para "¡dejar de ver"
	line "este combate!"
	done

BattleTower2FLadyText:
	text "¿Qué es lo que más"
	line "me alegra de ser"
	cont "entrenadora?"

	para "¡El hecho de que"
	line "los #mon me"

	para "traigan muchos"
	line "amigos!"
	done

BattleTower2FTwinText:
	text "A algunos les"
	line "sorprende ver a"

	para "una niña como yo"
	line "en la Torre de"
	cont "Combate."

	para "No es que yo tenga"
	line "que combatir en"
	cont "persona, ¿sabes?"
	done

BattleTower2FSuperNerdText:
	text "¡Jeje! ¡Todos los"
	line "entrenadores de"
	cont "aquí parecen tan"
	cont "patéticos!"

	para "…En realidad, esa"
	line "mentalidad hace"
	cont "que pierdas de"
	cont "¡un solo golpe!"

	para "¡No bajes la"
	line "guardia,"
	cont "Pikachu!"
	done

BattleTower2FPikachuText:
	text "Pikachu: ¡Pichuu!"
	done

BattleTower2FYoungsterText:
	text "Ser fuerte es ser"
	line "débil."

	para "Ser débil es ser"
	line "fuerte."

	para "Alguien me dijo"
	line "eso una vez."

	para "No lo entiendo,"
	line "pero suena"
	cont "profundo."
	done

BattleTower2FBlackbeltText:
	text "¡El karategi es el"
	line "uniforme de los"
	cont "luchadores!"

	para "No hay nada más"
	line "adecuado para"

	para "la Torre de"
	line "Combate que esto."
	done
