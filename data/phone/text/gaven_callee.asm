GavenAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text ", al habla…"

	para "¡Hola, <PLAYER>!"
	line "¡Buenos días!"
	done

GavenAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text ", al habla…"

	para "¡Hola, <PLAYER>!"
	done

GavenAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text ", al habla…"

	para "¡Hola, <PLAYER>!"
	line "¡Buenas noches!"
	done

GavenGreetText:
	text "<PLAYER>, ¡buenos"
	line "días!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

GavenGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

GavenGreetNiteText:
	text "<PLAYER>, ¡buenas"
	line "noches!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Qué tal estás?"
	done

GavenGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " sigue"
	line "genial como"
	cont "siempre."

	para "¡Sigamos así y"
	line "seremos"
	cont "Campeones #mon!"
	done
