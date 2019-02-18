BEGIN ~ULDGUA1~

IF ~NumTimesTalkedTo(0) !Dead("announcer") !StateCheck("announcer",STATE_SLEEPING)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN EXTERN ~Uldarsc1~ 1
END

IF ~~ THEN BEGIN 1
  SAY @1
=
@2
IF ~~ THEN EXIT
END