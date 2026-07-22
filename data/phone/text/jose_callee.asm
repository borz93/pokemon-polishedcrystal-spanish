JoseAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¿Ah, <PLAYER>?"
	line "¡Buenos días!"
	done

JoseAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¿Ah, <PLAYER>?"
	line "¡Hola!"
	done

JoseAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¿Ah, <PLAYER>?"
	line "¡Buenas noches!"
	done

JoseGreetText:
	text "¿Ah, <PLAYER>?"

	para "¡Pío! Sí, soy"
	line ""
	text_ram wStringBuffer3
	text "."
	done

JoseGreetDayText:
	text "¿Ah, <PLAYER>?"

	para "¡Pío! Sí, soy"
	line ""
	text_ram wStringBuffer3
	text "."
	done

JoseGreetNiteText:
	text "¿Ah, <PLAYER>?"

	para "¡Pío! Sí, soy"
	line ""
	text_ram wStringBuffer3
	text "."
	done

JoseGenericText:
	text "¿Siguen tus"
	line "#mon en forma?"

	para "Mi "
	text_ram wStringBuffer4
	text " tiene"
	line "demasiada"
	cont "energía."

	para "Cuando despega,"
	line "no vuelve"
	cont "en un rato."
	done
