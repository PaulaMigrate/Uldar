
BEGIN ~GIRL1~

IF ~NumTimesTalkedTo(0)
~ THEN BEGIN 0 
  SAY @0 
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2  GOTO 1
END

IF ~~ THEN BEGIN 1 
  SAY @3  
  IF ~~ THEN DO ~SetGlobal("CeldaninoUldar","GLOBAL",1) AddexperienceParty(2500) EscapeArea() ~ EXIT
END
