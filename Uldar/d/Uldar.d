BEGIN ~Uldar~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN PrimerContacto
  SAY @0
      =
      @1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("Uldaragradecido","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @3 DO ~SetGlobal("Uldaragradecido","GLOBAL",1)~ GOTO Semiorco
  IF ~~ THEN REPLY @4 DO ~SetGlobal("Uldaragradecido","GLOBAL",1)~ GOTO Decepcion
END

IF ~~ THEN BEGIN Semiorco
  SAY @5
IF ~!Race(Player1,HALFORC)~ THEN REPLY @6  EXIT
IF ~!Race(Player1,HALFORC)~ THEN REPLY @7 GOTO Decepcion
IF ~Race(Player1,HALFORC)~ THEN REPLY @8 EXIT
END

IF ~~ THEN BEGIN Decepcion
  SAY @9
  IF ~~ THEN DO ~SetGlobal("Uldardecepcionado","GLOBAL",1)~ EXIT
END


IF ~NumTimesTalkedToGT(0) Global("Uldardecepcionado","GLOBAL",1) Global("CeldaninoUldar","GLOBAL",0) !PartyHasItem("MISC4Z")~ THEN BEGIN FuerademiVista
  SAY @10
  IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedToGT(0) Global("Uldardecepcionado","GLOBAL",1) Global("CeldaninoUldar","GLOBAL",0) PartyHasItem("MISC4Z")~ THEN BEGIN Sorpresa 
  SAY @11
  IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedToGT(0) !Global("Uldardecepcionado","GLOBAL",1) Global("CeldaninoUldar","GLOBAL",0) PartyHasItem("MISC4Z")~ THEN BEGIN Liberado
  SAY @12
  IF ~~ THEN REPLY @13  EXIT 
END

IF WEIGHT #-1~NumTimesTalkedToGT(0) Global("HendakReleased","AR0406",2) Global("PuertaAbiertaUldar","GLOBAL",1) Global("UldarLibre","GLOBAL",0)~ THEN BEGIN Liberado
  SAY @14 
      =
      @15  
  IF ~~ THEN REPLY @16 DO ~SetGlobal("TomandoCerveza","GLOBAL",1) SetGlobal("UldarLibre","GLOBAL",1) EscapeAreaMove("AR0406",1373,1760,3)~ EXIT
END


IF WEIGHT #-2~NumTimesTalkedToGT(0) Global("HendakReleased","AR0406",3) Global("TomandoCerveza","GLOBAL",1) Global("UldarAgradece","GLOBAL",0)~ THEN BEGIN Descansando
  SAY @17
      =   
      @18
  IF ~~ THEN REPLY @19 GOTO Agradecido
  IF ~~ THEN REPLY @20 GOTO Agradecido
  IF ~~ THEN REPLY @21 GOTO Agradecido
END


IF ~~ THEN BEGIN Agradecido
  SAY @22
      =
      @23
  IF ~~ THEN REPLY @24 GOTO Chavales
  IF ~~ THEN REPLY @25 GOTO Propuesta2
  IF ~Global("Uldaragradecido","GLOBAL",1)~ THEN REPLY @26 GOTO Propuesta1 
END

IF ~~ THEN BEGIN Chavales
  SAY @27
      =
      @28
  IF ~~ THEN REPLY @29 GOTO Propuesta2
  IF ~~ THEN REPLY @30 DO ~EscapeArea()~ EXIT
END


IF ~~ THEN BEGIN Propuesta1
  SAY @31
      =
      @32 
  IF ~~ THEN REPLY @33 DO ~SetGlobal("UldarAgradece","GLOBAL",1) SetGlobal("UldarAdmitido","GLOBAL",1) SetGlobal("DialogosconUldar","LOCALS",1) SetGlobalTimer("UldarDialogo","GLOBAL",FOUR_DAYS) JoinParty()~ EXIT 
  IF ~~ THEN REPLY @34 DO ~EscapeArea()~ EXIT
  IF ~~ THEN REPLY @35 DO ~SetGlobal("UldarAgradece","GLOBAL",1) SetGlobal("UldarEsperando","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @36 DO ~SetGlobal("UldarAgradece","GLOBAL",1) SetGlobal("UldarAdmitido","GLOBAL",1) SetGlobal("DialogosconUldar","LOCALS",1) SetGlobalTimer("UldarDialogo","GLOBAL",FIVE_DAYS) JoinParty()~ EXIT 
END

IF ~~ THEN BEGIN Propuesta2
  SAY @37
      =
      @38 
  IF ~~ THEN REPLY @39 DO ~SetGlobal("UldarAgradece","GLOBAL",1) SetGlobal("UldarAdmitido","GLOBAL",1) SetGlobal("DialogosconUldar","LOCALS",1) SetGlobalTimer("UldarDialogo","GLOBAL",FIVE_DAYS) JoinParty()~ EXIT 
  IF ~~ THEN REPLY @40 DO ~SetGlobal("UldarAgradece","GLOBAL",1) SetGlobal("UldarEsperando","GLOBAL",1)~ EXIT
END


IF WEIGHT #-2~NumTimesTalkedToGT(0) Global("TomandoCerveza","GLOBAL",1) Global("UldarEsperando","GLOBAL",1) Global("UldarAdmitido","GLOBAL",0)~ THEN BEGIN BebiendoCerveza
  SAY @41
  IF ~~ THEN REPLY @42 DO ~SetGlobal("UldarAdmitido","GLOBAL",1) SetGlobal("DialogosconUldar","LOCALS",1) SetGlobalTimer("UldarDialogo","GLOBAL",FOUR_DAYS) JoinParty()~ EXIT
  IF ~~ THEN REPLY @43 EXIT
  IF ~~ THEN REPLY @44 EXIT
END

BEGIN ~UldarP~


IF ~Global("UldarAdmitido","GLOBAL",1)~ THEN BEGIN DejarGrupo
  SAY @45
    IF ~~ THEN REPLY @46 DO ~JoinParty()~ EXIT
    IF ~Global("UldarLealtad","GLOBAL",0)~ THEN REPLY @47 GOTO CoroCobre
    IF ~Global("UldarLealtad","GLOBAL",1)~ THEN REPLY @47 GOTO Infierno
END

IF ~~ THEN BEGIN CoroCobre
  SAY @48
      =
      @49
  IF ~~ THEN REPLY @50 DO ~SetGlobal("UldarAdmitido","GLOBAL",0) EscapeAreaMove("AR0406",1373,1760,3)~ EXIT
END  

IF ~~ THEN BEGIN Infierno
  SAY @51
  IF ~~ THEN DO ~SetGlobal("UldarAdmitido","GLOBAL",0)~ EXIT
END  

 
IF ~Global("UldarAdmitido","GLOBAL",0)~ THEN BEGIN Reencuentro
  SAY @41
  IF ~~ THEN REPLY @52 DO ~SetGlobal("UldarAdmitido","GLOBAL",1) JoinParty()~ EXIT
  IF ~~ THEN REPLY @53 EXIT
END


BEGIN ~Uldarj~


IF ~AreaCheck("AR0400") Global("UldarBarco1","GLOBAL",0)~ THEN BEGIN MisionCHARNAME
  SAY @54 
  IF ~~ THEN REPLY @55 GOTO UldarsabedeIrenicus
  IF ~~ THEN REPLY @56 GOTO Uldarseapunta
END


IF ~~ THEN BEGIN UldarsabedeIrenicus
  SAY @57
      =
      @58
  IF ~~ THEN REPLY @59 GOTO Uldarseapunta 
  IF ~~ THEN REPLY @60 GOTO Uldarseapunta
END


IF ~~ THEN BEGIN Uldarseapunta
  SAY @61  
      

  IF ~~ THEN REPLY @62 EXIT
  IF ~~ THEN REPLY @63 EXIT
  IF ~~ THEN REPLY @64 EXIT
END


IF ~AreaCheck("AR0405") See([ENEMY]) Global("UldarBarco1","GLOBAL",0)~ THEN BEGIN EntradaBarco1 
  SAY @65 
  IF ~~ THEN DO ~SetGlobal("UldarBarco1","GLOBAL",1)~ EXIT
END


IF ~AreaCheck("AR0405") !See([ENEMY]) Global("UldarBarco2","GLOBAL",0)~ THEN BEGIN EntradaBarco2 
  SAY @66 
  IF ~~ THEN REPLY @67 DO ~SetGlobal("UldarBarco2","GLOBAL",1)~ GOTO EntradaBarco3
END

IF ~~ THEN BEGIN EntradaBarco3
  SAY @68
      = 
      @69
  IF ~~ THEN REPLY @70 EXIT
  IF ~~ THEN REPLY @71 EXIT
END

IF ~AreaCheck("AR0405")  Global("QueesJarall","GLOBAL",1)~ THEN BEGIN QueesJarall 
  SAY @72
  IF ~~ THEN REPLY @73 GOTO QuedeciaJarall
  IF ~~ THEN REPLY @74 GOTO QuedeciaJarall
  IF ~~ THEN REPLY @75 GOTO QuedeciaJarall
END

IF ~~ THEN BEGIN QuedeciaJarall
  SAY @76
  IF ~~ THEN REPLY @77 DO ~SetGlobal("QueesJarall","GLOBAL",2)~ EXIT
  IF ~~ THEN REPLY @78 DO ~SetGlobal("QueesJarall","GLOBAL",2)~ EXIT
END



I_C_T HAEGAN 1 UldarHaegan
== ULDARJ IF ~InParty("Uldar")~ THEN @79
== HAEGAN IF ~InParty("Uldar")~ THEN @80
END

I_C_T HAEGAN 2 UldarHaegan
== ULDARJ IF ~InParty("Uldar")~ THEN @79
== HAEGAN IF ~InParty("Uldar")~ THEN @81
END

I_C_T HAEGAN 3 UldarHaegan
== ULDARJ IF ~InParty("Uldar")~ THEN @79
== HAEGAN IF ~InParty("Uldar")~ THEN @81
END


I_C_T VICG1 3 UldarArdeVico
== ULDARJ IF ~InParty("Uldar")~ THEN @82
END


I_C_T HENDAK 31 FinEsclavistas
== ULDARJ IF ~InParty("Uldar")~ THEN @83
== HENDAK IF ~InParty("Uldar")~ THEN @84 


== PLAYER1 IF ~InParty("Uldar")~ THEN @85
== HENDAK IF ~InParty("Uldar")~ THEN @86
== PLAYER1 IF ~InParty("Uldar")~ THEN @87  
== HENDAK IF ~InParty("Uldar")~ THEN @88
== HENDAK IF ~InParty("Uldar")~ THEN @89
== ULDARJ IF ~InParty("Uldar")~ THEN @90
END


I_C_T FIRKRA02 21 UldarFirkraag
== UldarJ IF ~InParty("Uldar")~ THEN @91
END


I_C_T YOSHJ 113 UldarYoshimo
== UldarJ IF ~InParty("Uldar")~ THEN @92
END


I_C_T PPSAEM2 17 UldarSaemon
== UldarJ IF ~InParty("Uldar")~ THEN @93
END

I_C_T BODHI 11 UldarBodhi1
== UldarJ IF ~InParty("Uldar")~ THEN @94
END

I_C_T UDSILVER 35 UldarAdalon
== UldarJ IF ~InParty("Uldar")~ THEN @95
END

I_C_T PLAYER1 18 UldarIrenicusDead
== UldarJ IF ~InParty("Uldar")~ THEN @96
END

I_C_T PLAYER1 25 UldarInfierno
== UldarJ IF ~InParty("Uldar")~ THEN @97
END


I_C_T HELLJON 7 UldarIrenicusInfierno1
== UldarJ IF ~InParty("Uldar")~ THEN @98 
END

I_C_T HELLJON 8 UldarIrenicusInfierno2
== UldarJ IF ~InParty("Uldar")~ THEN @98 
END

I_C_T HELLJON 9 UldarIrenicusInfierno3
== UldarJ IF ~InParty("Uldar")~ THEN @98 
END

I_C_T HELLJON 10 UldarIrenicusInfierno4
== UldarJ IF ~InParty("Uldar")~ THEN @98 
END



EXTEND_BOTTOM PLAYER1 33
IF ~IsValidForPartyDialog("Uldar") Global("UldarLealtad","GLOBAL",0)~ THEN DO ~SetGlobal("UldarLealtad","GLOBAL",1)~ GOTO P133Uldar
END

APPEND PLAYER1
  IF ~~ P133Uldar
   SAY @99
   ++ @100 EXTERN UldarJ doordie
   ++ @101 EXTERN UldarJ bowout
   ++ @102 EXTERN UldarJ thankyou
  END
END

APPEND UldarJ

  IF ~~ doordie
   SAY @103 
  IF ~~ GOTO tolend
  END

  IF ~~ bowout
   SAY @104
  IF ~~ GOTO tolend
  END

  IF ~~ thankyou
   SAY @105 
  IF ~~ GOTO tolend
  END

  IF ~~ tolend
   SAY @106
   COPY_TRANS PLAYER1 33 
  END

END


BEGIN ~BUldar~

IF ~Global("DialogosconUldar","LOCALS",2)~ THEN BEGIN UldarBanner01
  SAY @107 
  IF ~~ THEN REPLY @108 GOTO UldarBanner02
  IF ~~ THEN REPLY @109 GOTO UldarBanner02
  IF ~~ THEN REPLY @110 DO ~SetGlobalTimer("UldarDialogo","GLOBAL",FOUR_DAYS) IncrementGlobal("DialogosconUldar","LOCALS",1) ~ EXIT
END

IF ~~ THEN BEGIN UldarBanner02
  SAY @111
      =
      @112   
   IF ~~ THEN REPLY @113 GOTO UldarBanner03a
   IF ~~ THEN REPLY @114 GOTO UldarBanner03a
   IF ~~ THEN REPLY @115 GOTO UldarBanner03b
END


IF ~~ THEN BEGIN UldarBanner03a
  SAY @116
      =
      @117
      =
      @118
  IF ~~ THEN REPLY @119 DO ~SetGlobalTimer("UldarDialogo","GLOBAL",FOUR_DAYS) IncrementGlobal("DialogosconUldar","LOCALS",1) ~ EXIT
  IF ~~ THEN REPLY @120 DO ~SetGlobalTimer("UldarDialogo","GLOBAL",FOUR_DAYS) IncrementGlobal("DialogosconUldar","LOCALS",1) ~ EXIT
END


IF ~~ THEN BEGIN UldarBanner03b
  SAY @121
  IF ~~ THEN REPLY @122 DO ~SetGlobalTimer("UldarDialogo","GLOBAL",FIVE_DAYS) IncrementGlobal("DialogosconUldar","LOCALS",1) ~ EXIT
END

IF ~Global("DialogosconUldar","LOCALS",4)~ THEN BEGIN UldarBanner04
  SAY @123 
  IF ~~ THEN REPLY @124 GOTO UldarBanner05
  IF ~~ THEN REPLY @125 DO ~IncrementGlobal("DialogosconUldar","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN UldarBanner05
  SAY @126
      =
      @127
      =
      @128
  IF ~~ THEN REPLY @129 GOTO UldarBanner06
  IF ~~ THEN REPLY @130 GOTO UldarBanner06
END

IF ~~ THEN BEGIN UldarBanner06
  SAY @131
IF ~~ THEN DO ~IncrementGlobal("DialogosconUldar","LOCALS",1)~ EXIT
END


CHAIN
IF ~InParty("Minsc") InParty("Uldar") See("Minsc ") !StateCheck("Minsc",CD_STATE_NOTVALID) Global("BUldarMinsc","LOCALS",0)~ THEN BMINSC TCHAIN101
@132 DO ~SetGlobal("BUldarMinsc","LOCALS",1)~
== BUldar @133
== BMINSC @134
== BUldar @135
== BMINSC @136
== BUldar @137
== BMINSC @138
EXIT



CHAIN
IF ~InParty("Viconia") InParty("Uldar") See("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) Global("BUldarViconia","LOCALS",0)~ THEN BUldar TCHAIN102
@139 DO ~SetGlobal("BUldarViconia","LOCALS",1)~
==BVICONI @140
==BUldar @141
==BVICONI @142 
EXIT
