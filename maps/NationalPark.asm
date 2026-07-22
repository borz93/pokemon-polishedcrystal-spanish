NationalPark_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 35, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 12, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 13, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 16, 44, BGEVENT_JUMPTEXT, NationalParkRelaxationSquareText
	bg_event 29, 31, BGEVENT_JUMPTEXT, NationalParkBattleNoticeText
	bg_event 14,  4, BGEVENT_JUMPTEXT, NationalParkTrainerTipsText
	bg_event  8, 47, BGEVENT_ITEM + FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

	def_object_events
	object_event 17, 24, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkLassText, -1
	object_event 16,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkPokefanFText, -1
	object_event 29, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 28,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event 13, 41, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSchoolgirlEliza, -1
	object_event 12, 41, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSchoolboyJohnny, -1
	object_event 19, 41, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkTeacher2Text, -1
	pokemon_event 28, 40, PERSIAN, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, NationalParkPersianText, -1
	object_event 29, 23, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event 20, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 18,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanmWilliam, -1
	object_event 10, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassKrise, -1
	object_event 28, 13, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBugManiacLou, -1
	object_event  4, 19, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficermKeithScript, -1
	itemball_event 37, 12, SHINY_STONE, 1, EVENT_NATIONAL_PARK_SHINY_STONE
	tmhmball_event  3, 43, TM_DIG, EVENT_NATIONAL_PARK_TM_DIG

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftruefwd .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalsefwd .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	endtext

OfficermKeithScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficermKeithDaytimeText
	checkevent EVENT_BEAT_OFFICERM_KEITH
	iftrue_jumptextfaceplayer OfficermKeithAfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficermKeithSeenText
	waitbutton
	closetext
	winlosstext OfficermKeithWinText, 0
	loadtrainer OFFICERM, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERM_KEITH
	endtext

GenericTrainerBugManiacLou:
	generictrainer BUG_MANIAC, LOU, EVENT_BEAT_BUG_MANIAC_LOU, BugManiacLouSeenText, BugManiacLouBeatenText

	text "Antes era solo un"
	line "Insectólogo,"

	para "pero evolucioné a"
	line "Entomólogo!"
	done

GenericTrainerSchoolgirlEliza:
	generictrainer SCHOOLGIRL, ELIZA, EVENT_BEAT_SCHOOLGIRL_ELIZA, SchoolgirlElizaSeenText, SchoolgirlElizaBeatenText

	text "¡No me importa!"
	line "Sigo queriendo"
	cont "a Oddish."
	done

GenericTrainerSchoolboyJohnny:
	generictrainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText

	text "Bueno, yo"
	line "sigo prefiriendo"
	cont "a Bellsprout."
	done

NationalParkGameboyKidScript:
	showtextfaceplayer NationalParkGameboyKidText
	turnobject LAST_TALKED, DOWN
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, SchoolboyJack1Script

SchoolboyJack1Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	opentext
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftruefwd .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext SchoolboyJackTradeMonText
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername SCHOOLBOY, JACK1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	readmem wJackFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 1
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 2
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 3
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 4
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.RematchStd:
	jumpstd rematchm

GenericTrainerPokefanmWilliam:
	generictrainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText

	text "Perdí el combate,"
	line "pero mis #mon"
	cont "ganan el premio"

	para "a ser los más"
	line "adorables."
	done

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, PokefanfBeverly1Script

PokefanfBeverly1Script:
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftruefwd .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftruefwd .NumberAccepted
	checkpoke MARILL
	iffalsefwd .NoMarill
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PokefanBeverlyCuteMonText
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEFANF, BEVERLY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalsefwd .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoMarill:
	jumpthisopenedtext

	text "Mi amiga tiene"
	line "un Marill!"

	para "Me parecen"
	line "adorables."

	para "Ojalá tuviera"
	line "un Marill…"
	done

.AskNumber1:
	jumpstd asknumber1f

.AskNumber2:
	jumpstd asknumber2f

.RegisteredNumber:
	jumpstd registerednumberf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

.Gift:
	jumpstd giftf

.PackFull:
	jumpstd packfullf

GenericTrainerLassKrise:
	generictrainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText

	text "Pensé que me"
	line "mirabas porque"
	cont "soy mona!"
	done

NationalParkLassText:
	text "¡Mira mi"
	line "mochila!"

	para "Le puse mis"
	line "Medallas."
	done

NationalParkPokefanFText:
	text "Esta es una Carta"
	line "de mi hija."
	cont "Me anima mucho."
	done

NationalParkTeacher1Text:
	text "Prestad atención,"
	line "¡por favor!"

	para "…Uy, tengo que"
	line "dejar de pensar"

	para "como profesora"
	line "todo el rato."

	para "Debes ser un"
	line "entrenador #mon"

	para "Te esfuerzas tanto"
	line "que quiero"
	cont "regalarte esto."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Deja que #mon"
	line "lleve esa Garra"
	cont "Rápida."

	para "A veces atacará"
	line "primero durante"
	cont "el combate."
	done

SchoolgirlElizaSeenText:
	text "¡Oddish es"
	line "el más mono!"

	para "¿No crees?"
	done

SchoolgirlElizaBeatenText:
	text "Mi pobre Oddish…"
	done

SchoolboyJohnnySeenText:
	text "¡Bellsprout es"
	line "el más chulo!"

	para "¿A que sí?"
	done

SchoolboyJohnnyBeatenText:
	text "Bellsprout, no…"
	done

NationalParkTeacher2Text:
	text "Esos niños"
	line "deberían combatir"
	cont "en la hierba."

	para "Molestan mi"
	line "tranquilo paseo…"
	done

NationalParkPersianText:
	text "Persian: Fufushaa!"
	done

NationalParkGameboyKidText:
	text "Estudio mi"
	line "#dex."

	para "Quiero completar"
	line "una #-"

	para "dex viva con uno"
	line "de cada #mon."
	done

SchoolboyJack1SeenText:
	text "El mundo de los"
	line "#mon es"
	cont "profundo."

	para "Aún hay muchas"
	line "cosas que no"
	cont "sabemos."

	para "¡Pero yo sé más"
	line "que tú!"
	done

SchoolboyJack1BeatenText:
	text "¿Qu-qué?"
	done

SchoolboyJackTradeMonText:
	text "Hay mucho que"
	line "aprender."

	para "Por ejemplo…"

	para "Hay {d:NUM_TMS} tipos"
	line "de MT."

	para "Los #mon"
	line "cambiados suben"
	cont "de nivel más"
	cont "rápido."
	done

PokefanfBeverly1SeenText:
	text "Mis #mon son"
	line "un encanto."

	para "Os contaré lo"
	line "orgullosa que"
	cont "estoy de mis"
	cont "encantos."
	done

PokefanfBeverly1BeatenText:
	text "Te gano en"
	line "orgullo, pero…"
	done

PokefanBeverlyCuteMonText:
	text "Debo decir que tus"
	line "#mon también"
	cont "son monos."
	done

PokefanmWilliamSeenText:
	text "Adoramos a"
	line "nuestros #mon,"
	cont "aunque no nos"
	cont "quieran."

	para "Eso es ser un"
	line "fan."
	done

PokefanmWilliamBeatenText:
	text "¡M-mi #mon!"
	done


LassKriseSeenText:
	text "¿Hola? ¿Por qué"
	line "me miras?"

	para "¿Un combate?"
	done

LassKriseBeatenText: ; text > text
	text "…Mmm…"
	done

BugManiacLouSeenText:
	text "¡Nadie supera mi"
	line "pasión por los"
	cont "#mon Bicho!"
	done

BugManiacLouBeatenText:
	text "¿Cómo puede ser?!"
	done

OfficermKeithSeenText:
	text "¡Alto! ¿Qué haces"
	line "fuera tan"
	cont "tarde?"
	done

OfficermKeithWinText:
	text "¡Sabes defenderte"
	line "muy bien!"
	done

OfficermKeithAfterText:
	text "El parque abre"
	line "de noche,"

	para "porque agentes"
	line "como yo lo"
	cont "mantienen a salvo!"
	done

OfficermKeithDaytimeText:
	text "¿Disfrutando"
	line "del parque?"

	para "Lleva siempre un"
	line "#mon contigo"

	para "si vas a la"
	line "hierba alta!"
	done

NationalParkRelaxationSquareText:
	text "Plaza de Descanso"
	line "Parque Nacional"
	done

NationalParkBattleNoticeText:
	text "¿Qué dice este"
	line "cartel?"

	para "Combate solo en"
	line "la hierba."

	para "Oficina del"
	line "Guarda del"
	cont "Parque Nacional"
	done

NationalParkTrainerTipsText:
	text "Consejos de"
	line "entrenador"

	para "Los #mon son"
	line "más felices con"

	para "cortes de pelo,"
	line "bendiciones,"
	cont "fotos y otros"
	cont "detalles."
	done
