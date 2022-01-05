	object_const_def ; object_event constants
	const JUBILIFECITY_DAWNLUCAS
	const JUBILIFECITY_LOOKER

JubilifeCity_MapScripts:
	db 4 ; scene scripts
	scene_script .Dummy ; SCENE_JUBILIFECITY_FIRST_TIME
	scene_script .Dummy ; SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL
	scene_script .Dummy ; SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH
	scene_script .Dummy ; SCENE_JUBILIFECITY_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_JUBILIFE
	return

.Dummy:
	end

JubilifeCity_DawnLucasScript1:
	settableindex 0
	sjump JubilifeCity_DawnLucasScript

JubilifeCity_DawnLucasScript2:
	settableindex 1
	sjump JubilifeCity_DawnLucasScript

JubilifeCity_DawnLucasScript3:
	settableindex 2
	sjump JubilifeCity_DawnLucasScript

JubilifeCity_DawnLucasScript4:
	settableindex 3
JubilifeCity_DawnLucasScript:
	applymovement JUBILIFECITY_DAWNLUCAS, .EnterMovement
	showemote EMOTE_SHOCK, JUBILIFECITY_DAWNLUCAS, 15
	applymovementtable JUBILIFECITY_DAWNLUCAS, .ApproachPlayerMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetextgender .DawnCatchingText, .LucasCatchingText
	buttonsound
	readvar VAR_PARTYCOUNT
	ifless 4, .FewMon
	writetextgender .DawnManyMonText, .LucasManyMonText
	sjump .Join

.FewMon:
	writetextgender .DawnFewMonText, .LucasFewMonText
.Join:
	buttonsound
	writetextgender .DawnLearnMoreText, .LucasLearnMoreText
	waitbutton
	closetext
	follow JUBILIFECITY_DAWNLUCAS, PLAYER
	applymovementtable JUBILIFECITY_DAWNLUCAS, .FollowMovement
	turnobject JUBILIFECITY_LOOKER, DOWN
	applymovement JUBILIFECITY_DAWNLUCAS, .FinishFollowMovement
	opentext
	writetextgender .DawnThatGuyText, .LucasThatGuyText
	waitbutton
	closetext
	applymovement JUBILIFECITY_LOOKER, .LookerMovement
	pause 10
	applymovement JUBILIFECITY_DAWNLUCAS, .ToLookerMovement
	stopfollow
	applymovement PLAYER, .PlayerToLookerMovement
	opentext
	writetextgender .DawnExcuseMeText, .LucasExcuseMeText
	waitbutton
	closetext
	turnobject JUBILIFECITY_LOOKER, DOWN
	showemote EMOTE_SHOCK, JUBILIFECITY_LOOKER, 15
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext .LookerWhatText
	buttonsound
	writetext .HowDidYouKnowText
	buttonsound
	writetextgender .DawnSmallTalkText, .LucasSmallTalkText
	buttonsound
	writetext .KnowBetterText
	buttonsound
	writetext .CoverBlownText
	yesorno
	iftrue .SaidYes
	writetext .DontKnowText
	sjump .YesNoJoin

.SaidYes:
	writetext .StealingIsWrongText
.YesNoJoin:
	buttonsound
	writetext .ThievesAmongUsText
	waitbutton
;	verbosegiveitem VS_SEEKER ; remove?
; ignore fail case
	writetext .VsRecorderText
	waitbutton
	closetext
	turnobject JUBILIFECITY_LOOKER, LEFT
	pause 10
	turnobject JUBILIFECITY_LOOKER, RIGHT
	pause 10
	turnobject JUBILIFECITY_LOOKER, DOWN
	opentext
	writetext .HaveARequestText
	waitbutton
	closetext
	applymovement JUBILIFECITY_LOOKER, .LookerExitMovement
	disappear JUBILIFECITY_LOOKER
	moveobject JUBILIFECITY_LOOKER, 35, 16
	appear JUBILIFECITY_LOOKER
	special RestartMapMusic
	opentext
	writetextgender .DawnSoundsHardText, .LucasSoundsHardText
	waitbutton
	closetext
	applymovement JUBILIFECITY_DAWNLUCAS, .MoveToSchoolMovement
	turnobject PLAYER, LEFT
	opentext
	writetextgender .DawnSchoolText, .LucasSchoolText
	waitbutton
	closetext
	applymovement PLAYER, .MoveToSchoolMovement
	turnobject JUBILIFECITY_DAWNLUCAS, RIGHT
	opentext
	writetextgender .DawnYourPalText, .LucasYourPalText
	waitbutton
	closetext
	applymovement JUBILIFECITY_DAWNLUCAS, .DawnLucasLeaveMovement
	disappear JUBILIFECITY_DAWNLUCAS
	setscene SCENE_JUBILIFECITY_NOTHING
	end

.DawnCatchingText:
	text "DAWN: Hi, <PLAYER>!"

	para "Are you catching"
	line "#MON?"
	done

.LucasCatchingText:
	text "LUCAS: Hey,"
	line "<PLAYER>!"

	para "How many #MON"
	line "have you caught?"
	done

.DawnManyMonText:
	text "Wow! You've already"
	line "got @"
	text_decimal wScriptVar, 1, 1
	text " #MON with"
	cont "you!"

	para "At that pace, your"
	line "#DEX should be"
	cont "full in no time!"
	done

.LucasManyMonText:
	text "Whoa! You already"
	line "have @"
	text_decimal wScriptVar, 1, 1
	text " #MON"
	cont "with you!"
	done

.DawnFewMonText:
	text "…Um…"

	para "I think you'd feel"
	line "a lot safer if you"
	cont "were to catch some"
	cont "more."

	para "You know, like"
	line "when you need to"
	cont "travel to"
	cont "faraway places."
	done

.LucasFewMonText:
	text "Huh? I think you"
	line "should catch some"
	cont "more."

	para "It might be more"
	line "of a challenge"
	cont "raising a lot of"
	cont "#MON…"

	para "But it's worth it."
	line "The more #MON"
	cont "you have, the"
	cont "happier you'll be."
	done

.DawnLearnMoreText:
	text "Oh, I know! Don't"
	line "you think it's good"
	cont "to know more about"
	cont "#MON?"

	para "Sure it is! I know"
	line "just the place."

	para "Come on! Don't be"
	line "shy. Follow me!"
	done

.LucasLearnMoreText:
	text "Hey, that's right!"
	line "Don't you think it's"
	cont "better to know a"
	cont "lot about #MON?"

	para "Sure it is! There's"
	line "this great place"
	cont "for that."

	para "Come on! It's all"
	line "right. Follow me."
	done

.DawnThatGuyText:
	text "DAWN: That man…"
	line "What is he doing?"
	done

.LucasThatGuyText:
	text "LUCAS: That guy…"
	line "What's he doing?"
	done

.DawnExcuseMeText:
	text "DAWN: Um…"
	done

.LucasExcuseMeText:
	text "LUCAS: Uh, excuse…"
	done

.LookerWhatText:
	text "WHAAAT?!"
	done

.HowDidYouKnowText:
	text "MYSTERIOUS MAN:"
	line "…How did you know?"

	para "How did you unmask"
	line "me as a member of"
	cont "the INTERNATIONAL"
	cont "POLICE?!"
	done

.DawnSmallTalkText:
	text "DAWN: Huh? What? I"
	line "beg your pardon?"

	para "I was just making"
	line "conversation…"
	done

.LucasSmallTalkText:
	text "LUCAS: Huh? What?"
	line "Are you kidding?"

	para "I was just making"
	line "small talk…"
	done

.KnowBetterText:
	text "SHADY MAN: …Heh."
	line "You claim you were"
	cont "only making conv-"
	cont "ersation, do you?"

	para "But, I know better"
	line "not to believe"
	cont "that."
	cont "No, no, no."

	para "You recognized me"
	line "right away that I"
	cont "was someone"
	cont "extraordinary."

	para "That is why you"
	line "spoke to me, no?"

	para "Your power of"
	line "observation is"
	cont "fearsome!"

	para "Quite admirable,"
	line "you are!"
	done

.CoverBlownText:
	text "Now that my cover"
	line "has been blown,"
	cont "let me introduce"
	cont "myself."

	para "I am an elite"
	line "globe-trotting"
	cont "member of the"
	cont "INTERNATIONAL"
	cont "POLICE."

	para "My name… Ah, no, I"
	line "shall inform you"
	cont "only of my code"
	cont "name."

	para "My code name, it"
	line "is LOOKER. It is"
	cont "what they all call"
	cont "me."

	para "Incidentally, is"
	line "the saying, “Don't"
	cont "be a thief!”"
	cont "familiar to you?"
	done

.DontKnowText:
	text "LOOKER: No? You"
	line "claim to not know?"

	para "How could that be?"

	para "Perhaps your mama"
	line "has said it, but"
	cont "you have forgotten"
	cont "it, like usual?"

	para "Now listen, my"
	line "friends. It is"
	cont "wrong to take what"
	cont "belongs to others."
	done

.StealingIsWrongText:
	text "LOOKER: Yes, that"
	line "is correct."

	para "Taking that which"
	line "belongs to others"
	cont "is wrong."
	done

.ThievesAmongUsText:
	text "Unfortunately,"
	line "there are some who"
	cont "do not heed those"
	cont "words."

	para "In fact, here in"
	line "SINNOH, there are"
	cont "criminals stealing"
	cont "the #MON of"
	cont "others."

	para "I have, therefore,"
	line "been on the look-"
	cont "out for characters"
	cont "arousing my sus-"
	cont "picion."

	para "Incidentally, you"
	line "are TRAINERS, yes?"

	para "Perhaps you can"
	line "make use of this?"
	done

.VsRecorderText:
	text "That VS.RECORDER,"
	line "is is a nifty dev-"
	cont "ice for recording"
	cont "a match."

	para "I obtained it"
	line "because it is"
	cont "quite popular"
	cont "these days."

	para "But myself, I do"
	line "not do #MON"
	cont "battling often."

	para "It will be in"
	line "better hands with"
	cont "you."
	done

.HaveARequestText:
	text "LOOKER: Also, I"
	line "have a request."

	para "If you were to see"
	line "me again, I ask"
	cont "that you not talk"
	cont "to me, for I am on"
	cont "duty."

	para "…Actually, yes,"
	line "yes, you may speak"
	cont "to me. You must."

	para "Not because I am"
	line "lonely, no, no!"

	para "You must inform me"
	line "of bad guys!"
	cont "You must inform me"
	cont "of any happenings!"
	done

.DawnSoundsHardText:
	text "DAWN: …Working for"
	line "the INTERNATIONAL"
	cont "POLICE must be"
	cont "hard."
	done

.LucasSoundsHardText:
	text "LUCAS: Working for"
	line "the INTERNATIONAL"
	cont "POLICE sounds"
	cont "hard."
	done

.DawnSchoolText:
	text "<PLAYER>, here it"
	line "is. It's the"
	cont "TRAINER'S SCHOOL."

	para "The name says"
	line "it all!"
	done

.LucasSchoolText:
	text "<PLAYER>, here we"
	line "are. This is the"
	cont "TRAINER'S SCHOOL."

	para "The name says it"
	line "all!"
	done

.DawnYourPalText:
	text "I saw your friend"
	line "<RIVAL> go in"
	cont "earlier."

	para "He could still be"
	line "in there studying."

	para "OK, bye now!"
	done

.LucasYourPalText:
	text "Your pal <RIVAL>"
	line "went in earlier."

	para "He might still be"
	line "studying in there."

	para "OK, see you"
	line "around!"
	done

.ApproachPlayerMovement:
	dw .ApproachPlayerMovement1
	dw .ApproachPlayerMovement2
	dw .ApproachPlayerMovement3
	dw .ApproachPlayerMovement4

.FollowMovement:
	dw .FollowMovement1
	dw .FollowMovement2
	dw .FollowMovement3
	dw .FollowMovement4

.EnterMovement:
	step DOWN
	step DOWN
	step_end

.ApproachPlayerMovement1:
	step DOWN
	step LEFT
	step DOWN
	step_end

.ApproachPlayerMovement2:
	step DOWN
	step DOWN
	step_end

.ApproachPlayerMovement3:
	step DOWN
	step RIGHT
	step DOWN
	step_end

.ApproachPlayerMovement4:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

.FollowMovement1:
	step UP
	step RIGHT
REPT 10
	step UP
ENDR
	step_end

.FollowMovement2:
REPT 11
	step UP
ENDR
	step_end

.FollowMovement3:
	step UP
	step LEFT
REPT 10
	step UP
ENDR
	step_end

.FollowMovement4:
	step UP
	step LEFT
	step LEFT
REPT 10
	step UP
ENDR
	step_end

.LookerMovement:
	slow_step LEFT
	slow_step LEFT
	step LEFT
	step DOWN
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	remove_fixed_facing
	step_end

.PlayerToLookerMovement:
	step RIGHT
.ToLookerMovement:
.FinishFollowMovement:
	step UP
	step_end

.LookerExitMovement:
	slow_step RIGHT
	slow_step UP
	step RIGHT
	step RIGHT
	step_sleep 8
	big_step UP
	big_step LEFT
	big_step UP
	big_step UP
	step_end

.MoveToSchoolMovement:
	step DOWN
	step LEFT
	step LEFT
	step_end

.DawnLucasLeaveMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

JubilifeCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 33, 13, JUBILIFE_APARTMENT_NE_1F, 1
	warp_event 23, 31, JUBILIFE_APARTMENT_SE_1F, 1
	warp_event  9, 29, JUBILIFE_APARTMENT_SW_1F, 1
	warp_event 31, 25, JUBILIFE_POKEMON_CENTER_1F, 1
	warp_event 31, 19, JUBILIFE_POKEMART, 1
	warp_event 11, 11, POKETCH_COMPANY_1F, 1
	warp_event 14, 11, POKETCH_COMPANY_1F, 3
	warp_event 22, 11, TV_STATION_1F, 1
	warp_event 14, 25, POKEMON_COMMUNICATION_CENTER, 1
	warp_event 20, 23, TRAINERS_SCHOOL, 1

	db 10 ; coord events
	coord_event 26, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript1
	coord_event 27, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript2
	coord_event 28, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript3
	coord_event 29, 37, SCENE_JUBILIFECITY_FIRST_TIME, JubilifeCity_DawnLucasScript4
	coord_event 37, 14, SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL, CoordinatesEvent
	coord_event 37, 15, SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL, CoordinatesEvent
	coord_event 17, 27, SCENE_JUBILIFECITY_CANT_LEAVE_RIVAL, CoordinatesEvent
	coord_event 37, 14, SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH, CoordinatesEvent
	coord_event 37, 15, SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH, CoordinatesEvent
	coord_event 17, 27, SCENE_JUBILIFECITY_CANT_LEAVE_POKETCH, CoordinatesEvent

	db 11 ; bg events
	bg_event 31, 31, BGEVENT_READ, BGEvent
	bg_event 36, 13, BGEVENT_READ, BGEvent
	bg_event 30,  8, BGEVENT_READ, BGEvent
	bg_event  7, 13, BGEVENT_READ, BGEvent
	bg_event 24, 22, BGEVENT_READ, BGEvent
	bg_event 30, 12, BGEVENT_READ, BGEvent
	bg_event 24, 12, BGEVENT_READ, BGEvent
	bg_event 10, 12, BGEVENT_READ, BGEvent
	bg_event 32, 25, BGEVENT_READ, BGEvent
	bg_event 32, 19, BGEVENT_READ, BGEvent
	bg_event 11, 16, BGEVENT_ITEM, BGEvent

	db 15 ; object events
	object_event 27, 32, SPRITE_DAWN_LUCAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JUBILIFE_CITY_DAWNLUCAS
	object_event 30, 21, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JUBILIFE_CITY_LOOKER
	object_event 17, 26, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 26, 27, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 31, 28, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 32, 28, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 27, 19, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 24, 18, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 27, 11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 15, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 16, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19, 13, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 33, 20, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 22, 12, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9, 13, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
