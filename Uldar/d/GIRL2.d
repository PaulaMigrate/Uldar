BEGIN ~GIRL2~

IF ~NumTimesTalkedTo(0)
~ THEN BEGIN 0 
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY @2 
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~PartyGoldGT(99)~ THEN REPLY @4 DO ~TakePartyGold(100)~ GOTO 3
  IF ~~ THEN REPLY @5 GOTO 4
END

IF ~~ THEN BEGIN 2 
  SAY @6
  IF ~PartyGoldGT(99)~ THEN REPLY @7 DO ~TakePartyGold(100)~ GOTO 3
  IF ~~ THEN REPLY @8 GOTO 4
END

IF ~~ THEN BEGIN 3
  SAY @9 
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 4
  SAY @11 
  IF ~!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()
~ EXIT
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()
~ EXTERN ~AERIEJ~ 53
  IF ~!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Anomen")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()
~ EXTERN ~ANOMENJ~ 179
  IF ~!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()~ EXTERN ~JAHEIRAJ~ 349
END

IF ~~ THEN BEGIN 5 // from: 3.0
  SAY #48460 /* @11  */
  IF ~!IsValidForPartyDialog("Nalia")
!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()~ EXIT
  IF ~IsValidForPartyDialog("Nalia")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()~ EXTERN ~NALIAJ~ 226
  IF ~!IsValidForPartyDialog("Nalia")
IsValidForPartyDialog("Yoshimo")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()~ EXTERN ~YOSHJ~ 38
  IF ~!IsValidForPartyDialog("Nalia")
!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("FreeSlaves","GLOBAL",1)
AddexperienceParty(3500)
ReputationInc(1)
EscapeArea()~ EXTERN ~KORGANJ~ 57
END
