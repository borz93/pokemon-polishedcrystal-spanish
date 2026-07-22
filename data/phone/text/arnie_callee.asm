ArnieAnswerPhoneText:
	text "Sí, diga."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "…¿Eh, <PLAYER>?"
	line "¡Qué pasa!"
	done

ArnieAnswerPhoneDayText:
	text "Sí, diga, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "…¿Eh, <PLAYER>?"
	line "¡Qué pasa!"
	done

ArnieAnswerPhoneNiteText:
	text "Sí, diga, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "…¿Eh, <PLAYER>?"
	line "¡Qué pasa!"
	done

ArnieGreetText:
	text "¿Diga?"
	line ""
	text_ram wStringBuffer3
	text " al habla."

	para "¿Qué haces,"
	line "<PLAYER>?"
	done

ArnieGreetDayText:
	text "¿Diga?"
	line ""
	text_ram wStringBuffer3
	text " al habla."

	para "¿Dónde estás"
	line "ahora, <PLAYER>?"
	done

ArnieGreetNiteText:
	text "¿Diga?"
	line ""
	text_ram wStringBuffer3
	text " al habla."

	para "¿Estás despierto"
	line "ya, <PLAYER>?"
	done

ArnieGenericText:
	text "Seguro que tus"
	line "#mon son mucho"
	cont "más fuertes que"
	cont "antes."
	done
