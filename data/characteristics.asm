Characteristics:
	table_width 2
	dw .Chara_HP0
	dw .Chara_HP1
	dw .Chara_HP2
	dw .Chara_HP3
	dw .Chara_HP4
	dw .Chara_Atk0
	dw .Chara_Atk1
	dw .Chara_Atk2
	dw .Chara_Atk3
	dw .Chara_Atk4
	dw .Chara_Def0
	dw .Chara_Def1
	dw .Chara_Def2
	dw .Chara_Def3
	dw .Chara_Def4
	dw .Chara_SAt0
	dw .Chara_SAt1
	dw .Chara_SAt2
	dw .Chara_SAt3
	dw .Chara_SAt4
	dw .Chara_SDf0
	dw .Chara_SDf1
	dw .Chara_SDf2
	dw .Chara_SDf3
	dw .Chara_SDf4
	dw .Chara_Spe0
	dw .Chara_Spe1
	dw .Chara_Spe2
	dw .Chara_Spe3
	dw .Chara_Spe4
	assert_table_length NUM_STATS * 5

.Chara_HP0:
	text  "Le encanta"
	next1 "comer"
	done
.Chara_HP1:
	text  "Duerme"
	next1 "la siesta"
	done
.Chara_HP2:
	text  "Cabecea"
	next1 "a menudo"
	done
.Chara_HP3:
	text  "Es algo"
	next1 "desordenado"
	done
.Chara_HP4:
	text  "Le gusta"
	next1 "relajarse"
	done

.Chara_Atk0:
	text  "Orgulloso"
	next1 "de fuerza"
	done
.Chara_Atk1:
	text  "Le gusta"
	next1 "revolverse"
	done
.Chara_Atk2:
	text  "Se enfada"
	next1 "a veces"
	done
.Chara_Atk3:
	text  "Le gusta"
	next1 "luchar"
	done
.Chara_Atk4:
	text  "Tiene mal"
	next1 "genio"
	done

.Chara_Def0:
	text  "Cuerpo"
	next1 "resistente"
	done
.Chara_Def1:
	text  "Encaja"
	next1 "bien los"
	next1 "golpes"
	done
.Chara_Def2:
	text  "Muy"
	next1 "persistente"
	done
.Chara_Def3:
	text  "Buena"
	next1 "resistencia"
	done
.Chara_Def4:
	text  "Muy"
	next1 "constante"
	done

.Chara_SAt0:
	text  "Muy"
	next1 "curioso"
	done
.Chara_SAt1:
	text  "Le gusta"
	next1 "travesuras"
	done
.Chara_SAt2:
	text  "Muy"
	next1 "astuto"
	done
.Chara_SAt3:
	text  "Está en"
	next1 "Babia"
	done
.Chara_SAt4:
	text  "Muy"
	next1 "tiquismiq."
	done

.Chara_SDf0:
	text  "Fuerte"
	next1 "voluntad"
	done
.Chara_SDf1:
	text  "Algo"
	next1 "petulante"
	done
.Chara_SDf2:
	text  "Muy"
	next1 "insolente"
	done
.Chara_SDf3:
	text  "Odia"
	next1 "perder"
	done
.Chara_SDf4:
	text  "Algo"
	next1 "cabezota"
	done

.Chara_Spe0:
	text  "Le gusta"
	next1 "correr"
	done
.Chara_Spe1:
	text  "Oído"
	next1 "alerta"
	done
.Chara_Spe2:
	text  "Algo"
	next1 "impetuoso"
	done
.Chara_Spe3:
	text  "Le gusta"
	next1 "hacer el"
	next1 "payaso"
	done
.Chara_Spe4:
	text  "Huye"
	next1 "rápido"
	done
