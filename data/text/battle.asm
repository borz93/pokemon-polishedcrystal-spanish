BattleText::

LinkBattleErrorText::
	text "Hubo un error de"
	line "conexión."

	para "El juego se"
	line "reiniciará ahora."
	prompt

BattleText_PlayerPickedUpPayDayMoney:
	text "¡<PLAYER> recogió"
	line "¥"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "¡Apareció un"
	line ""
	text_ram wEnemyMonNickname
	cont "salvaje!"
	prompt

LegendaryAppearedText:
    text "¡"
	text_ram wEnemyMonNickname
	line "ha aparecido!"
	prompt

GhostAppearedText:
	text "¡Apareció un"
	line "Fantasma!"
	prompt

SilphScopeRevealText:
	text "¡SilphScope2"
	line "reveló la"
	cont "identidad del"
	cont "Fantasma!"
	prompt

HookedPokemonAttackedText:
	text "¡El"
	line ""
	text_ram wEnemyMonNickname
	cont "encarmado"
	cont "atacó!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	line "cayó del árbol!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "¡Quiere luchar!"
	prompt

WantToBattleText::
	text "<ENEMY>"
	line "¡Quieren luchar!"
	prompt

BattleText_WildFled:
	text "¡El"
	line ""
	text_ram wEnemyMonNickname
	cont "salvaje huyó!"
	prompt

BattleText_LegendaryFled:
    text "¡"
	text_ram wEnemyMonNickname
	line "huyó!"
	prompt

BattleText_EnemyFled:
	text "¡El "
	text_ram wEnemyMonNickname
	line "rival"
	cont "huyó!"
	prompt

BattleText_EnemyCantEscape:
	text "¡<USER>"
	line "no puede huir!"
	prompt

if DEF(DEBUG)
DealtXDamageText:
	text "Dealt "
	text_decimal wCurDamage, 2, 5
	text " dmg"
	line "before roll."
	prompt
endc

HurtByPoisonText:
	text "¡<USER>"
	line "sufre por el"
	cont "veneno!"
	done

HurtByBurnText:
	text "¡<USER>"
	line "sufre por su"
	cont "quemadura!"
	done

LeechSeedSapsText:
	text "¡Drenadoras"
	line "agota a"
	cont "<USER>!"
	prompt

HurtByCurseText:
	text "¡<USER>"
	line "sufre por la"
	cont "maldición!"
	prompt

SandstormHitsText:
	text "¡<USER>"
	line "es azotado"
	cont "por tormenta"
	cont "de arena!"
	prompt

HailHitsText:
	text "¡<USER>"
	line "es azotado"
	cont "por el granizo!"
	prompt

PerishCountText:
	text "¡<USER>: le"
	line "quedan "
	text_decimal wTextDecimalByte, 1, 1
	text " asaltos!"
	prompt

BattleText_UserLostSomeOfItsHP:
	text "¡<USER>"
	line "perdió parte"
	cont "de sus PS!"
	prompt

BattleText_PickedUpItem:
	; assumes player (enemy might overflow text-wise)
	text "<USER> recogió"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

BattleText_UserRecoveredWithItem:
	text "<USER>"
	line "se recuperó con"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserAteItem:
	text "¡<USER>"
	line "se comió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtByItem:
	text "<USER>"
	line "fue dañado por"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserItemLetItMoveFirst::
	text "El "
	text_ram wStringBuffer1
	line "de <USER>"
	cont "le permitió ir"
	cont "primero."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "restauró el PP"
	cont "de"
	cont ""
	text_ram wStringBuffer2
	text " con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BrokeLightScreenText:
	text "¡<USER>"
	line "rompió la"
	cont "Pantalla Luz"
	cont "del objetivo!"
	prompt

BrokeReflectText:
	text "¡<USER>"
	line "rompió el"
	cont "Reflejo del"
	cont "objetivo!"
	prompt

BattleText_ItemLowered:
	text ""
	text_ram wStringBuffer1
	line "bajó su"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemHarshlyLowered:
	text ""
	text_ram wStringBuffer1
	line "bajó mucho su"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemSeverelyLowered:
	text ""
	text_ram wStringBuffer1
	line "bajó muchísimo su"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemRaised:
	text ""
	text_ram wStringBuffer1
	line "subió su"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemSharplyRaised:
	text ""
	text_ram wStringBuffer1
	line "subió mucho su"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemDrasticallyRaised:
	text ""
	text_ram wStringBuffer1
	line "subió muchísimo su"
	cont ""
	text_ram wStringBuffer2
	text " de"
	cont "<USER>!"
	prompt

BattleText_ItemRaisedCrit:
	text "¡<USER>"
	line "usó "
	text_ram wStringBuffer1
	cont "para concentrarse!"
	prompt

BattleText_MegaSolCharged:
	text "¡<USER>"
	line "se cargó!"
	prompt

BattleText_UserChargedWithItem:
	text "¡<USER>"
	line "se cargó"
	cont "usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersFutureSightMissed:
; used when Future Sight can't hit anything because there was
; no target (so <TARGET> is undefined)
	text "¡Premonición"
	line "llegó!"

	para "¡Pero falló!"
	prompt

BattleText_TargetWasHitByFutureSight:
	text "¡<TARGET>"
	line "herido por"
	cont "Premonición!"
	prompt

BattleText_MistFaded:
	text "¡Neblina de"
	line ""
	text_ram wStringBuffer1
	cont "se disipó!"
	prompt

BattleText_SafeguardFaded:
	text "¡Velo Sagrado de"
	line ""
	text_ram wStringBuffer1
	cont "se desvaneció!"
	prompt

BattleText_LightScreenFell:
	text "¡Pantalla Luz"
	line "de"
	cont ""
	text_ram wStringBuffer1
	text " #mon"
	cont "ha caído!"
	prompt

BattleText_ReflectFaded:
	text "¡Reflejo de"
	line ""
	text_ram wStringBuffer1
    text " #mon"
	cont "se disipó!"
	prompt

BattleText_TheRainStopped:
	text "Dejó de llover."
	prompt

BattleText_TheSunlightFaded:
	text "Se ha ido el sol."
	prompt

BattleText_TheSandstormSubsided:
	text "La tormenta de"
	line "arena amainó."
	prompt

BattleText_TheHailStopped:
	text "Dejó de granizar."
	prompt

BattleText_EnemyPkmnFainted:
	text "¡El "
	text_ram wEnemyMonNickname
	line "rival"
	cont "se debilitó!"
	prompt

GotMoneyForWinningText:
	text "¡<PLAYER> ganó ¥"
	text_decimal wBattleReward, 3, 6
	line "por ganar!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "¡ha perdido!"
	prompt

BattleText_EnemyWereDefeated:
	text "<ENEMY>"
	line "¡han perdido!"
	prompt

TiedAgainstText:
	text "Empate contra"
	line "<ENEMY>"
	prompt

SentSomeToMomText:
	text "¡<PLAYER> ganó ¥"
	text_decimal wBattleReward, 3, 6
	line "por ganar!"
	cont "¡Envié algo a"
	cont "mamá!"
	prompt

SentHalfToMomText:
	text "¡Envié la mitad"
	line "a mamá!"
	prompt

SentAllToMomText:
	text "¡Envié todo"
	line "a mamá!"
	prompt

BattleText_PkmnFainted:
    text "¡"
	text_ram wBattleMonNickname
	line "se debilitó!"
	prompt

BattleText_UseNextMon:
	text "¿Uso el"
	line "siguiente #mon?"
	done

LostAgainstText:
	text "Perdiste contra"
	line "<ENEMY>"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "va a usar a"
	cont ""
	text_ram wEnemyMonNickname
	text "."

	para "¿Cambiar"
	line "#mon?"
	done

BattleText_EnemyAreAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "van a usar a"
	cont ""
	text_ram wEnemyMonNickname
	text "."

	para "¿Cambiar"
	line "#mon?"
	done

BattleText_EnemyIsAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "va a cambiar de"
	cont "#mon."

	para "¿Cambiar"
	line "#mon?"
	done

BattleText_EnemyAreAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "van a cambiar de"
	cont "#mon."

	para "¿Cambiar"
	line "#mon?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "¡Sacó a"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "¡No tienes ganas"
	line "de luchar!"
	prompt

BattleText_AnEGGCantBattle:
	text "¡Un Huevo no"
	line "puede luchar!"
	prompt

BattleText_CantEscape:
	text "¡No puedes huir!"
	prompt

BattleText_AskForfeitTrainerBattle:
	text "¿Seguro que"
	line "quieres rendirte?"
	done

BattleText_GotAwaySafely:
	text "¡Escapaste sin"
	line "problemas!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "¡<USER>"
	line "huyó usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtBySpikes:
	text "¡<USER>"
	line "herido por Púas"
	prompt

RecoveredUsingText:
	text "¡<USER>"
	line "se recuperó"
	cont "usando"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

AirBalloonPoppedText:
	text "¡Globo Aéreo"
	line "de <TARGET>"
	cont "estalló!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "¡Se activó"
	line ""
	text_ram wStringBuffer1
	cont "de <USER>!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Aquí no se pueden"
	line "usar objetos."
	prompt

BattleText_PkmnIsAlreadyOut:
	text_ram wBattleMonNickname
	line "ya está luchando."
	prompt

BattleText_PkmnCantBeRecalled:
    text "¡"
	text_ram wBattleMonNickname
    line "no puede ser"
    cont "retirado!"
	prompt

BattleText_PkmnCantBeRecalledAbility:
	text "¡"
	text_ram wStringBuffer1
	line "de"
	cont ""
	text_ram wEnemyMonNickname
	cont "evita la huida!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "¡No quedan PP para"
	line "este movimiento!"
	prompt

BattleText_ItemOnlyAllowsMove: ; choice items
	text ""
	text_ram wStringBuffer1
	line "solo permite"
	cont "usar "
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_MonCanOnlyUseMove:
	text "¡<USER> solo"
	line "puede usar"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_ItemPreventsStatusMoves: ; assault vest
	text "¡"
	text_ram wStringBuffer1
	line "impide usar"
	cont "movimientos de"
	cont "estado!"
	prompt

BattleText_TheMoveIsDisabled:
	text "¡El movimiento"
	line "está desactivado!"
	prompt

BattleText_PkmnHasNoMovesLeft:
    text "¡A "
	text_ram wBattleMonNickname
	line "no le quedan"
	cont "más movimientos!"
	done

BattleText_UserEncoreEnded:
	text "¡Otra Vez de"
	line "<USER>"
	cont "terminó!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text "¡"
	text_ram wStringBuffer1
	text " subió"
	line "al nivel "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end

BattleText_WildPkmnIsEating:
	text "¡El "
	text_ram wEnemyMonNickname
	line "salvaje"
	cont "está comiendo!"
	prompt

BattleText_WildPkmnIsAngry:
	text "¡El "
	text_ram wEnemyMonNickname
	line "salvaje"
	cont "está enfadado!"
	prompt

BattleText_ThrewRock:
	text "<PLAYER> tiró una"
	line "piedra."
	prompt

BattleText_ThrewBait:
	text "<PLAYER> tiró"
	line "un cebo."
	prompt

FastAsleepText:
	text "¡<USER>"
	line "está dormido!"
	done

WokeUpText:
	text "¡<USER>"
	line "se despertó!"
	prompt

WasFrozenText:
	text "¡<TARGET>"
	line "fue congelado!"
	prompt

FrozenSolidText:
	text "¡<USER>"
	line "está congelado!"
	done

FlinchedText:
	text "¡<USER>"
	line "retrocedió!"
	prompt

MustRechargeText:
	text "¡<USER>"
	line "debe recargarse!"
	prompt

DisabledNoMoreText:
	text "¡Ataque de"
	line "<USER>"
	cont "activado de nuevo!"
	prompt

IsConfusedText:
	text "¡<USER>"
	line "está confuso!"
	prompt

HurtItselfText:
	text "¡Tan confuso"
	line "que se hiere a"
	cont "sí mismo!"
	prompt

ConfusedNoMoreText:
	text "¡<USER>"
	line "no está confuso!"
	prompt

BecameConfusedText:
	text "¡<TARGET>"
	line "está confuso!"
	prompt

BecameConfusedDueToFatigueText:
	text "¡<TARGET>"
	line "se confundió"
	cont "por la fatiga!"
	prompt

AlreadyConfusedText:
	text "¡<TARGET>"
	line "ya está confuso!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "¡<USER>"
	line "herido por"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "¡<USER>"
	line "fue liberado de"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

WhirlpoolTrapText:
	text "¡<TARGET>"
	line "fue atrapado!"
	prompt

FireSpinTrapText:
	text "¡<TARGET>"
	line "fue atrapado!"
	prompt

WrappedByText:
	text "¡<TARGET>"
	line "fue atrapado por"
	cont "<USER>!"
	prompt

HungOnText:
	text "¡<TARGET>"
	line "resistió con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "¡<TARGET>"
	line "aguantó el golpe!"
	prompt

InLoveWithText:
	text "¡<USER>"
	line "está enamorado de"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "¡Enamoramiento de"
	line "<USER>"
	cont "le impidió atacar!"
	prompt

NoLongerInfatuatedText:
	text "¡<USER>"
	line "ya no está"
	cont "enamorado!"
	prompt

ObliviousPreventedDestinyKnot:
	text "¡"
	text_ram wStringBuffer1
	line "de <USER>"
	cont "evita que"
	cont ""
	text_ram wStringBuffer2
	cont "enamore!"
	prompt

DestinyKnotInfatuatedUser:
	text "¡"
	text_ram wStringBuffer1
	line "de <TARGET>"
	cont "enamoró a"

	para "<USER>!"
	prompt

DisabledMoveText:
	text "¡"
	text_ram wStringBuffer1
	text " de"
	line "<USER>"
	cont "está desactivado!"
	prompt

UsedMoveText:
	text "¡<USER>"
	line "usó "
	text_ram wStringBuffer2
	text "!"
	done

UsedMoveInsteadText:
	text "¡<USER>"
	line "usó "
	text_ram wStringBuffer2
	cont "en su lugar!"
	done

LoafingAroundText:
	text_ram wBattleMonNickname
	line "está ocioso."
	prompt

BeganToNapText:
	text "¡"
	text_ram wBattleMonNickname
	line "se echó a dormir!"
	prompt

WontObeyText:
	text "¡"
	text_ram wBattleMonNickname
	line "no te obedeció!"
	prompt

TurnedAwayText:
	text "¡"
	text_ram wBattleMonNickname
	line "ya no te obedece!"
	prompt

IgnoredOrdersText:
	text "¡"
	text_ram wBattleMonNickname
	line "desobedeció!"
	prompt

IgnoredSleepingText:
	text "¡"
	text_ram wBattleMonNickname
	line "desobedeció…!"
	cont "¡Está durmiendo!"
	prompt

NoPPLeftText:
	text "¡Pero no queda PP"
	line "para el"
	cont "movimiento!"
	prompt

HasNoPPLeftText:
	text "¡<USER>"
	line "carece de PP"
	cont "para @"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "¡<USER>"
	line "se fue a dormir!"
	done

RestedText:
	text "¡<USER>"
	line "se quedó dormido y"
	cont "recuperó la salud!"
	done

RegainedHealthText:
	text "¡<USER>"
	line "recuperó la salud!"
	prompt

IsHurtText:
	text "¡<USER>"
	line "está dañado!"
	prompt

IsTormentedText:
	text "¡<USER>"
	line "está atormentado!"
	prompt

AttackMissedText:
	text "¡Falló ataque de"
	line "<USER>!"
	prompt

CrashedText:
	text "¡<USER>"
	line "continuó y se"
	cont "estrelló!"
	prompt

UnaffectedText:
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

DoesntAffectText:
	text "¡No afecta a"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "¡Golpe crítico!"
	prompt

ExtremelyEffectiveText:
	text "¡Es extremadamente"
	line "eficaz!"
	prompt

SuperEffectiveText:
	text "¡Es muy efectivo!"
	prompt

NotVeryEffectiveText:
	text "No es muy"
	line "efectivo…"
	prompt

MostlyIneffectiveText:
	text "Es casi"
	line "inútil…"
	prompt

TookDownWithItText:
	text "¡<TARGET>"
	line "acabó con"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "¡La furia de"
	line "<USER>"
	cont "aumenta!"
	prompt

GotAnEncoreText:
	text "¡<TARGET>"
	line "sufrió los efectos"
	cont "de Otra Vez!"
	prompt

SharedPainText:
	text "¡Los combatientes"
	line "comparten el daño!"
	prompt

SwappedAbilitiesText:
	text "¡Los luchadores"
	line "intercambiaron"
	cont "habilidades!"
	prompt

SwappedItemsText:
	text "¡Los luchadores"
	line "intercambiaron"
	cont "objetos!"
	prompt

ChangeIntoTypeText:
	text "¿A qué tipo de"
	line "movimiento cambio?"
	prompt

InvalidTypeChangeText:
	text "No puedes elegir"
	line "ese tipo de"
	cont "movimiento!"
	prompt

SketchedText:
	text "<USER>"
	line "copió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "¡<USER>"
	line "intenta llevarse"
	cont "al rival con él!"
	prompt

BellChimedText:
	text "¡Sonó una campana!"
	line ""
	prompt

FellAsleepText:
	text "¡<TARGET>"
	line "se durmió!"
	prompt

AlreadyAsleepText:
	text "¡<TARGET> ya"
	line "está dormido!"
	prompt

WasPoisonedText:
	text "¡<TARGET>"
	line "fue envenenado!"
	prompt

BadlyPoisonedText:
	text "¡<TARGET>"
	line "fue gravemente"
	cont "envenenado!"
	prompt

AlreadyPoisonedText:
	text "¡<TARGET>"
	line "está envenenado!"
	prompt

SuckedHealthText:
	text "¡Absorbió salud de"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "¡Se comió el"
	line "sueño de"
	cont "<TARGET>!"
	prompt

WasBurnedText:
	text "¡<TARGET>"
	line "se quemó!"
	prompt

AlreadyBurnedText:
	text "¡<TARGET>"
	line "ya está quemado!"
	prompt

WontRiseAnymoreText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "no subirá más!"
	prompt

WontDropAnymoreText:
	text "¡"
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>"
	cont "no bajará más!"
	prompt

StatRoseText:
	text "¡"
    text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "subió!"
	prompt

StatRoseSharplyText:
	text "¡"
    text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "subió mucho!"
	prompt

StatRoseDrasticallyText:
	text "¡"
    text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "subió muchísimo!"
	prompt

StatFellText:
	text "¡"
    text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "bajó!"
	prompt

StatHarshlyFellText:
	text "¡"
    text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "bajó mucho!"
	prompt

StatSeverelyFellText:
	text "¡"
    text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "bajó muchísimo!"
	prompt

FledFromBattleText::
	text "¡<USER>"
	line "huyó del combate!"
	prompt

FledInFearText:
	text "¡<TARGET>"
	line "huyó aterrorizado!"
	prompt

HitNTimesText:
	text "Golpes: "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text "!"
	prompt

MistText:
	text "La Neblina"
	line "envuelve a"
	cont "<USER>!"
	prompt

ProtectedByItemText:
	text "<TARGET>"
	line "está protegido"
	cont "por "
	text_ram wStringBuffer1
	text "."
	prompt

ProtectedByMistText:
	text "<TARGET>"
	line "está protegido"
	cont "por la Neblina."
	prompt

GettingPumpedText:
	text_pause
	text "¡<USER>"
	line "se está inflando!"
	prompt

RecoilText:
	text "¡<USER>"
	line "sufre"
	cont "retroceso!"
	prompt

MadeSubstituteText:
	text "¡<USER>"
	line "creó un"
	cont "Sustituto!"
	prompt

HasSubstituteText:
	text "¡<USER>"
	line "tiene un"
	cont "Sustituto!"
	prompt

TooWeakSubText:
	text "¡Demasiado débil"
	line "para crear un"
	cont "Sustituto!"
	prompt

SubTookDamageText:
	text "El Sustituto"
	line "recibió el daño"
	cont "de <TARGET>!"
	prompt

SubFadedText:
	text "¡Cayó el"
	line "Sustituto de"
	cont "<TARGET>!"
	prompt

WasSeededText:
	text "¡<TARGET>"
	line "fue infectado!"
	prompt

EvadedText:
	text "¡<TARGET>"
	line "esquivó el ataque!"
	prompt

WasDisabledText:
	text "¡"
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "fue desactivado!"
	prompt

CoinsScatteredText:
	text "¡Hay monedas por"
	line "todas partes!"
	prompt

TransformedTypeText:
	text "¡<USER>"
	line "es ahora de"
	cont "tipo "
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "¡Se anularon"
	line "todos los cambios"
	cont "de estadísticas!"
	prompt

TransformedText:
	text "¡<USER>"
	line "se transformó"
	cont "en"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

TrickRoomText:
	text "¡<USER>"
	line "distorsionó"
	cont "el espacio!"
	prompt

TrickRoomEndedText:
	text "El espacio"
	line "distorsionado"

	para "volvió a la"
	line "normalidad!"
	prompt

LightScreenEffectText:
	text "¡Subió"
	line "Def. Esp. de"
	cont "<USER>!"
	prompt

ReflectEffectText:
	text "¡Subió"
	line "Defensa de"
	cont "<USER>!"
	prompt

NothingHappenedText:
	text "Pero no pasó"
	line "nada."
	prompt

ButItFailedText:
	text "¡Pero falló!"
	prompt

DidntAffectText:
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "¡Los PS de"
	line "<USER>"
	cont "están al máximo!"
	prompt

DraggedOutText:
	text "¡<USER>"
	line "fue arrastrado!"
	prompt

ParalyzedText:
	text "¡<TARGET>"
	line "está paralizado!"
	cont "¡Quizá no ataque!"
	prompt

FullyParalyzedText:
	text "¡<USER>"
	line "está totalmente"
	cont "paralizado!"
	done

AlreadyParalyzedText:
	text "¡<TARGET>"
	line "ya está"
	cont "paralizado!"
	prompt

ProtectedByText:
	text "¡<TARGET>"
	line "está protegido por"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

RegainedStatsWithItem:
	text "¡<USER>"
	line "recuperó sus"
	cont "estadísticas con"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CuredInfatuationWithItem:
	text "¡<USER>"
	line "curó su"
	cont "enamoramiento"
	cont "con "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredEncoreWithItem:
	text "¡<USER>"
	line "curó Otra Vez"
	cont "con "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredDisableWithItem:
	text "¡<USER>"
	line "curó Anulación"
	cont "con "
	text_ram wStringBuffer1
	text "!"
	prompt

StoleText:
	text "¡<USER>"
	line "robó @"
	text_ram wStringBuffer1
	text_start
	cont "a su rival!"
	prompt

KnockedOffItemText:
	text "<USER>"
	line "tiró"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CantEscapeNowText:
	text "¡<TARGET>"
	line "no puede escapar!"
	prompt

WasDefrostedText:
	text "¡<USER>"
	line "fue descongelado!"
	prompt

PutACurseText:
	text "¡<USER>"
	line "reduce sus PS y"

	para "maldice a"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "¡<USER>"
	line "se protegió!"
	prompt

ProtectingItselfText:
	text "¡<TARGET>"
	line "se está"
	cont "protegiendo!"
	done

SpikesText:
	text "¡<TARGET>"
	line "está rodeado"
	cont "de púas!"
	prompt

ToxicSpikesText:
	text "¡Púas Tóxicas"
	line "se esparcieron"
	cont "alrededor de"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "¡<USER>"
	line "identificó a"
	cont "<TARGET>!"
	prompt

StartPerishSongText:
	text "Los #mon que"
	line "oyeron la canción"
	cont "se debilitarán en"
	cont "3 turnos!"
	prompt

StartPerishBodyText:
	text "¡Ambos #mon se"
	line "debilitarán en"
	cont "3 turnos!"
	prompt

SandstormBrewedText:
	text "¡Se formó una"
	line "tormenta de arena!"
	prompt

HailStartedText:
	text "¡Empezó a"
	line "granizar!"
	prompt

BracedItselfText:
	text "¡<USER>"
	line "se ha fortalecido!"
	prompt

FellInLoveText:
	text "¡<TARGET>"
	line "se ha enamorado!"
	prompt

CoveredByVeilText:
	text "¡<USER>"
	line "se cubrió con"
	cont "un velo!"
	prompt

SafeguardProtectText:
	text "¡<TARGET>"
	line "está protegido por"
	cont "Velo Sagrado!"
	prompt

MagnitudeText:
	text "¡Magnitud "
	text_decimal wTextDecimalByte, 1, 2
	text "!"
	prompt

ReleasedByText:
	text "¡<USER>"
	line "fue liberado por"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "¡<USER>"
	line "se libró de"
	cont "Drenadoras!"
	prompt

BlewSpikesText:
	text "¡<USER>"
	line "se libró de"
	cont "las Púas!"
	prompt

BlewToxicSpikesText:
	text "¡<USER>"
	line "se libró de"
	cont "Púas Tóxicas!"
	prompt

DownpourText:
	text "¡Ha empezado a"
	line "caer un chaparrón!"
	prompt

SunGotBrightText:
	text "¡El sol está"
	line "brillando!"
	prompt

BellyDrumText:
	text "¡<USER>"
	line "redujo sus PS y"

	para "mejoró su Ataque!"
	prompt

BellyDrumContraryText:
	text "¡<USER>"
	line "redujo sus PS y"
	cont "redujo su"
	cont "Ataque!"
	prompt

ForesawAttackText:
	text "¡<USER>"
	line "previó un ataque!"
	prompt

IgnoredOrders2Text:
	text "¡<USER>"
	line "ignoró las"
	cont "órdenes!"
	prompt

BecameHealthyText:
	text "¡<USER>"
	line "se curó!"
	prompt

PlayerAffectionEndureText:
	text "¡<USER>"
	line "resistió para que"

	para "<PLAYER> no se"
	line "pusiera triste!"
	prompt

EnemyAffectionEndureText:
	text "¡<USER>"
	line "resistió para que"

	para "<ENEMY> no se"
	line "pusiera triste!"
	prompt

PlayerAffectionEvasionText:
	text "¡<USER>"
	line "esquivó el golpe"

	para "gracias al"
	line "grito de"
	cont "<PLAYER>!"
	prompt

EnemyAffectionEvasionText:
	text "¡<USER>"
	line "esquivó el golpe"

	para "gracias al"
	line "grito de"
	cont "<ENEMY>!"
	prompt

PlayerAffectionSelfCureText:
	text "¡<USER>"
	line "se curó para que"

	para "<PLAYER> no"
	line "se preocupara!"
	prompt

EnemyAffectionSelfCureText:
	text "¡<USER>"
	line "se curó para que"

	para "<ENEMY> no"
	line "se preocupara!"
	prompt

AffectionCriticalText: ; same for both player and enemy
	text "<USER>"
	line "dio un golpe"

	para "crítico, ¡deseando"
	line "que lo alaben!"
	prompt

NotifyAirBalloonText:
	text "¡<USER>"
	line "flota en el aire"
	cont "con "
	text_ram wStringBuffer1
	text "!"
	prompt

TraceActivationText:
	text "<USER>"
	line "copió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_IntimidateResisted:
	text ""
	text_ram wStringBuffer1
	line "de <TARGET>"

	para "le protege de"
	line "Intimidación!"
	prompt

NotifyCloudNine:
	text "¡El clima quedó"
	line "suprimido!"
	prompt

NotifyPressure:
	text "¡<USER>"
	line "ejerce su"
	cont "Presión!"
	prompt

NotifyMoldBreaker:
	text "¡<USER>"
	line "rompe moldes!"
	prompt

NotifyUnnerve:
	text "¡<TARGET>"
	line "está muy nervioso"
	cont "para comer"
	cont "Bayas!"
	prompt

NotifyNeutralizingGas:
	text "¡El Gas"
	line "Neutralizante"
	cont "llenó el área!"
	prompt

FriskedItemText:
	text "¡<USER>"
	line "cacheó al rival"

	para "y encontró"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

PickedItemText:
	text "<USER>"
	line "recogió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

HarvestedItemText:
	text "<USER>"
	line "cosechó"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

FirePoweredUpText:
	text "¡Los movimientos"
	line "de Fuego de"
	cont "<USER>"
	cont "se potenciaron!"
	prompt

AngerPointMaximizedAttackText:
	text "¡<USER>"
	line "maximizó su"
	cont "Ataque!"
	prompt

CannotUseText:
	text "¡<TARGET>"
	line "no puede usar"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

ShudderedText:
; since the ability works with the opponent move data,
; it is on the opponent turn mostly
	text "¡<TARGET>"
	line "se estremeció!"
	prompt

ForewarnText:
	text "¡<TARGET>"
	line "usa "
	text_ram wStringBuffer1
	text "!"
	prompt

BouncedBackText:
	text "¡<USER>"
	line "devolvió"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

ItemCantBeStolenText:
	text "¡El objeto de"
	line "<TARGET>"
	cont "no se puede"
	cont "robar!"
	prompt

SuckedUpOozeText:
	text "¡<USER>"
	line "absorbió"
	cont "líquido viscoso!"
	prompt

BattleText_EnemyWithdrew::
	text "!<ENEMY>"
	line "retiró a"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	prompt

BattleText_WentBackToPlayer:
	text "¡<USER> volvió"
	line "con <PLAYER>!"
	prompt

BattleText_WentBackToEnemy:
	text "¡<USER>"
	line "volvió con"
	cont "<ENEMY>!"
	prompt

ScaredText:
	text "¡<USER> está"
	line "muy asustado"
	cont "para moverse!"
	prompt

GetOutText:
	text "Fantasma: Vete…"
	line "Vete…"
	prompt

CalFinalPkmnText:
CarrieFinalPkmnText:
JackyFinalPkmnText:
EunaFinalPkmnText:
	text "¡Aún me queda"
	line "un #mon!"
	prompt

FalknerFinalPkmnText:
	text "¡Por fin el"
	line "viento nos"
	cont "favorece!"
	prompt

BugsyFinalPkmnText:
	text "Aunque sea mi"
	line "último #mon,"

	para "¡los #mon"
	line "Bicho son duros!"
	prompt

WhitneyFinalPkmnText:
	text "¡Oye! ¿Solo uno"
	line "queda? Pero…"

	para "No pienso perder,"
	line "¿Te enteras?"
	prompt

MortyFinalPkmnText:
	text "¡Aún creo que"
	line "podemos lograrlo!"
	prompt

ChuckFinalPkmnText:
	text "¡Aún no hemos"
	line "perdido!"
	prompt

JasmineFinalPkmnText:
	text "¡El acero bien"
	line "templado aguanta"
	cont "hasta el final!"
	prompt

PryceFinalPkmnText:
	text "Humph… Eres todo"
	line "un Entrenador."
	prompt

ClairFinalPkmnText:
	text "¿Con que el"
	line "último #mon?"
	cont "¡Aquí es donde"
	cont "empieza la"
	cont "lucha de verdad!"
	prompt

WillFinalPkmnText:
	text "¡Los Psíquicos no"
	line "nos rendimos"
	cont "hasta el final!"
	prompt

KogaFinalPkmnText:
	text "¡Fuajaja! Contaba"
	line "con esto desde"

	para "el mismísimo"
	line "principio!"
	prompt

BrunoFinalPkmnText:
	text "¡Lucha con todas"
	line "tus fuerzas hasta"
	cont "caer!"
	prompt

KarenFinalPkmnText:
	text "¡Esto está lejos"
	line "de ser una"
	cont "situación"
	cont "desesperada!"
	prompt

ChampionFinalPkmnText:
	text "¡Vale! ¡Pensé que"
	line "esto nunca"
	cont "pasaría!"
	prompt

BrockFinalPkmnText:
	text "¡Ja ja ja!"
	line "¡Qué cosquillas!"
	prompt

MistyFinalPkmnText:
	text "Mmm… Se te da"
	line "bastante bien…"
	prompt

LtSurgeFinalPkmnText:
	text "Esto no acabó."
	line "¡Ahora es cuando"
	cont "empieza!"
	prompt

ErikaFinalPkmnText:
	text "No te contengas"
	line "conmigo. ¡Dame"
	cont "con todo lo que"
	cont "tengas!"
	prompt

JanineFinalPkmnText:
	text "¡Tienes una gran"
	line "técnica de"
	cont "combate!"
	prompt

SabrinaFinalPkmnText:
	text "¿Qué pasará"
	line "después de esto?"
	cont "Ya lo sé."
	prompt

BlaineFinalPkmnText:
	text "¡Te mostraré el"
	line "espíritu de mi"
	cont "cueva-Gimnasio"
	prompt

BlueFinalPkmnText:
	text "Je je je…"
	line "No estás"

	para "preparado. ¡Te"
	line "vamos a tumbar!"
	prompt

RedFinalPkmnText: ; text > text
LeafFinalPkmnText:
	text "………………"
	prompt

Rival1_1FinalPkmnText:
	text "…¡Já!"
	line "No lo haces mal"
	cont "para ser débil."
	prompt

Rival1_2FinalPkmnText:
	text "Vaya, tienes"
	line "agallas al"
	cont "venir aquí…"
	prompt

Rival1_3FinalPkmnText:
	text "Por desesperación,"
	line "los débiles a"

	para "veces contraatacan"
	line "algo bien."
	prompt

Rival1_4FinalPkmnText:
	text "¡Eh, eh!"
	line "¿Por qué tan"
	cont "serio?"
	prompt

Rival1_5FinalPkmnText:
	text "Ya veo. Parece"
	line "que no fue solo"
	cont "suerte"

	para "lo que te trajo"
	line "hasta aquí."
	prompt

Rival2_1FinalPkmnText:
	text "Ya veo. No"
	line "venías a Kanto"
	cont "solo a presumir…"
	prompt

Rival2_2FinalPkmnText:
	text "¿¡Por qué!? ¡Aún"
	line "me queda uno!"
	prompt

Lyra1_1FinalPkmnText:
	text "Nunca habías"
	line "tenido una"
	cont "batalla #mon,"
	cont "¿Verdad?"

	para "Podría explicarte,"
	line "pero aprenderás"

	para "más con la"
	line "experiencia."

	para "¡Da lo mejor de"
	line "ti, <PLAYER>!"
	prompt

Lyra1_2FinalPkmnText:
	text "¡Aprendes"
	line "rápido, <PLAYER>!"
	prompt

Lyra1_3FinalPkmnText:
	text "¡Ok! ¡Hora de mi"
	line "último #mon!"
	prompt

Lyra1_4FinalPkmnText:
	text "Gane o pierda,"
	line "¡Me lo he"
	cont "pasado genial!"
	prompt

Lyra2_1FinalPkmnText:
	text "Me has dejado"
	line "con mi último"
	cont "#mon…"
	prompt

Proton1FinalPkmnText:
	text "¿En serio me"
	line "perseguirías tan"
	cont "lejos?"
	prompt

Proton2FinalPkmnText:
	text "Vayamos donde"
	line "vayamos, siempre"
	cont "hay quien está"
	cont "en desacuerdo…"
	prompt

Petrel1FinalPkmnText:
	text "¿Qué? ¿Estoy"
	line "perdiendo?"
	prompt

Petrel2FinalPkmnText:
	text "¡Vaya, eres bueno!"
	prompt

Archer1FinalPkmnText:
	text "¡No podemos dejar"
	line "que te interpongas"

	para "antes de que"
	line "vuelva Giovanni!"
	prompt

Archer2FinalPkmnText:
	text "Ah, sí que eres"
	line "fuerte, pero…"
	cont "me pregunto…"
	prompt

Ariana1FinalPkmnText:
	text "¿Po…Por qué eres"
	line "tan fuerte?!"
	prompt

Ariana2FinalPkmnText:
	text "Oye, ¿Qué te"
	line "crees que"
	cont "estás haciendo?!"
	prompt

Giovanni1FinalPkmnText:
	text "¡Mi #mon es"
	line "invencible!"
	prompt

Giovanni2FinalPkmnText:
	text "¡No me digas que"
	line "un mocoso sin"

	para "experiencia puede"
	line "ser tan fuerte!"
	prompt

ProfOakFinalPkmnText:
	text "¡Mmm! ¡Excelente!"
	line "¡Pero aún no"
	cont "hemos acabado!"
	prompt

ProfElmFinalPkmnText:
	text "Ya casi"
	line "termina…"
	prompt

ProfIvyFinalPkmnText:
	text "Estoy mal, ¡pero"
	line "no derrotada!"
	prompt

MysticalManFinalPkmnText:
	text "¡Hora de una"
	line "remontada"
	cont "dramática!"
	prompt

KarateKingFinalPkmnText:
	text "¡Yaaarggh!"
	prompt

PalmerFinalPkmnText:
	text "¡Bravo!"
	prompt

ThortonFinalPkmnText:
	text "¡Vaya!"
	prompt

JessieJamesFinalPkmnText:
	text "¡Tenemos una"
	line "orgullosa"
	cont "tradición de"
	cont "fracaso que"
	cont "mantener!"
	prompt

LoreleiFinalPkmnText:
	text "¡Solo probaste"
	line "un poco de mi"
	cont "poder!"
	prompt

AgathaFinalPkmnText:
	text "No creas que has"
	line "ganado, ¡mocoso!"
	prompt

StevenFinalPkmnText:
	text "Sabía que serías"
	line "fuerte…"
	prompt

CynthiaFinalPkmnText:
	text "¡No dejaré que"
	line "esto acabe ya!"
	prompt

InverFinalPkmnText:
	text "¡Le vas cogiendo"
	line "el truco!"
	prompt

CherylFinalPkmnText:
	text "No doy abasto"
	line "curando…"
	prompt

RileyFinalPkmnText:
	text "¡Tu equipo!"
	line "¡Siento tu aura"
	cont "tan poderosa!"
	prompt

BuckFinalPkmnText:
	text "¡Ahora sí! ¡Esto"
	line "está que arde!"
	prompt

MarleyFinalPkmnText:
	text "…Mi tiempo"
	line "contigo está"
	cont "llegando a su"
	cont "fin."
	prompt

MiraFinalPkmnText:
	text "¡Oh, no! ¡Eres"
	line "demasiado para mí!"
	prompt

AnabelFinalPkmnText:
	text "Tu talento…"
	line "Es real."
	prompt

DarachFinalPkmnText:
	text "¡Mi última"
	line "resistencia!"
	cont "¡Allez!"
	prompt

CaitlinFinalPkmnText:
	text "Incluso ahora,"
	line "debo mantener"
	cont "la calma…"
	prompt

CandelaFinalPkmnText:
	text "¡Hasta el final!"
	line "¡Qué emocionante!"
	prompt

BlancheFinalPkmnText:
	text "Sin duda estoy"
	line "impresionada."
	prompt

SparkFinalPkmnText:
	text "¡Eres bueno!"
	line "¡No hay duda!"
	prompt

FlanneryFinalPkmnText:
	text "Um… ¿Qué debería"
	line "hacer ahora?"
	prompt

MayleneFinalPkmnText:
	text "¡Esto no es el"
	line "final, amigo!"
	prompt

MarlonFinalPkmnText:
	text "Ay, tío…"

	para "Sé que estoy"
	line "casi acabado,"
	cont "¡Pero qué subidón!"
	prompt

ValerieFinalPkmnText:
	text "Vaya…"
	prompt

KukuiFinalPkmnText:
	text "¡Mi alma arde,"
	line "sí señor!"
	prompt

PiersFinalPkmnText:
	text "Yo no hago Otra"
	line "Vez, ¿Entiendes?"

	para "Ni canciones…"
	line "ni movimientos…"
	cont "¡Ni #mon!"
	prompt

LarryFinalPkmnText:
	text "Siempre doy mis"
	line "mejores resultados"

	para "cuando aprieta"
	line "el momento."
	prompt

BillFinalPkmnText:
	text "¡Yija!"
	line "¡Menuda batalla!"
	prompt

YellowFinalPkmnText:
	text "Mi último #mon…"
	line "¡Préstame tu"
	cont "poder!"
	prompt

WalkerFinalPkmnText:
	text "¡Todavía volamos!"
	prompt

ImakuniFinalPkmnText:
	text "¡Me voy corriendo!"
	line "…¿No puedo?"
	prompt

LawrenceFinalPkmnText:
	text "¡Inconcebible!"
	prompt

ReiFinalPkmnText:
	text "Aún no acabé."
	prompt
