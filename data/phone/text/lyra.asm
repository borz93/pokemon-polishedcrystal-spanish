LyraPhoneGreetingText_Morn:
	text "¡Ah, <PLAYER>!"
	line "¡Buenos días!"
	prompt

LyraPhoneGreetingText_Day:
	text "¡Ah, <PLAYER>!"
	line "¿Cómo estás?"
	prompt

LyraPhoneGreetingText_Eve:
	text "¡Ah, <PLAYER>!"
	line "¡Buenas tardes!"
	prompt

LyraPhoneGreetingText_Nite:
	text "…¡<PLAYER>!"
	line "¡Buenas noches!"
	cont "Trasnochando, ¿eh?"
	prompt

LyraPhoneLandmarkText:
	text "¿Dónde estás?"
	line ""
	text_ram wStringBuffer4
	text "?"
	prompt

LyraPhoneKantoText:
	text "¡Así que estás en"
	line "Kanto!"
	prompt

LyraPhoneIslandsText:
	text "Estás explorando"
	line "una isla"
	cont "tropical…"

	para "¡Qué envidia,"
	line "<PLAYER>!"
	prompt

LyraPhoneJohtoText_Generic:
	text "Cuéntamelo todo"
	line "luego, ¿vale?"
	prompt

LyraPhoneNextMoveQuestionText:
	text "Bueno, <PLAYER>…"

	para "¿Quieres que te"
	line "diga cuándo tu"

	para "#mon aprenderá"
	line "su próximo"
	cont "movimiento?"
	done

LyraPhoneNextMoveRefusedText:
	text "Jaja, ¡entonces no"
	line "te lo diré!"
	prompt

LyraPhoneNextMoveLevelText:
	text_ram wStringBuffer3
	line "aprenderá su"
	cont "próximo"
	cont "movimiento en"
	cont "el nivel "
	text_decimal hScriptVar, 1, 3
	text ":"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

LyraPhoneNoNextMoveText:
	text_ram wStringBuffer3
	line "no aprenderá"

	para "más movimientos"
	line "al subir de"
	cont "nivel."
	prompt

LyraPhoneNoEggMovesText:
	text "¡Los Huevos no"
	line "aprenden"
	cont "movimientos!"
	cont "…¿O sí?"
	prompt

LyraPhoneEndText:
	text "Bueno… Qué bien"
	line "hablar contigo,"
	cont "<PLAYER>."

	para "¡Llámame otra"
	line "vez!"
	done

LyraPhoneSpecialText_YellowForest:
	text "¡Hola, <PLAYER>!"
	line "¿Cómo estás?"

	para "¿Has ido a ver el"
	line "Bosque Amarillo?"

	para "Iba a ir, pero oí"
	line "que el Team Rocket"

	para "andaba tramando"
	line "algo allí."

	para "¡No quiero"
	line "meterme en eso!"

	para "Ya te has"
	line "enfrentado al"
	cont "Team Rocket antes,"

	para "¿verdad,"
	line "<PLAYER>?"

	para "¡Qué valiente"
	line "eres!"

	para "Bueno, ¡buena"
	line "suerte en tu"
	cont "viaje!"
	done

LyraPhoneSpecialText_FirstBadge:
	text "¡<PLAYER>! ¡Hola!"

	para "¡Conseguí mi"
	line "primera Medalla!"

	para "El Pidgeot de"
	line "Falkner es fuerte,"
	cont "¡pero le gané!"

	para "Tenía que"
	line "contártelo,"
	cont "<PLAYER>."

	para "Ah, ¿tú tienes tu"
	line "primera Medalla de"
	cont "Kanto? ¡Muy bien!"

	para "Sigamos ganando"
	line "Medallas."

	para "¡Nos vemos en la"
	line "Liga!"
	done

LyraPhoneSpecialText_LyrasEgg:
	text "¡<PLAYER>! ¡Hola!"

	para "¿Vas bien contra"
	line "los Líderes de"
	cont "Kanto?"

	para "¡Seguro que sí!"

	para "¡Escucha, escucha!"

	para "Dejé a mi "
	text_ram wStringBuffer4
	line "en la"
	cont "Guardería"

	para "con la abuela y el"
	line "abuelo, ¡y"
	cont "encontraron un"
	cont "Huevo!"

	para "¿A que es genial?"

	para "Estoy criando un"
	line "equipo completo de"
	cont "#mon,"

	para "así que, si"
	line "quieres tenerlo…"

	para "Bueno… Dejé el"
	line "Huevo en la"

	para "Guardería por si"
	line "lo quieres!"

	para "Sé que lo"
	line "cuidarás bien,"
	cont "<PLAYER>."

	para "¡Adiós!"
	done
