BEGIN ~Uldar25~


IF ~Global("UldarSummoned","GLOBAL",1)~ THEN BEGIN InvocarUldar1 
  SAY @0
IF ~~ THEN REPLY @1 DO ~SetGlobal("UldarSummoned","GLOBAL",2)~ GOTO EnEquipo
IF ~~ THEN REPLY @2 DO ~SetGlobal("UldarSummoned","GLOBAL",2)~ GOTO EnEquipo
END


IF ~~ THEN BEGIN EnEquipo 
  SAY @3
  IF ~~ THEN REPLY @4 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @5 GOTO Fuera
END



IF ~~ THEN BEGIN Fuera 
  SAY @6 
  IF ~~ THEN DO ~SetGlobal("UldarFuera","GLOBAL",1) MoveToPointNoInterrupt([2550.1436]) Face(0)~ EXIT
END


IF ~Global("UldarFuera","GLOBAL",1)~ THEN DentroBis               
  SAY @7 
  IF ~~ THEN REPLY @8 DO ~JoinParty() SetGlobal("UldarFuera","GLOBAL",0)~ EXIT
  IF ~~ THEN REPLY @9 EXIT
END


//******************************************************************
//******************************************************************

BEGIN ~Uldar25p~

IF ~Global("UldarKickedOut","GLOBAL",0)~ THEN BEGIN AbandonarGrupo
  SAY @10
  IF ~~ THEN REPLY @11 DO ~SetGlobal("UldarKickedOut","GLOBAL",0) JoinParty()~ EXIT
  IF ~AreaCheck("AR4500")~ THEN REPLY @12 DO ~SetGlobal("UldarKickedOut","GLOBAL",1) MoveToPointNoInterrupt([2550.1436]) Face(0)~ EXIT
  IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN REPLY @13 DO ~SetGlobal("UldarKickedOut","GLOBAL",1)  CreateVisualEffectObject("SPDIMNDR",Myself) Wait(2) MoveBetweenAreas("AR4500",[2550.1436],0)~ EXIT
  IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN REPLY @14 DO ~SetGlobal("UldarKickedOut","GLOBAL",1)~ EXIT
END



IF ~Global("UldarKickedOut","GLOBAL",1)~ THEN BEGIN RegresarGrupo 
  SAY @15
  IF ~~ THEN REPLY @16 DO ~SetGlobal("UldarKickedOut","GLOBAL",0) JoinParty()~ EXIT
  IF ~~ THEN REPLY @17 GOTO Paciencia
  IF ~~ THEN REPLY @18 GOTO Paciencia
END


IF ~~ THEN BEGIN Paciencia 
  SAY @19 
  IF ~~ THEN EXIT
END


//****************************************************************
//****************************************************************

BEGIN ~Uldar25j~


I_C_T BAZDRA01 0 UldarAvisoDraconis
== Uldar25J IF ~InParty("Uldar")~ THEN @20
END


I_C_T SOLAR 67 UldarDecision
== Uldar25J IF ~InParty("Uldar")~ THEN @21
END

I_C_T FINSOL01 27 UldarAscendChoice
== Uldar25J IF ~InParty("Uldar")~ THEN @22
END



//********************************************************************


EXTEND_TOP SARVOLO 9 #7
IF ~InParty("Uldar")~ THEN REPLY @23 GOTO VoloUldar
END

CHAIN SARVOLO VoloUldar
@24 

== Uldar25J IF ~IsValidForPartyDialog("Uldar")~ THEN @25
EXTERN SARVOLO 9


//*******************************************************************
//*******************************************************************

BEGIN ~BUldar25~

CHAIN
IF ~InParty("Sarevok") See("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) Global("BUldarSarevok","LOCALS",0)~ THEN BUldar25 TCHAIN110
@26 DO ~SetGlobal("BUldarSarevok","LOCALS",1)~
== BSAREV25 @27
EXIT




