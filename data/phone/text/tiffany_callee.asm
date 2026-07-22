TiffanyAnswerPhoneText:
	text "¿Sí? Soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAYER>."
	line "Buenos días."
	done

TiffanyAnswerPhoneDayText:
	text "¿Sí? Soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAYER>."
	line "Hola."
	done

TiffanyAnswerPhoneNiteText:
	text "¿Sí? Soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAYER>,"
	line "buenas noches."
	done

TiffanyGreetText:
	text "¿Eres <PLAYER>?"

	para "Buenos días. Soy"
	line ""
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetDayText:
	text "¿Eres <PLAYER>?"

	para "Hola, soy "
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetNiteText:
	text "¿Eres <PLAYER>?"

	para "Buenas noches."
	line "Soy "
	text_ram wStringBuffer3
	text "."
	done

TiffanyGenericText:
	text "¿Están bien tus"
	line "#mon?"

	para "Espero que los"
	line "lleves a un"
	cont "Centro #mon"
	cont "cada día."

	para "No los fuerces"
	line "demasiado."

	para "Mi "
	text_ram wStringBuffer4
	text " es"
	line "mona y alegre"

	para "justo porque la"
	line "llevo a un"

	para "Centro #mon"
	line "cada día."
	done
