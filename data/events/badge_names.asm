BadgeNames:
    list_start
    li "Céfiro"
    li "Colmena"
    li "Planicie"
    li "Niebla"
    li "Mineral"
    li "Tormenta"
    li "Glaciar"
    li "Alba"
    li "Roca"
    li "Cascada"
    li "Trueno"
    li "Arcoíris"
if DEF(FAITHFUL)
    li "Alma"
    li "Pantano"
else
    li "Pantano"
    li "Alma"
endc
    li "Volcán"
    li "Tierra"
    assert_list_length NUM_BADGES
