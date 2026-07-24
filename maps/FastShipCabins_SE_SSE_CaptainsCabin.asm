FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SSAquaGranddaughterHadFunText, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND

	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2

SSAquaCaptain:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer SSAquaCaptainHowDoYouLikeText
	jumpthistextfaceplayer

	text "¡Uf! Gracias por"
	line "acompañarme."

	para "Mantener"
	line "entretenida a esa"
	cont "niña ha sido"
	cont "agotador."
	done

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	showtext SSAquaGranddaughterCaptainPlayWithMeText
	showtextfaceplayer SSAquaGranddaughterHasToFindGrandpaText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	callasm DisableDynPalUpdates
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	loadmem wObject1Palette, 1
	callasm SetBlackObjectPals
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	callasm FadeInPalettes_EnableDynNoApply
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	showtext SSAquaGranddaughterWasPlayingText
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applyonemovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, step_down
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjumpfwd SSAquaMachoBraceAndDocking

SSAquaGrandpa:
	checkevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	iftrue_jumptextfaceplayer SSAquaGrandpaTravellingText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftruefwd SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMachoBraceAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .FailedMachoBrace
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	sjumpfwd .ContinueDocking
.FailedMachoBrace:
	writetext .NoRoomForMachoBrace
	waitbutton
.ContinueDocking:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	endtext

.NoRoomForMachoBrace:
	text "¡Pero no puedes"
	line "llevarlo! Lo"
	cont "guardaré para"
	cont "otro viaje."
	done

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalse_endtext
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	endtext

GenericTrainerPokefanmColin:
	generictrainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText

	text "¿Viajas tú solo?"

	para "¿No está"
	line "preocupada tu"
	cont "madre?"
	done

GenericTrainerTwinsMegandpeg1:
	generictrainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText

	text "¡Es una grosería"
	line "llamarnos bebés a"
	cont "nosotras!"
	done

GenericTrainerTwinsMegandpeg2:
	generictrainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText

	text "¡A veces los niños"
	line "son más listos que"
	cont "los adultos!"
	done

GenericTrainerPsychicRodney:
	generictrainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText

	text "Ya veo. Puedes oír"
	line "la radio de Johto"
	cont "en el Barco"
	cont "Rápido."
	done

GenericTrainerPokefanmJeremy:
	generictrainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText

	text "Tengo que ir al"
	line "Salón #mon a"
	cont "arreglarlos bien."
	done

GenericTrainerPokefanfGeorgia:
	generictrainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText

	text "¡Ah, sí! ¡Tengo"
	line "que recoger a mi"
	cont "#mon de la"
	cont "Guardería!"
	done

GenericTrainerSupernerdShawn:
	generictrainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText

	text "Deberías usar la"
	line "Ball correcta para"
	cont "cada situación."
	done

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step_up
	step_up
	turn_head_left
	step_end


SSAquaCaptainHowDoYouLikeText:
	text "¿Qué te parece el"
	line "viaje del"
	cont "S.S.Aqua?"

	para "Prácticamente"
	line "patina sobre las"
	cont "olas."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, hola…"

	para "Todavía no"
	line "encuentro a mi"
	cont "nieta."

	para "Si está en el"
	line "barco, no pasa"
	cont "nada."

	para "Es una niña muy"
	line "activa, así que"

	para "puede estar"
	line "molestando a"
	cont "alguien. Estoy"
	cont "preocupado…"
	done

SSAquaEntertainedGranddaughterText:
	text "¿<PLAYER>, no?"
	line "Me han dicho que"
	cont "entretuviste a mi"
	cont "nieta."

	para "Quiero darte las"
	line "gracias por eso."
	done

SSAquaGrandpaHaveThisText:
	text "¡Ya sé! ¡Quiero"
	line "que tengas esto!"
	done

SSAquaGrandpaTravellingText:
	text "Estamos viajando"
	line "por todo el mundo."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "Capitán, ¿Juegas"
	line "conmigo, por"
	cont "favor?"

	para "¡Me aburro!"
	line "¡Quiero jugar más!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "¡Hola! ¿Jugarás"
	line "conmigo?"

	para "…¡Ah!"

	para "¿Mi abuelo está"
	line "preocupado por"
	cont "mí?"

	para "¡Tengo que irme!"

	para "¡Tengo que ir a"
	line "buscar al abuelo!"
	done

SSAquaGranddaughterWasPlayingText:
	text "¡Abuelo, aquí"
	line "estoy! ¡Estaba"

	para "jugando con el"
	line "Capitán y con este"
	cont "niño grande!"
	done

SSAquaGranddaughterHadFunText:
	text "¡Me lo pasé genial"
	line "jugando!"
	done

PokefanmColinSeenText:
	text "¡Oye, chaval!"
	line "¿Combatimos?"
	done

PokefanmColinBeatenText:
	text "¡Eres fuerte!"
	done

TwinsMegandpeg1SeenText:
	text "¿Crees que soy un"
	line "bebé?"
	cont "¡Eso no es justo!"
	done

TwinsMegandpeg1BeatenText:
	text "¡Oh! ¡Perdimos!"
	done

TwinsMegandpeg2SeenText:
	text "¡No soy un bebé!"

	para "¡No está bien"
	line "decirle eso a una"
	cont "dama!"
	done

TwinsMegandpeg2BeatenText:
	text "¡Oh! ¡Perdimos!"
	done

PsychicRodneySeenText:
	text "¡Chis! ¡Mi cerebro"
	line "capta señales de"
	cont "radio!"
	done

PsychicRodneyBeatenText:
	text "…¡Oigo algo!"
	done

PokefanmJeremySeenText:
	text "¿Qué te parece?"
	line "Mis #mon son"
	cont "preciosos, ¿No?"
	done

PokefanmJeremyBeatenText:
	text "¡Oh, no! ¡Mis"
	line "hermosos #mon!"
	done

PokefanfGeorgiaSeenText:
	text "Voy a comprar en"
	line "los Grandes"
	cont "Almacenes y"
	cont "luego…"
	done

PokefanfGeorgiaBeatenText:
	text "¿Qué iba a hacer?"
	done

SupernerdShawnSeenText:
	text "¿Qué tipos de"
	line "Balls llevas"
	cont "contigo?"
	done

SupernerdShawnBeatenText:
	text "¡Espera! ¡Alto!"
	line "¡No! ¡Por favor!"
	done

SSAquaHasArrivedVermilionText:
	text "El Barco Rápido"
	line "S.S.Aqua ha"
	cont "llegado a Ciudad"
	cont "Carmín."
	done
