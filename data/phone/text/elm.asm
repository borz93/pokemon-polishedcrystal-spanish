ElmPhoneStartText:
	text "¿Diga, <PLAYER>?"

	para "No te esfuerces"
	line "demasiado."

	para "Asegúrate de"
	line "curar a tus"
	cont "#mon si están"
	cont "heridos."
	done

ElmPhoneSawMrPokemonText:
	text "¿Diga, <PLAYER>?"

	para "¿Viste al Sr."
	line "#mon? ¡Genial!"
	cont "¡Vuelve sano y"
	cont "salvo!"
	done

ElmPhonePokemonStolenText:
	text "¿<PLAYER>? Estoy"
	line "muy disgustado."

	para "Nos robaron un"
	line "#mon de aquí."

	para "¿Cómo puede"
	line "alguien hacer"
	cont "eso?"
	prompt

ElmPhoneCheckingEggText:
	text "¿Diga, <PLAYER>?"

	para "Estamos"
	line "revisando el"
	cont "Huevo. Parece"

	para "ser un Huevo"
	line "#mon."
	prompt

ElmPhoneAssistantText:
	text "¿Diga, <PLAYER>?"

	para "¿Viste a mi"
	line "ayudante? Está"

	para "en el Centro"
	line "#mon de Ciudad"
	cont "Malva."
	done

ElmPhoneEggUnhatchedText:
	text "¿Diga, <PLAYER>?"

	para "¿Cómo va el"
	line "Huevo? ¿Cambió"
	cont "algo?"

	para "Si pasa algo,"
	line "llámame, por"
	cont "favor."
	prompt

ElmPhoneEggHatchedText:
	text "¿Diga, <PLAYER>?"
	line "¿Qué tal el Huevo?"

	para "¿Qué? ¿Se abrió?"
	line "¡Vaya! ¿Qué"
	cont "#mon es?"

	para "¡Ven a"
	line "enseñármelo ya!"
	prompt

ElmPhoneDiscovery1Text:
	text "¿Diga, <PLAYER>?"

	para "Acabo de hacer"
	line "un"
	cont "descubrimiento."

	para "El tiempo que"
	line "tarda un Huevo"
	cont "en eclosionar"
	cont "depende del"
	cont "#mon."
	prompt

ElmPhoneDiscovery2Text:
	text "¿Diga, <PLAYER>?"

	para "Sigue siendo un"
	line "misterio qué"

	para "movimientos"
	line "tienen los #mon"
	cont "al eclosionar."

	para "Lo estamos"
	line "investigando."
	prompt

ElmPhonePokerusText:
	text "¿Diga, <PLAYER>?"

	para "Descubrí algo"
	line "raro."

	para "Al parecer hay"
	line "algo llamado"

	para "#rus infecta"
	line "a los #mon."

	para "Sí, es como un"
	line "virus, así que"
	cont "se llama #rus."

	para "Se multiplica"
	line "rápido e infecta"
	cont "a otros #mon"
	cont "también."

	para "No parece hacer"
	line "nada, y"
	cont "desaparece con"
	cont "el tiempo."

	para "Supongo que no"
	line "hay de qué"
	cont "preocuparse."
	cont "¡Adiós!"
	done

ElmPhoneDisasterText:
	text "¿D-diga? <PLAYER>?"
	line "¡Es un desastre!"

	para "Ay, ay, es"
	line "terrible!"

	para "¿Qué hago?"
	line "Es… ¡Oh, no…"

	para "¡Vuelve aquí ya!"
	done

ElmPhoneEggAssistantText:
	text "¿Diga, <PLAYER>?"
	line "Descubrimos"
	cont "algo sobre el"
	cont "Huevo!"

	para "Mi ayudante está"
	line "en el Centro"
	cont "#mon de Ciudad"

	para "Malva."
	line "¿Podrías hablar"
	cont "con él?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, ¿Cómo"
	line "va todo?"

	para "Te llamo porque"
	line "pasa algo raro"
	cont "con las radios."

	para "Hablaban del"
	line "Team Rocket."

	para "<PLAYER>, ¿Sabes"
	line "algo de eso?"

	para "Quizá el Team"
	line "Rocket ha"
	cont "vuelto. No,"

	para "eso no puede"
	line "ser verdad."

	para "Siento"
	line "molestarte."
	cont "¡Cuídate!"
	done

ElmPhoneGiftText:
	text "¿Diga, <PLAYER>?"

	para "Tengo algo aquí"
	line "para ti."

	para "¿Podrías pasarte"
	line "por mi Lab?"

	para "¡Hasta luego!"
	done

ElmPhoneEvolutionQuestionText:
	text "Por cierto,"
	line "<PLAYER>, ¿Quieres"

	para "saber cómo"
	line "evoluciona tu"
	cont "#mon?"
	done

ElmPhoneEvoText_None:
	text "Pues "
	text_ram wStringBuffer3
	line "no evoluciona!"
	prompt

ElmPhoneEvoText_Level:
	text_ram wStringBuffer3
	line "evoluciona en"
	cont "nivel "
	text_decimal wStringBuffer4, 1, 3
	text "."
	prompt

ElmPhoneEvoText_Item:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a:"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeNoItem:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "intercambiarlo,"

	para "o al exponerse"
	line "a:"
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeWithItem:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "intercambiarlo,"

	para "o al subir de"
	line "nivel portando:"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "portando:"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding_MornDay:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "portando:"
	line ""
	text_ram wStringBuffer4
	text ","

	para "pero solo de"
	line "día."
	prompt

ElmPhoneEvoText_Holding_EveNite:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "portando:"
	line ""
	text_ram wStringBuffer4
	text ","

	para "pero solo de"
	line "noche."
	prompt

ElmPhoneEvoText_Happiness:
	text_ram wStringBuffer3
	line "evoluciona si es"
	cont "muy feliz!"
	prompt

ElmPhoneEvoText_Happiness_MornDay:
	text_ram wStringBuffer3
	line "evoluciona si es"
	cont "muy feliz, pero"

	para "solo de día."
	prompt

ElmPhoneEvoText_Happiness_EveNite:
	text_ram wStringBuffer3
	line "evoluciona si es"
	cont "muy feliz, pero"

	para "solo de noche."
	prompt

ElmPhoneEvoText_Stat:
	text_ram wStringBuffer3
	line "evoluciona en"
	cont "nivel "
	text_decimal wStringBuffer4, 1, 3
	text ", pero en qué"

	para "depende de su"
	line "Ataque y"

	para "Defensa."
	prompt

ElmPhoneEvoText_Location:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "subir de nivel"
	line "en:"
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Move:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "subir de nivel"
	line "sabiendo usar:"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Crit:
	text_ram wStringBuffer3
	line "evoluciona tras"

	para "dar tres golpes"
	line "críticos en un"
	cont "combate."
	prompt

ElmPhoneEvoText_Party:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "teniendo un"
	line ""
	text_ram wStringBuffer4
	text ""
	cont "también en tu"
	cont "equipo."
	prompt

ElmPhoneEvoText_Egg:
	text "¡Los Huevos no"
	line "evolucionan,"
	cont "eclosionan!"
	prompt

ElmPhoneEvoText_Pikachu:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "Piedra Trueno"
	cont "un Suvenir Raro."
	prompt

ElmPhoneEvoText_Gloom:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "Piedra Hoja o"
	cont "Piedra Solar."
	prompt

ElmPhoneEvoText_Poliwhirl:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "Piedra Agua, o"

	para "portando Roca del"
	line "Rey al ser"

	para "intercambiado, o"
	line "al subir de nivel."
	prompt

ElmPhoneEvoText_SlowpokePlain:
ElmPhoneEvoText_SlowpokeGalarian:
	text_ram wStringBuffer3
	line "evoluciona en"
	cont "nivel 37, o al"

	para "portar Roca del"
	line "Rey al ser"
	cont "intercambiado o"
	cont "al subir de"
	cont "nivel."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "Piedra Truen, o"

	para "al subir de"
	line "nivel en un"
	cont "campo magnético."

	para "Dicen que el"
	line "Túnel Imán y la"
	cont "Cueva Tenue lo"
	cont "tienen."
	prompt

ElmPhoneEvoText_Exeggcute:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "Piedra Hoja o"
	cont "un Suvenir Raro."
	prompt

ElmPhoneEvoText_Koffing:
	text_ram wStringBuffer3
	line "evoluciona en"
	cont "nivel 35, o al"

	para "portar Carbón"
	line "al ser"
	cont "intercambiado o"
	cont "al subir de"
	cont "nivel."
	prompt

ElmPhoneEvoText_Cubone:
	text_ram wStringBuffer3
	line "evoluciona en"
	cont "nivel 28, o al"

	para "exponerse a un"
	line "Suvenir Raro."
	prompt

ElmPhoneEvoText_Scyther:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "portando Metal"
	line "Recub. o Piedra"
	cont "Dura."

	para "El Metal Recub."
	line "también sirve al"
	cont "intercambiarlo."
	prompt

ElmPhoneEvoText_Eevee:
	text_ram wStringBuffer3
	line "evoluciona de"
	cont "muchas formas!"

	para "Puede exponerse"
	line "a ocho Piedras"
	cont "distintas,"

	para "o subir de nivel"
	line "cerca de una"
	cont "Roca Musgo o"
	cont "una Roca Hielo."

	para "Dicen que hay en"
	line "el Encinar y en"
	cont "la Ruta Helada."

	para "Pero también,"
	line "Eevee evoluciona"
	cont "con el sol o la"
	cont "luna si es muy"
	cont "feliz!"
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "Piedra Hielo, o"

	para "al subir de"
	line "nivel cerca de"
	cont "una Roca Hielo."

	para "Dicen que hay"
	line "una en la Ruta"
	cont "Helada."
	prompt

ElmPhoneEvoText_Stantler:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a"
	line "fuerte granizo"
	cont "o arena."

	para "Dicen que el"
	line "Camino"
	cont "Escarpado y el"
	cont "Monte Nevado"
	cont "tienen ese clima."
	prompt

ElmPhoneEvoText_AncientSinnoh:
	text "Pero según su"
	line "ascendencia,"

	para "también podría"
	line "evolucionar"

	para "al recordar de"
	line "algún modo al"
	cont "antiguo Sinnoh…"
	prompt

ElmPhoneEvoText_DunsparceSegments:
	text "Algunos acaban"
	line "siendo más"
	cont "largos que"
	cont "otros."

	para "Es cosa de sus"
	line "genes."
	prompt

ElmPhoneEvolutionRefusedText:
	text "Perdona la"
	line "molestia,"
	cont "entonces."
	prompt

ElmPhoneEndText:
	text "¡Cuídate!"
	done
