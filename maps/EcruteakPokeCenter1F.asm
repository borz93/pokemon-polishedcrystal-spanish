EcruteakPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ECRUTEAK_CITY, 6
	warp_event  6,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMortyScript

	def_object_events
	object_event  6,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FBillScript, EVENT_ECRUTEAK_POKE_CENTER_BILL
	pc_nurse_event  5, 1
	object_event 11,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FPokefanMScript, -1
	object_event 11,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FLassScript, -1
	object_event  1,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FCooltrainerFText, -1
	object_event  8,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FGymGuyText, -1

	object_const_def
	const ECRUTEAKPOKECENTER1F_BILL

PokemonJournalMortyScript:
	setflag ENGINE_READ_MORTY_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡El"
	cont "Líder Morty!"

	para "Morty afirma haber"
	line "visto a Entei una"
	cont "vez. Dice:"

	para "“Fue increíble."
	line "Entei me miró a"
	cont "los ojos."

	para "Nunca olvidaré sus"
	line "ojos. Era como si"

	para "pudiera ver a"
	line "través de mí,"

	para "hasta el fondo de"
	line "mi corazón…”"
	done

EcruteakPokeCenter1FBillScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BILL_INTRO
	iftruefwd .heardintro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_BILL_INTRO
.heardintro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .NoRoom
	givepoke EEVEE, PLAIN_FORM, 5, NO_ITEM, GREAT_BALL
	givepokemail .GiftEeveeMail
	callasm .SetEeveeMailOT
	setevent EVENT_GOT_EEVEE
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement ECRUTEAKPOKECENTER1F_BILL, step_left
.noleftstep
	applymovement ECRUTEAKPOKECENTER1F_BILL, .LeaveMovement
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_NEVER_MET_BILL
	waitsfx
	end

.NoRoom:
	jumpthisopenedtext

	text "¡Vaya, espera! No"
	line "puedes llevar más"
	cont "#mon."
	done

.IntroText:
	text "Hola, soy Bill."
	line "¿Y tú quién eres?"

	para "Hmm, <PLAYER>,"
	line "¿Eh? Has llegado"
	cont "en buen momento."

	para "Las Cápsulas del"
	line "Tiempo están"
	cont "totalmente"
	cont "estropeadas,"

	para "y me vendría bien"
	line "tu ayuda."
	done

.QuestionText:
	text "Bill: Este Eevee"
	line "llegó justo antes"

	para "de que la Cápsula"
	line "del Tiempo se"
	cont "apagara."

	para "Alguien tiene que"
	line "cuidarlo,"

	para "pero a mí no me"
	line "gusta estar al"
	cont "aire libre."

	para "¿Puedo contar"
	line "contigo para"
	cont "jugar con él,"
	cont "<PLAYER>?"
	done

.YesText:
	text "Bill: ¡Sabía que"
	line "no me fallarías!"

	para "¡Genial! ¡Eres de"
	line "los buenos!"

	para "Vale, cuento"
	line "contigo."

	para "¡Cuida bien de"
	line "él!"
	done

.GoodbyeText:
	text "Bill: El Prof.Elm"
	line "dice que Eevee"

	para "podría evolucionar"
	line "de formas nuevas y"
	cont "desconocidas."

	para "Tengo que volver"
	line "corriendo a Ciudad"
	cont "Trigal a ver a mi"
	cont "familia,"

	para "y luego vuelvo a"
	line "Kanto."

	para "¡Hasta luego!"
	done

.NoText:
	text "Oh… ¿Y ahora qué"
	line "hago?"
	done

.LeaveMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

.GiftEeveeMail:
	db   EON_MAIL
	setcharmap no_ngrams
	db   "¡Por favor, cuida"
	next "de este Pokémon!@@"
	setcharmap default

.SetEeveeMailOT:
	ld hl, sPartyMon1MailAuthor
	ld a, [wPartyCount]
	dec a
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	push hl
	pop de
	ld hl, .EeveeMailOTID
	ld bc, .EeveeMailOTIDEnd - .EeveeMailOTID
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	rst CopyBytes
	jmp CloseSRAM

.EeveeMailOTID:
	rawchar "Prof.Oak@@"
	bigdw 00001
.EeveeMailOTIDEnd

EcruteakPokeCenter1FPokefanMScript:
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumptextfaceplayer .SurfText
	jumpthistextfaceplayer

	text "El modo en que"
	line "bailan las Chicas"
	cont "Kimono es"
	cont "maravilloso. Igual"
	cont "que como usan a"
	cont "sus #mon."
	done

.SurfText:
	text "Debes de querer"
	line "combatir contra"
	cont "más gente, ¿No?"

	para "Al parecer hay un"
	line "lugar donde se"
	cont "reúnen los"
	cont "entrenadores."

	para "¿Que dónde?"

	para "Está un poco más"
	line "allá de Ciudad"
	cont "Olivo."
	done

EcruteakPokeCenter1FLassScript:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalsefwd .No
	checkevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	iffalse_jumpopenedtext .HereText
	jumpthisopenedtext

	text "Una vez oí que la"
	line "madre de Bill fue"

	para "una Chica Kimono."
	line "Quizá por eso"

	para "visita aquí tan a"
	line "menudo."
	done

.No:
	checkevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	iffalse_jumpopenedtext .HereText
	jumpthisopenedtext

	text "Oh… Da igual,"
	line "entonces."
	done

.QuestionText:
	text "¿Sabes quién es"
	line "Bill?"
	done

.HereText:
	text "¡Entonces ve a"
	line "hablar con él!"
	cont "¡Está justo al"
	cont "lado del"
	cont "mostrador!"
	done

EcruteakPokeCenter1FCooltrainerFText:
	text "Morty, el Líder"
	line "del Gimnasio, es"
	cont "buenísimo."

	para "Sus #mon"
	line "también son muy"
	cont "fuertes."
	done

EcruteakPokeCenter1FGymGuyText:
	text "Lago de la"
	line "Furia…"

	para "La aparición de un"
	line "enjambre de"
	cont "Gyarados…"

	para "Huelo una"
	line "conspiración. ¡Lo"
	cont "sé!"
	done
