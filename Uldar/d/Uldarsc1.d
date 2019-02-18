BEGIN ~Uldarsc1~

IF ~NumTimesTalkedTo(0) !Dead("announcer") !StateCheck("announcer",CD_STATE_NOTVALID)~ THEN BEGIN Gladiador 
  SAY @0
  IF ~~ THEN EXTERN ~ANNO1~ 2
END

 
IF ~~ THEN BEGIN 1
  SAY @1
  IF ~~ THEN EXTERN ~ULDGUA1~ 1
END


