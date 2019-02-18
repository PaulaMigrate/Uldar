EXTEND_TOP FATESP 6

   IF ~!Dead("Uldar")
       !InMyArea("Uldar")
       Global("UldarSummoned","GLOBAL",0)~ THEN

      REPLY @0 DO ~SetGlobal("UldarSummoned","GLOBAL",1)~ GOTO 8
END


