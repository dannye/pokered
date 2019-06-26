
; play all sounds
; first all sfx in each bank
; then all cries + modifiers
; then all attacks + modifiers

PlayAllSounds::
	; stop music
	ld a, $FF
	call PlaySound
	ld c, 60
	call DelayFrames

	; clear modifiers
	ld a, 0
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a

	; play sfx for audio 1
	ld a, BANK(SFX_Headers_1)
	ld hl, SoundsToPlay1
	call PlayAllSFXInBank

	; play sfx for audio 2
	ld a, BANK(SFX_Headers_2)
	ld hl, SoundsToPlay2
	call PlayAllSFXInBank

	; play sfx for audio 3
	ld a, BANK(SFX_Headers_3)
	ld hl, SoundsToPlay3
	call PlayAllSFXInBank

	; play all cries + modifiers
	call PlayAllCries

	; play all attacks + modifiers
	call PlayAllAttacks

	; restart music
	call PlayDefaultMusic
	ret

PlayAllSFXInBank:
	ld [wAudioROMBank], a
.soundLoop
	ld a, [hli]
	cp $FF
	jr z, .done
	call PlaySound
	call WaitForSoundToFinish
	ld c, 60
	call DelayFrames
	jr .soundLoop
.done
	ret

SoundsToPlay1:
	; AUDIO_1 AUDIO_2 AUDIO_3
	db SFX_NOISE_INSTRUMENT01
	db SFX_NOISE_INSTRUMENT02
	db SFX_NOISE_INSTRUMENT03
	db SFX_NOISE_INSTRUMENT04
	db SFX_NOISE_INSTRUMENT05
	db SFX_NOISE_INSTRUMENT06
	db SFX_NOISE_INSTRUMENT07
	db SFX_NOISE_INSTRUMENT08
	db SFX_NOISE_INSTRUMENT09
	db SFX_NOISE_INSTRUMENT10
	db SFX_NOISE_INSTRUMENT11
	db SFX_NOISE_INSTRUMENT12
	db SFX_NOISE_INSTRUMENT13
	db SFX_NOISE_INSTRUMENT14
	db SFX_NOISE_INSTRUMENT15
	db SFX_NOISE_INSTRUMENT16
	db SFX_NOISE_INSTRUMENT17
	db SFX_NOISE_INSTRUMENT18
	db SFX_NOISE_INSTRUMENT19
	db SFX_CRY_00
	db SFX_CRY_01
	db SFX_CRY_02
	db SFX_CRY_03
	db SFX_CRY_04
	db SFX_CRY_05
	db SFX_CRY_06
	db SFX_CRY_07
	db SFX_CRY_08
	db SFX_CRY_09
	db SFX_CRY_0A
	db SFX_CRY_0B
	db SFX_CRY_0C
	db SFX_CRY_0D
	db SFX_CRY_0E
	db SFX_CRY_0F
	db SFX_CRY_10
	db SFX_CRY_11
	db SFX_CRY_12
	db SFX_CRY_13
	db SFX_CRY_14
	db SFX_CRY_15
	db SFX_CRY_16
	db SFX_CRY_17
	db SFX_CRY_18
	db SFX_CRY_19
	db SFX_CRY_1A
	db SFX_CRY_1B
	db SFX_CRY_1C
	db SFX_CRY_1D
	db SFX_CRY_1E
	db SFX_CRY_1F
	db SFX_CRY_20
	db SFX_CRY_21
	db SFX_CRY_22
	db SFX_CRY_23
	db SFX_CRY_24
	db SFX_CRY_25

	db SFX_GET_ITEM_2
	db SFX_TINK
	db SFX_HEAL_HP
	db SFX_HEAL_AILMENT
	db SFX_START_MENU
	db SFX_PRESS_AB

	; AUDIO_1 AUDIO_3
	db SFX_GET_ITEM_1

	db SFX_POKEDEX_RATING
	db SFX_GET_KEY_ITEM
	db SFX_POISONED
	db SFX_TRADE_MACHINE
	db SFX_TURN_ON_PC
	db SFX_TURN_OFF_PC
	db SFX_ENTER_PC
	db SFX_SHRINK
	db SFX_SWITCH
	db SFX_HEALING_MACHINE
	db SFX_TELEPORT_EXIT_1
	db SFX_TELEPORT_ENTER_1
	db SFX_TELEPORT_EXIT_2
	db SFX_LEDGE
	db SFX_TELEPORT_ENTER_2
	db SFX_FLY
	db SFX_DENIED
	db SFX_ARROW_TILES
	db SFX_PUSH_BOULDER
	db SFX_SS_ANNE_HORN
	db SFX_WITHDRAW_DEPOSIT
	db SFX_CUT
	db SFX_GO_INSIDE
	db SFX_SWAP
	db SFX_59
	db SFX_PURCHASE
	db SFX_COLLISION
	db SFX_GO_OUTSIDE
	db SFX_SAVE

	; AUDIO_1
	;db SFX_POKEFLUTE
	db SFX_SAFARI_ZONE_PA
	db $FF

SoundsToPlay2:
	; AUDIO_2
	db SFX_LEVEL_UP

	db SFX_BALL_TOSS
	db SFX_BALL_POOF
	db SFX_FAINT_THUD
	db SFX_RUN
	db SFX_DEX_PAGE_ADDED
	db SFX_CAUGHT_MON
	db SFX_PECK
	db SFX_FAINT_FALL
	db SFX_BATTLE_09
	db SFX_POUND
	db SFX_BATTLE_0B
	db SFX_BATTLE_0C
	db SFX_BATTLE_0D
	db SFX_BATTLE_0E
	db SFX_BATTLE_0F
	db SFX_DAMAGE
	db SFX_NOT_VERY_EFFECTIVE
	db SFX_BATTLE_12
	db SFX_BATTLE_13
	db SFX_BATTLE_14
	db SFX_VINE_WHIP
	db SFX_BATTLE_16
	db SFX_BATTLE_17
	db SFX_BATTLE_18
	db SFX_BATTLE_19
	db SFX_SUPER_EFFECTIVE
	db SFX_BATTLE_1B
	db SFX_BATTLE_1C
	db SFX_DOUBLESLAP
	db SFX_BATTLE_1E
	db SFX_HORN_DRILL
	db SFX_BATTLE_20
	db SFX_BATTLE_21
	db SFX_BATTLE_22
	db SFX_BATTLE_23
	db SFX_BATTLE_24
	db SFX_BATTLE_25
	db SFX_BATTLE_26
	db SFX_BATTLE_27
	db SFX_BATTLE_28
	db SFX_BATTLE_29
	db SFX_BATTLE_2A
	db SFX_BATTLE_2B
	db SFX_BATTLE_2C
	db SFX_PSYBEAM
	db SFX_BATTLE_2E
	db SFX_BATTLE_2F
	db SFX_PSYCHIC_M
	db SFX_BATTLE_31
	db SFX_BATTLE_32
	db SFX_BATTLE_33
	db SFX_BATTLE_34
	db SFX_BATTLE_35
	db SFX_BATTLE_36
	db SFX_SILPH_SCOPE
	db $FF

SoundsToPlay3:
	; AUDIO_3
	db SFX_INTRO_LUNGE
	db SFX_INTRO_HIP
	db SFX_INTRO_HOP
	db SFX_INTRO_RAISE
	db SFX_INTRO_CRASH
	db SFX_INTRO_WHOOSH
	db SFX_SLOTS_STOP_WHEEL
	db SFX_SLOTS_REWARD
	db SFX_SLOTS_NEW_SPIN
	db SFX_SHOOTING_STAR
	db $FF

PlayAllCries:
	ld a, 1
.cryLoop
	push af
	ld [wd11e], a
	farcall PokedexToIndex
	ld a, [wd11e]
	call PlayCry
	ld c, 60
	call DelayFrames
	pop af
	inc a
	cp NUM_POKEMON + 1
	jr z, .done
	jr .cryLoop
.done
	ret

PlayAllAttacks:
	ld a, BANK(SFX_Headers_2)
	ld [wAudioROMBank], a
	ld a, NUM_ATTACKS
	ld hl, MoveSoundTable
.attackLoop
	push af
	ld a, BANK(MoveSoundTable)
	ld bc, 1
	ld de, wUnusedC000
	call FarCopyData
	ld a, BANK(MoveSoundTable)
	ld bc, 1
	ld de, wFrequencyModifier
	call FarCopyData
	ld a, BANK(MoveSoundTable)
	ld bc, 1
	ld de, wTempoModifier
	call FarCopyData
	ld a, [wUnusedC000]
	call PlaySound
	call WaitForSoundToFinish
	ld c, 60
	call DelayFrames
	pop af
	dec a
	jr z, .done
	jr .attackLoop
.done
	ret
