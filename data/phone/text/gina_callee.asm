GinaAnswerPhoneText:
	text "¿Diga? Soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ay, <PLAYER>!"
	line "¡Buenos días!"
	done

GinaAnswerPhoneDayText:
	text "¿Diga? Soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ay, <PLAYER>!"
	line "Hola, ¿qué tal?"
	done

GinaAnswerPhoneNiteText:
	text "¿Diga? Soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ay, <PLAYER>!"
	line "¡Buenas noches!"
	done

GinaGreetText:
	text "¿<PLAYER>?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¡Buenos días!"
	done

GinaGreetDayText:
	text "¿<PLAYER>?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Vengo en mal"
	cont "momento?"
	done

GinaGreetNiteText:
	text "¿<PLAYER>?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Tienes tiempo"
	cont "para hablar?"
	done

GinaGenericText:
	text "¿Siguen fuertes"
	line "tus #mon?"

	para "Entreno cada"
	line "día con "
	text_ram wStringBuffer4
	text "."
	done
