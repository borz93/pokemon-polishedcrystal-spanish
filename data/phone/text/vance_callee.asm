VanceAnswerPhoneText:
	text "¿Sí, diga?"
	line ""
	text_ram wStringBuffer3
	text " aquí!"

	para "¡Buenos días,"
	line "<PLAYER>!"

	para "¿Usas #mon"
	line "pájaro?"
	done

VanceAnswerPhoneDayText:
	text "¿Sí, diga?"
	line ""
	text_ram wStringBuffer3
	text " aquí!"

	para "¡Hola, <PLAYER>!"

	para "¿Vuelan tus"
	line "#mon pájaro?"
	done

VanceAnswerPhoneNiteText:
	text "¿Sí, diga?"
	line ""
	text_ram wStringBuffer3
	text " aquí!"

	para "¡Buenas noches,"
	line "<PLAYER>! ¿Dejas"

	para "que tus #mon"
	line "pájaro luchen?"
	done

VanceGreetText:
	text "¡Buenos días,"
	line "<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "!"
	line "¡Buenos días!"
	done

VanceGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "!"
	line "¿Me recuerdas?"
	done

VanceGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "!"
	line "¿Estás libre?"
	done

VanceGenericText:
	text "¿Tú y tus #mon"
	line "estáis bien?"

	para "Mi "
	text_ram wStringBuffer4
	line "parece que"
	cont "será lo bastante"

	para "fuerte para"
	line "vencer al ave"
	cont "legendaria!"
	done
