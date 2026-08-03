WadeAnswerPhoneText:
	text "¿Diga? Soy"
	line ""
	text_ram wStringBuffer3
	text ", al habla."

	para "¡Ah hola, <PLAYER>!"
	line "¡Buenos días!"
	done

WadeAnswerPhoneDayText:
	text "¿Diga? Soy"
	line ""
	text_ram wStringBuffer3
	text ", al habla."

	para "¡Ah hola, <PLAYER>!"
	done

WadeAnswerPhoneNiteText:
	text "¿Diga? Soy"
	line ""
	text_ram wStringBuffer3
	text ", al habla."

	para "¡Ah hola, <PLAYER>!"
	line "¡Buenas noches!"
	done

WadeGreetText:
	text "<PLAYER>, ¡buenos"
	line "días!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿A que hace"
	cont "buen día?"
	done

WadeGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿A que hace"
	cont "buen día?"
	done

WadeGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Despierto?"
	done

WadeGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mis #mon"
	line "tienen mucha"
	cont "energía de más."

	para "Es un problema."

	para "De todos mis"
	line "#mon,"
	cont ""
	text_ram wStringBuffer4
	text " es el"
	cont "más difícil."

	para "Trabajar con"
	line "él agota."
	done
