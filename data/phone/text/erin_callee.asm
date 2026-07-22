ErinAnswerPhoneText:
	text "Sí, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ah hola, <PLAYER>!"
	line "¡Buenos días!"
	done

ErinAnswerPhoneDayText:
	text "Sí, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ah hola, <PLAYER>!"
	line "¡Yuju!"
	done

ErinAnswerPhoneNiteText:
	text "Sí, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ah hola, <PLAYER>!"
	done

ErinGreetText:
	text "¡<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "!"
	line "¡Buenos días!"
	done

ErinGreetDayText:
	text "¡<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "!"
	line "¿Entrenando duro?"
	done

ErinGreetNiteText:
	text "¡<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "!"
	line "¿Estabas"
	cont "despierto?"
	done

ErinGenericText:
	text "¿Estás criando"
	line "a tus #mon?"

	para "Oye, el "
	text_ram wStringBuffer4
	text " de"
	line ""
	text_ram wStringBuffer3
	text " se ve"
	cont "genial!"
	done
