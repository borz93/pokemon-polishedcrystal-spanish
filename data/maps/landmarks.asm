MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
	table_width 4
	landmark  -8, -16, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 120, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark  92, 100, CherrygroveBayName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  86,  58, SproutTowerName
	landmark  84,  52, VioletOutskirtsName
	landmark  76,  76, RuinsOfAlphName
	landmark  84,  92, Route32Name
	landmark  92, 112, Route32CoastName
	landmark  84, 124, UnionCaveName
	landmark  76, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  76, 116, SlowpokeWellName
	landmark  52, 124, IlexForestName
	landmark  52, 108, Route34Name
	landmark  36, 120, Route34CoastName
	landmark  44, 132, StormyBeachName
	landmark  52, 132, MurkySwampName
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  44,  92, GoldenrodHarborName
	landmark  68,  92, MagnetTunnelName
	landmark  52,  76, Route35Name
	landmark  44,  76, Route35CoastName
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  69,  42, BellchimeTrailName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  36, RuggedRoadName
	landmark  36,  28, SnowtopMountainName
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  64, Route40Name
	landmark  28,  52, BattleTowerName
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  18,  98, CliffEdgeGateName
	landmark  12, 100, Route47Name
	landmark  12,  96, CliffCaveName
	landmark  12,  92, Route48Name
	landmark  12,  84, YellowForestName
	landmark  12, 108, QuietCaveName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 128,  40, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 116,  68, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 144,  60, SilverCaveName
	landmark 102, 124, FastShipName
	landmark 120,  28, SinjohRuinsName
	landmark 120,  28, MystriStageName
	assert_table_length KANTO_LANDMARK
	landmark  52, 100, PalletTownName
	landmark  52,  88, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  68, Route2Name
	landmark  52,  60, ViridianForestName
	landmark  52,  44, PewterCityName
	landmark  64,  44, Route3Name
	landmark  76,  44, MtMoonName
	landmark  92,  44, Route4Name
	landmark 108,  44, CeruleanCityName
	landmark 100,  36, CeruleanCaveName
	landmark 108,  36, Route24Name
	landmark 124,  28, Route25Name
	landmark 140,  28, CeruleanCapeName
	landmark 108,  52, Route5Name
	landmark 114,  66, UndergroundPathName
	landmark 108,  68, Route6Name
	landmark 108,  76, VermilionCityName
	landmark 116,  68, DiglettsCaveName
	landmark  96,  60, Route7Name
	landmark 124,  60, Route8Name
	landmark 124,  44, Route9Name
	landmark 140,  52, Route10Name
	landmark 140,  44, RockTunnelName
	landmark 148,  52, PowerPlantName
	landmark 148,  44, DimCaveName
	landmark 140,  60, LavenderTownName
	landmark 142,  58, LavRadioTowerName
	landmark 142,  62, SoulHouseName
	landmark  84,  60, CeladonCityName
	landmark  82,  62, CeladonUniversityName
	landmark 108,  60, SaffronCityName
	landmark 124,  76, Route11Name
	landmark 140,  76, Route12Name
	landmark 132,  92, Route13Name
	landmark 124, 100, Route14Name
	landmark 108, 108, Route15Name
	landmark 136, 104, LuckyIslandName
	landmark  68,  60, Route16Name
	landmark  76,  88, Route17Name
	landmark  80, 108, Route18Name
	landmark  92, 108, FuchsiaCityName
	landmark  92, 100, SafariZoneName
	landmark  64, 108, UragaChannelName
	landmark  60, 116, ScaryCaveName
	landmark  92, 120, Route19Name
	landmark  80, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  50, 130, PokemonMansionName
	landmark  54, 130, CinnabarVolcanoName
	landmark  52, 116, Route21Name
	landmark  40,  76, Route22Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  28,  92, Route26Name
	landmark  28,  76, PokemonLeagueName
	landmark  28,  64, Route23Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  36, IndigoPlateauName
	landmark  16,  76, Route28Name
	landmark  54, 134, CinnabarLabName
	landmark  68,  52, ShamoutiIslandName
	landmark  84,  60, BeautifulBeachName
	landmark  68,  40, RockyBeachName
	landmark  76,  40, NoisyForestName
	landmark  84,  44, ShrineRuinsName
	landmark  52,  52, ShamoutiTunnelName
	landmark  52,  60, WarmBeachName
	landmark  52,  72, ShamoutiCoastName
	landmark  60,  76, FireIslandName
	landmark  76,  76, IceIslandName
	landmark  92,  76, LightningIslandName
	landmark  68, 116, Route49Name
	landmark  76, 116, ValenciaIslandName
	landmark 132, 100, NavelRockName
	landmark  24, 120, FarawayIslandName
	assert_table_length NUM_LANDMARKS

NewBarkTownName:       rawchar "Pueblo¯Primavera@"
CherrygroveCityName:   rawchar "Ciudad¯Cerezo@"
VioletCityName:        rawchar "Ciudad¯Malva@"
AzaleaTownName:        rawchar "Pueblo¯Azalea@"
GoldenrodCityName:     rawchar "Ciudad¯Trigal@"
EcruteakCityName:      rawchar "Ciudad Iris@"
OlivineCityName:       rawchar "Ciudad¯Olivo@"
CianwoodCityName:      rawchar "Ciudad¯Orquídea@"
MahoganyTownName:      rawchar "Pueblo¯Caoba@"
BlackthornCityName:    rawchar "Ciudad¯Endrino@"
LakeOfRageName:        rawchar "Lago de la¯Furia@"
SilverCaveName:        rawchar "Cueva¯Plateada@"
SproutTowerName:       rawchar "Torre¯Bellsprout@"
VioletOutskirtsName:   rawchar "Afueras¯Malva@"
RuinsOfAlphName:       rawchar "Ruinas Alfa@"
UnionCaveName:         rawchar "Cueva Unión@"
SlowpokeWellName:      rawchar "Pozo¯Slowpoke@"
RadioTowerName:        rawchar "Torre Radio@"
PowerPlantName:        rawchar "Central¯Eléctrica@"
NationalParkName:      rawchar "Parque¯Nacional@"
BellchimeTrailName:    rawchar "Senda¯Dindón@"
TinTowerName:          rawchar "Torre¯Campana@"
LighthouseName:        rawchar "Faro@"
WhirlIslandsName:      rawchar "Islas¯Remolino@"
MtMortarName:          rawchar "Monte¯Mortero@"
DragonsDenName:        rawchar "Guarida¯Dragón@"
IcePathName:           rawchar "Ruta Helada@"
PalletTownName:        rawchar "Pueblo¯Paleta@"
ViridianCityName:      rawchar "Ciudad¯Verde@"
PewterCityName:        rawchar "Ciudad¯Plateada@"
CeruleanCityName:      rawchar "Ciudad¯Celeste@"
LavenderTownName:      rawchar "Pueblo¯Lavanda@"
VermilionCityName:     rawchar "Ciudad¯Carmín@"
CeladonCityName:       rawchar "Ciudad¯Azulona@"
SaffronCityName:       rawchar "Ciudad¯Azafrán@"
FuchsiaCityName:       rawchar "Ciudad¯Fucsia@"
CinnabarIslandName:    rawchar "Isla Canela@"
PokemonLeagueName:     rawchar "Liga¯Pokémon@"
VictoryRoadName:       rawchar "Calle¯Victoria@"
IndigoPlateauName:     rawchar "Meseta Añil@"
MtMoonName:            rawchar "Monte Moon@"
RockTunnelName:        rawchar "Túnel Roca@"
LavRadioTowerName:     rawchar "Radio¯Lavanda@"
SoulHouseName:         rawchar "Casa de las¯Almas@"
CeladonUniversityName: rawchar "Universidad¯Azulona@"
SafariZoneName:        rawchar "Zona Safari@"
SeafoamIslandsName:    rawchar "Islas¯Espuma@"
PokemonMansionName:    rawchar "Mansión¯Pokémon@"
CinnabarVolcanoName:   rawchar "Volcán¯Canela@"
CeruleanCaveName:      rawchar "Cueva¯Celeste@"
CeruleanCapeName:      rawchar "Cabo¯Celeste@"
LuckyIslandName:       rawchar "Isla Suerte@"
Route1Name:            rawchar "Ruta 1@"
Route2Name:            rawchar "Ruta 2@"
Route3Name:            rawchar "Ruta 3@"
Route4Name:            rawchar "Ruta 4@"
Route5Name:            rawchar "Ruta 5@"
Route6Name:            rawchar "Ruta 6@"
Route7Name:            rawchar "Ruta 7@"
Route8Name:            rawchar "Ruta 8@"
Route9Name:            rawchar "Ruta 9@"
Route10Name:           rawchar "Ruta 10@"
Route11Name:           rawchar "Ruta 11@"
Route12Name:           rawchar "Ruta 12@"
Route13Name:           rawchar "Ruta 13@"
Route14Name:           rawchar "Ruta 14@"
Route15Name:           rawchar "Ruta 15@"
Route16Name:           rawchar "Ruta 16@"
Route17Name:           rawchar "Ruta 17@"
Route18Name:           rawchar "Ruta 18@"
Route19Name:           rawchar "Ruta 19@"
Route20Name:           rawchar "Ruta 20@"
Route21Name:           rawchar "Ruta 21@"
Route22Name:           rawchar "Ruta 22@"
Route23Name:           rawchar "Ruta 23@"
Route24Name:           rawchar "Ruta 24@"
Route25Name:           rawchar "Ruta 25@"
Route26Name:           rawchar "Ruta 26@"
Route27Name:           rawchar "Ruta 27@"
Route28Name:           rawchar "Ruta 28@"
Route29Name:           rawchar "Ruta 29@"
Route30Name:           rawchar "Ruta 30@"
Route31Name:           rawchar "Ruta 31@"
Route32Name:           rawchar "Ruta 32@"
Route33Name:           rawchar "Ruta 33@"
Route34Name:           rawchar "Ruta 34@"
Route35Name:           rawchar "Ruta 35@"
Route36Name:           rawchar "Ruta 36@"
Route37Name:           rawchar "Ruta 37@"
Route38Name:           rawchar "Ruta 38@"
Route39Name:           rawchar "Ruta 39@"
Route40Name:           rawchar "Ruta 40@"
Route41Name:           rawchar "Ruta 41@"
Route42Name:           rawchar "Ruta 42@"
Route43Name:           rawchar "Ruta 43@"
Route44Name:           rawchar "Ruta 44@"
Route45Name:           rawchar "Ruta 45@"
Route46Name:           rawchar "Ruta 46@"
Route47Name:           rawchar "Ruta 47@"
Route48Name:           rawchar "Ruta 48@"
DarkCaveName:          rawchar "Cueva¯Oscura@"
IlexForestName:        rawchar "Encinar@"
BurnedTowerName:       rawchar "Torre¯Quemada@"
FastShipName:          rawchar "Barco¯Rápido@"
ViridianForestName:    rawchar "Bosque¯Verde@"
DiglettsCaveName:      rawchar "Cueva¯Diglett@"
TohjoFallsName:        rawchar "Cataratas¯Tohjo@"
UndergroundPathName:   rawchar "Vía¯Subterránea@"
BattleTowerName:       rawchar "Torre¯Batalla@"
CliffEdgeGateName:     rawchar "Paso¯Acantilado@"
CliffCaveName:         rawchar "Cueva¯Acantilado@"
YellowForestName:      rawchar "Bosque¯Amarillo@"
QuietCaveName:         rawchar "Cueva Calma@"
CherrygroveBayName:    rawchar "Bahía¯Cerezo@"
GoldenrodHarborName:   rawchar "Puerto¯Trigal@"
MagnetTunnelName:      rawchar "Túnel Imán@"
Route32CoastName:      rawchar "Ruta 32¯Costa@"
Route34CoastName:      rawchar "Ruta 34¯Costa@"
Route35CoastName:      rawchar "Ruta 35¯Costa@"
StormyBeachName:       rawchar "Playa¯Tormenta@"
MurkySwampName:        rawchar "Pantano¯Turbio@"
RuggedRoadName:        rawchar "Camino¯Escarpado@"
SnowtopMountainName:   rawchar "Monte¯Nevado@"
ScaryCaveName:         rawchar "Cueva¯Terror@"
DimCaveName:           rawchar "Cueva Tenue@"
UragaChannelName:      rawchar "Canal Uraga@"
ShamoutiIslandName:    rawchar "Isla¯Shamouti@"
BeautifulBeachName:    rawchar "Playa¯Bonita@"
RockyBeachName:        rawchar "Playa¯Rocosa@"
NoisyForestName:       rawchar "Bosque¯Ruidoso@"
ShrineRuinsName:       rawchar "Ruinas¯Santuario@"
ShamoutiTunnelName:    rawchar "Túnel¯Shamouti@"
WarmBeachName:         rawchar "Playa¯Cálida@"
ShamoutiCoastName:     rawchar "Costa¯Shamouti@"
FireIslandName:        rawchar "Isla del¯Fuego@"
IceIslandName:         rawchar "Isla del¯Hielo@"
LightningIslandName:   rawchar "Isla del¯Rayo@"
Route49Name:           rawchar "Ruta 49@"
ValenciaIslandName:    rawchar "Isla¯Valencia@"
NavelRockName:         rawchar "Roca¯Ombligo@"
FarawayIslandName:     rawchar "Isla¯Suprema@"
SinjohRuinsName:       rawchar "Ruinas de¯Sinjoh@"
MystriStageName:       rawchar "Estrado¯Mistrío@"
CinnabarLabName:       rawchar "Laboratorio¯Pokémon@"
SpecialMapName:        rawchar "?@"
