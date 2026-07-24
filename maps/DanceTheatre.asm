DanceTheatre_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 15, ECRUTEAK_CITY, 8
	warp_event  6, 15, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script
	bg_event  6,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerKimono_girlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLACK, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlMiki, -1
	object_event  7, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	pokemon_event  6, 10, RHYDON, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RhydonText, -1
	object_event 10, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreCooltrainerMText, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreGrannyText, -1
	object_event  1, 10, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreLadyText, -1

GenericTrainerKimono_girlNaoko:
	assert !DEF(TRAINERPAL_NAOKO) ; the default TRAINERPAL_KIMONO_GIRL is hers
	generictrainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, Kimono_girlNaokoSeenText, Kimono_girlNaokoBeatenText

	text "Disfruté ese"
	line "combate. Me"
	cont "gustaría volver a"
	cont "verte."
	done

GenericTrainerKimono_girlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girlSayoSeenText, Kimono_girlSayoBeatenText, 0, .Script, TRAINERPAL_SAYO

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "El ritmo es"
	line "importante tanto"
	cont "para bailar como"
	cont "para los #mon."
	done

GenericTrainerKimono_girlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, Kimono_girlZukiSeenText, Kimono_girlZukiBeatenText, 0, .Script, TRAINERPAL_ZUKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Me pongo una flor"
	line "distinta en la"
	cont "horquilla cada"
	cont "mes."
	done

GenericTrainerKimono_girlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, Kimono_girlKuniSeenText, Kimono_girlKuniBeatenText, 0, .Script, TRAINERPAL_KUNI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Entrené mucho, así"
	line "que pensé que era"

	para "una entrenadora"
	line "capaz. Supongo que"
	cont "no."
	done

GenericTrainerKimono_girlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girlMikiSeenText, Kimono_girlMikiBeatenText, 0, .Script, TRAINERPAL_MIKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Puedo seguir"
	line "bailando porque"

	para "hay gente que"
	line "disfruta lo que"
	cont "hago."

	para "Mis #mon"
	line "también me"
	cont "animan el ánimo."
	done

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumpopenedtext SurfGuyElegantKimonoGirlsText
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalsefwd .KimonoGirlsUndefeated
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegivetmhm HM_SURF
	setevent EVENT_GOT_HM03_SURF
	jumpthisopenedtext

	text "Eso es Surf."

	para "Es un movimiento"
	line "que deja a los"
	cont "#mon nadar por"
	cont "el agua."
	done

.KimonoGirlsUndefeated:
	jumpthisopenedtext

	text "¡Chaval! Si"
	line "logras vencer a"

	para "todas las Chicas"
	line "Kimono, te daré"
	cont "un regalo."
	done

MapDanceTheatreSignpost1Script:
	jumpthistext

	text "Es un panel"
	line "elegante decorado"
	cont "con flores."
	done

Kimono_girlNaokoSeenText:
	text "Tienes #mon"
	line "encantadores."
	cont "¿Puedo verlos en"
	cont "combate?"
	done

Kimono_girlNaokoBeatenText:
	text "Oh, eres muy"
	line "fuerte."
	done

Kimono_girlSayoSeenText:
	text "Siempre bailo con"
	line "mis #mon."

	para "Claro, también los"
	line "entreno."
	done

Kimono_girlSayoBeatenText:
	text "¡Oh, qué cerca!"
	line "Casi te tenía."
	done

Kimono_girlZukiSeenText:
	text "¿No es bonita mi"
	line "horquilla?"

	para "Oh. ¿Un combate"
	line "#mon?"
	done

Kimono_girlZukiBeatenText:
	text "No me queda"
	line "ningún #mon…"
	done

Kimono_girlKuniSeenText:
	text "Oh, eres una"
	line "entrenador lindo."
	cont "¿Quieres combatir?"
	done

Kimono_girlKuniBeatenText:
	text "Eres más fuerte de"
	line "lo que pareces."
	done

Kimono_girlMikiSeenText:
	text "¿Te gusta mi"
	line "baile? También se"
	cont "me dan bien los"
	cont "#mon."
	done

Kimono_girlMikiBeatenText:
	text "Ooh, también se te"
	line "dan bien los"
	cont "#mon."
	done

SurfGuyNeverLeftAScratchText:
	text "Las Chicas Kimono"
	line "no solo son"

	para "grandes"
	line "bailarinas,"
	cont "también son"
	cont "hábiles con los"
	cont "#mon."

	para "Siempre las reto,"
	line "pero nunca les he"

	para "dejado ni un solo"
	line "rasguño…"
	done

SurfGuyLikeADanceText:
	text "La forma en que"
	line "combatiste, fue"
	cont "como ver un baile."

	para "¡Fue un placer"
	line "poco común de"
	cont "ver!"

	para "Quiero que tengas"
	line "esto. No te"
	cont "preocupes,"
	cont "¡tómalo!"
	done

SurfGuyElegantKimonoGirlsText:
	text "Ojalá mis #mon"
	line "fueran tan"
	cont "elegantes como las"
	cont "Chicas Kimono."
	done

RhydonText:
	text "Rhydon: ¡Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	text "Ese hombre siempre"
	line "está con su"
	cont "Rhydon."

	para "Dice que quiere un"
	line "#mon que pueda"
	cont "usar Surf y"
	cont "bailar."

	para "¿Intenta crear"
	line "un #mon de"
	cont "natación"
	cont "sincronizada?"
	done

DanceTheatreGrannyText:
	text "Las Chicas Kimono"
	line "son tan hermosas…"

	para "Pero tienen que"
	line "pasar por un"
	cont "entrenamiento"
	cont "riguroso."

	para "Y tienen que"
	line "aprender a seguir"

	para "costumbres antes"
	line "de aparecer en"
	cont "público."

	para "Pero si amas algo,"
	line "cualquier cosa es"
	cont "posible."
	done

DanceTheatreLadyText:
	text "Eevee puede"
	line "evolucionar a"
	cont "Leafeon, Glaceon o"
	cont "Sylveon,"

	para "pero no veo"
	line "ninguno aquí."

	para "¿Estarán las"
	line "Chicas Kimono que"

	para "los usan en otro"
	line "lugar?"
	done
