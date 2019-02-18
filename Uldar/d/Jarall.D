BEGIN ~Jarall~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN DeGuardia
  SAY @0 
      =
      @1
  IF ~~ THEN REPLY @2 GOTO Explicacion
  IF ~~ THEN REPLY @3 DO ~ActionOverride("Jarall",Enemy()) SetGlobal("QueesJarall","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Explicacion
  SAY @4
  IF ~~ THEN  DO ~ActionOverride("Jarall",Enemy()) SetGlobal("QueesJarall","GLOBAL",1)~ EXIT
END


