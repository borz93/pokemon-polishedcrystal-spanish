Route38_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 33,  7, BGEVENT_JUMPTEXT, Route38SignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route38TrainerTipsText
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route38AdvancedTipsText

	def_object_events
	object_event  4,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 12, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperToby, -1
	object_event 19,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyValencia, -1
	object_event 24,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	fruittree_event 12, 10, FRUITTREE_ROUTE_38, SITRUS_BERRY, PAL_NPC_BROWN
	object_event  5,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1

GenericTrainerBird_keeperToby:
	generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText

	text "Pienso entrenar en"
	line "el Bosque Amarillo"

	para "para enseñar a mi"
	line "#mon a usar"
	cont "Vuelo."
	done

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Todo tipo de"
	line "personas viven"

	para "felices con"
	line "#mon por el"
	cont "mundo."
	done

TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	opentext
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftruefwd .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftruefwd .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftruefwd .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext LassDanaMoomooMilkText
	promptbutton
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForPhoneNumber

.SecondTimeAsking:
	callstd asknumber2f
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .DeclinedPhoneNumber
	gettrainername LASS, DANA1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.DanaRematch:
	callstd rematchf
	winlosstext LassDana1BeatenText, 0
	readmem wDanaFightCount
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
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 1
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 2
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 3
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 4
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.TryGiveThunderstone:
	callstd giftf
	verbosegiveitem THUNDERSTONE
	iffalsefwd .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jumpstd numberacceptedf

.NoRoomForThunderstone:
	jumpstd packfullf

.NumberAccepted:
	jumpstd numberacceptedf

.DeclinedPhoneNumber:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftruefwd .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftruefwd .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskToRegisterNumber

.SecondTimeAsking:
	callstd asknumber2m
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .SaidNo
	gettrainername SCHOOLBOY, CHAD1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChadRematch:
	callstd rematchm
	winlosstext SchoolboyChad1BeatenText, 0
	readmem wChadFightCount
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
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 1
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 2
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 3
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 4
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.HaveChadsNumber:
	jumpstd numberacceptedm

.SaidNo:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerBeautyValencia:
	generictrainer BEAUTY, VALENCIA, EVENT_BEAT_BEAUTY_VALENCIA, BeautyValenciaSeenText, BeautyValenciaBeatenText

	text "Cuando veo"
	line "#mon, parece"
	cont "que calma mis"
	cont "nervios."
	done

GenericTrainerBeautyOlivia:
	generictrainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText

	text "La Leche Mu-mú es"
	line "buena para la"
	cont "belleza y la"
	cont "salud."

	para "¡Me gusta comprar"
	line "una docena de"
	cont "botellas de una"
	cont "vez!"
	done

Bird_keeperTobySeenText:
	text "¡Vuela alto en el"
	line "cielo, mi querido"
	cont "#mon pájaro!"
	done

Bird_keeperTobyBeatenText:
	text "Me dan ganas de"
	line "salir volando."
	done

SchoolboyChad1SeenText:
	text "Voy a probar algo"
	line "que aprendí hoy."
	done

SchoolboyChad1BeatenText:
	text "Creo que no"
	line "estudié lo"
	cont "suficiente."
	done

SchoolboyChadSoManyTestsText:
	text "Tengo que hacer"
	line "tantos exámenes"

	para "que no me queda"
	line "tiempo para los"
	cont "#mon."

	para "Así que cuando"
	line "juego, me"
	cont "concentro mucho."
	done

LassDana1SeenText:
	text "Parece que se te"
	line "dan bien los"
	cont "#mon."

	para "Si es así, ¿Me"
	line "das algún"
	cont "consejo?"
	done

LassDana1BeatenText:
	text "Ya veo. Así que"
	line "así se combate."
	done

LassDanaMoomooMilkText:
	text "¡Sé algo bueno!"

	para "La leche de Granja"
	line "Mu-mú es famosa"
	cont "por su sabor."
	done

BeautyValenciaSeenText:
	text "¡Hola! ¡Qué"
	line "entrenador tan"
	cont "mono!"

	para "¿Puedo ver a tu"
	line "#mon?"
	done

BeautyValenciaBeatenText:
	text "¡Me alegro de"
	line "haber visto a tu"
	cont "#mon!"
	done

SailorHarrySeenText:
	text "He estado en"
	line "ultramar, así que"

	para "¡conozco todo"
	line "tipo de #mon!"
	done

SailorHarryBeatenText:
	text "¡Tu habilidad es"
	line "de nivel mundial!"
	done

BeautyOliviaSeenText:
	text "¿No crees que mi"
	line "#mon y yo somos"
	cont "hermosos?"
	done

BeautyOliviaBeatenText:
	text "Bebemos Leche"
	line "Mu-mú cada día."
	done

Route38SignText:
	text "Ruta 38"

	para "Ciudad Olivo -"
	line "Ciudad Iris"
	done

Route38TrainerTipsText:
	text "Consejos de"
	line "Entrenador"

	para "Si un #mon"
	line "intenta"
	cont "evolucionar,"
	cont "puedes detenerlo."

	para "Pulsa el botón B"
	line "durante la"
	cont "evolución."

	para "Eso asusta al"
	line "#mon y detiene"
	cont "su evolución."
	done

Route38AdvancedTipsText:
	text "¡Consejos"
	line "avanzados!"

	para "¡Pulsa Start en el"
	line "Sistema de"

	para "Almacenamiento de"
	line "la PC para editar"
	cont "el nombre de la"
	cont "Caja al momento!"

	para "¡Puedes cambiar el"
	line "nombre y el tema"
	cont "de cada Caja!"

	para "¡Pulsa Select para"
	line "cambiar lo que"

	para "hace el botón A"
	line "con los #mon!"
	done
