CoDeSys+F   �                   @        @   2.3.9.59    @/    @                             ��b +    @      �d                   ��b        �C   @   q   C:\TwinCAT\PLC\LIB\STANDARD.LIB @                                                                                          CONCAT               STR1               ��              STR2               ��                 CONCAT                                         ��66  �   ����           CTD           M             ��           Variable for CD Edge Detection      CD            ��           Count Down on rising edge    LOAD            ��           Load Start Value    PV           ��           Start Value       Q            ��           Counter reached 0    CV           ��           Current Counter Value             ��66  �   ����           CTU           M             ��            Variable for CU Edge Detection       CU            ��       
    Count Up    RESET            ��           Reset Counter to 0    PV           ��           Counter Limit       Q            ��           Counter reached the Limit    CV           ��           Current Counter Value             ��66  �   ����           CTUD           MU             ��            Variable for CU Edge Detection    MD             ��            Variable for CD Edge Detection       CU            ��	       
    Count Up    CD            ��
           Count Down    RESET            ��           Reset Counter to Null    LOAD            ��           Load Start Value    PV           ��           Start Value / Counter Limit       QU            ��           Counter reached Limit    QD            ��           Counter reached Null    CV           ��           Current Counter Value             ��66  �   ����           DELETE               STR               ��              LEN           ��              POS           ��                 DELETE                                         ��66  �   ����           F_TRIG           M             ��
                 CLK            ��           Signal to detect       Q            ��           Edge detected             ��66  �   ����           FIND               STR1               ��              STR2               ��                 FIND                                     ��66  �   ����           INSERT               STR1               ��              STR2               ��              POS           ��                 INSERT                                         ��66  �   ����           LEFT               STR               ��              SIZE           ��                 LEFT                                         ��66  �   ����           LEN               STR               ��                 LEN                                     ��66  �   ����           MID               STR               ��              LEN           ��              POS           ��                 MID                                         ��66  �   ����           R_TRIG           M             ��
                 CLK            ��           Signal to detect       Q            ��           Edge detected             ��66  �   ����           REPLACE               STR1               ��              STR2               ��              L           ��              P           ��                 REPLACE                                         ��66  �   ����           RIGHT               STR               ��              SIZE           ��                 RIGHT                                         ��66  �   ����           RS               SET            ��              RESET1            ��                 Q1            ��
                       ��66  �   ����           SEMA           X             ��                 CLAIM            ��	              RELEASE            ��
                 BUSY            ��                       ��66  �   ����           SR               SET1            ��              RESET            ��                 Q1            ��	                       ��66  �   ����           TOF           M             ��           internal variable 	   StartTime            ��           internal variable       IN            ��       ?    starts timer with falling edge, resets timer with rising edge    PT           ��           time to pass, before Q is set       Q            ��	       2    is FALSE, PT seconds after IN had a falling edge    ET           ��
           elapsed time             ��66  �   ����           TON           M             ��           internal variable 	   StartTime            ��           internal variable       IN            ��       ?    starts timer with rising edge, resets timer with falling edge    PT           ��           time to pass, before Q is set       Q            ��	       0    is TRUE, PT seconds after IN had a rising edge    ET           ��
           elapsed time             ��66  �   ����           TP        	   StartTime            ��           internal variable       IN            ��       !    Trigger for Start of the Signal    PT           ��       '    The length of the High-Signal in 10ms       Q            ��	           The pulse    ET           ��
       &    The current phase of the High-Signal             ��66  �   ����    o   C:\TwinCAT\PLC\LIB\Iecsfc.lib @                                                                                          SFCACTIONCONTROL     
      S_FF                 RS    ��              L_TMR                    TON    ��              D_TMR                    TON    ��              P_TRIG                 R_TRIG    ��              SD_TMR                    TON    ��              SD_FF                 RS    ��              DS_FF                 RS    ��              DS_TMR                    TON    ��              SL_FF                 RS    ��              SL_TMR                    TON    ��           
      N            ��              R0            ��              S0            ��              L            ��              D            ��              P            ��              SD            ��	              DS            ��
              SL            ��              T           ��                 Q            ��                       4X5  �    ����    R    @                                                                                          MAIN     �      Presenza_Pezzo                   IX                    %           Pistone_Indietro                   IX                   %           Pistone_Avanti                   IX                   %        
   Pistone_On                   QX                   %       Variabili nastro	   Nastro_On                   QX                    %        
   Fine_Corsa                   IX                   %           NumPeN                     O   Variabili gestione timers per non creare conflitti tra nastro pistone e giostra   TimerNP                    TON                    Timer_GN                    TON                    Timer_Nastro                    TON                 
   ResetTimer                             AttesaNP    X                      Q                             Delay_Pistone                    TON                    Ritardo_Pistone                         Interfaccia Nastro-Giostra   InserimentoNG                      y   Il nastro deve mettere a TRUE quando sta inserendo un pezzo all'interno della giostra e a FALSE quando non lo sta facendo   FineInserimentoGN                             NReady                     D   Vero quando il nastro autorizza il pistone a spingere un nuovo pezzo   GStart                     -   Vero quando la giostra � autorizzata a girare   Movimento_Giostra               "    QX                  %           Giostra_BUSY               #    IX                  %           Giostra   	                        POSTO              $       :   Array che descrive lo stato di tutti i posti della giostra   TEMP   	                             %       H   Array di supporto per verificare delle condizioni su array di 8 elementi   presenza_fine_lav               &       �   Variabile che deve essere settata a TRUE quando tutti i pezzi presenti nella giostra hanno finito la lavorazione oppure non � presente nessun pezzo nella giostra   i              '       J   Contatore per il numero di movimenti della giostra (8 movimenti = un giro)   index              (       ,   Variabile di supporto per iterare sull'array   Sensore_Colore               *    IX                  %           Trapano_Basso               ,    IX                  %        	   TrapanoOn               -    QX                  %           TimerTrapano                    TON      .       V   timer che tiene conto del tempo di lavorazione trascorso per il pezzo sotto al trapano   FineTrapanazione               /              Trapano_Alto               0    IX                  %           Trapano_Down               1    QX                   %           Tastatore_Basso               3    IX                  %           Tastatore_Alto               4    IX                  %           Tastatore_Down               5    QX                  %           ValTastatore               6          Valore di output del tastatore   Pennarello_Down               8    QX                  %           Pennarello_Alto               9    IX                  %           Pennarello_Basso               :    IX                  %           Fine_Colorazione               ;              Pistone_PT5_On               =    QX                  %           Pistone_PT5_Avanti               >    IX                   %           Pistone_PT5_Indietro               ?    IX                  %           Pistone_PT6_On               A    QX                  %           Pistone_PT6_Avanti               B    IX                  %           Pistone_PT6_Indietro               C    IX                  %        
   Pezzo_Baia               D    IX                  %           INIT          (x := TRUE, _x := TRUE)                  SFCStepType                   DUMMY_PISTONE                  SFCStepType                   MOVIMENTO_PISTONE                  SFCStepType                   RITORNO_PISTONE                  SFCStepType                   DUMMY_NASTRO                  SFCStepType                   NASTRO_WAITING                  SFCStepType                   STOP_NASTRO                  SFCStepType                   MOVIMENTO_NASTRO                  SFCStepType                   LOCK_INSERIMENTO                  SFCStepType                   INSERIMENTO                  SFCStepType                   UNLOCK_INSRIMENTO                  SFCStepType                   DUMMY_GIOSTRA                  SFCStepType                   P0_BUSY                  SFCStepType                   P0_READY                  SFCStepType                   COLORE_BUSY                  SFCStepType                   PEZZO_SU_LASER                  SFCStepType                   COLORE_ROSSO                  SFCStepType                   COLORE_NON_ROSSO                  SFCStepType                   COLORE_READY                  SFCStepType                   TRAPANO_BUSY                  SFCStepType                   PEZZO_SU_TRAPANO                  SFCStepType                   SICURA_TRAPANO                  SFCStepType                   ABBASSA_TRAPANO                  SFCStepType                
   TRAPANO_ON                  SFCStepType                   ALZA_TRAPANO                  SFCStepType                   TRAPANO_READY                  SFCStepType                   TASTATORE_BUSY                  SFCStepType                   PEZZO_SU_TASTATORE                  SFCStepType                
   PEZZO_ALTO                  SFCStepType                   PEZZO_BASSO                  SFCStepType                   ALZA_TASTATORE                  SFCStepType                   TASTATORE_READY                  SFCStepType                   PENNARELLO_BUSY                  SFCStepType                   INIZIOCONTRASSEGNO                  SFCStepType                   COLORAZIONE                  SFCStepType                   RITORNO_PENNARELLO                  SFCStepType                   FINE_PENNARELLO                  SFCStepType                   SET_FINELAVORAZIONE                  SFCStepType                   P4_READY                  SFCStepType                   PISTONE5_BUSY                  SFCStepType                   INIZIOSCARTO5                  SFCStepType                   RITORRNOPISOTNE5                  SFCStepType                   PISTONE5_READY                  SFCStepType                   P6_BUSY                  SFCStepType                   PEZZO_SU_PISTPT6                  SFCStepType                   PISTONE                  SFCStepType                   RITORNO_PISTPT6                  SFCStepType                   P6_READY                  SFCStepType                   P7_BUSY                  SFCStepType                   P7_READY                  SFCStepType                   POSTAZIONIREADY                  SFCStepType                   GIOSTRACARICA                  SFCStepType                   FINELAVORAZIONI                  SFCStepType                   POSTIOCCUPATI                  SFCStepType                   POSTINONOCCUPATI                  SFCStepType                   PEZZOINPISTONE6                  SFCStepType                   GIOSTRACONPEZZI                  SFCStepType                   GIROGIOSTRA                  SFCStepType                   GIOSTRA_IN_MOVIMENTO                  SFCStepType                   RESETREADYGIOSTRA                  SFCStepType                   TIMERDAEMON                  SFCStepType                   AGGIUNGIPEZZOAGIOSTRA                   SFCActionType                   GESTORETIMERS                   SFCActionType                
   INITCONFIG                   SFCActionType                
   RESETREADY                   SFCActionType                   SETALTO                   SFCActionType                   SETBASSO                   SFCActionType                   SETRESETTIMER                   SFCActionType                   INITSETRESETTIMER          (x := TRUE, _x := TRUE)                  SFCStepType                   DUMMYTIMERNP                  SFCStepType                   PEZZO_DAVANTI_PISTONE                  SFCStepType                   PEZZO_TRANSITATO                  SFCStepType                   Fine_Colorazione__action                   SFCActionType                )   Giostra__O(10-i) MOD 8__C__PReady__action                   SFCActionType                )   Giostra__O(11-i) MOD 8__C__PReady__action                   SFCActionType                )   Giostra__O(12-i) MOD 8__C__PReady__action                   SFCActionType                )   Giostra__O(13-i) MOD 8__C__PReady__action                   SFCActionType                *   Giostra__O(14-i) MOD 8__C __PReady__action                   SFCActionType                *   Giostra__O(15-i) MOD 8__C __PReady__action                   SFCActionType                )   Giostra__O(8-i) MOD 8__C __PReady__action                   SFCActionType                )   Giostra__O(9-i) MOD 8__C __PReady__action                   SFCActionType                   GStart__action                   SFCActionType                   Nastro_On__action                   SFCActionType                   NReady__action                   SFCActionType                   Pennarello_Down__action                   SFCActionType                   Pistone_On__action                   SFCActionType                   Pistone_PT6_On__action                   SFCActionType                   ResetTimer__action                   SFCActionType                   Tastatore_Down__action                   SFCActionType                   Trapano_Down__action                   SFCActionType                   TrapanoOn__action                   SFCActionType                                    e��b  @    ����            
 �   ����   ?   ;   /   =   @   >   8      -      &   !   #   $   "   2   3   6   9   4   E       ( E      K   $E     K   2E     K   @E     K   UE                 bE         +     ��localhost  T�&�� obsw           U        L�     �� ��^w   ��d   >��     �k!@�&          �            ���       ��      U���� �� �]sw��@ �]sw          !� 8�    ��@       ��@ ��d�� � �� d�� �d������ ;�     ,   ,                                                        K        @   ��b7G  /*BECKCONFI3*/
        !9� @   @   �   �     3               
   Standard            	��b       *s��           VAR_GLOBAL
END_VAR
                                                                                  "   , 4 4 ��             Standard
         MAIN����               ��b                 $����                           ����             Standard ��b	��b                                      	��b                       VAR_CONFIG
END_VAR
                                                                                   '                  �              Global_Variables ��b	��b                        VAR_GLOBAL
END_VAR
                                                                                               '           	     r g t (            Variable_Configuration ��b	��b	                        VAR_CONFIG
END_VAR
                                                                                                 �   |0|0 @|    @Z   MS Sans Serif @       HH':'mm':'ss @      dd'-'MM'-'yyyy   dd'-'MM'-'yyyy HH':'mm':'ss�����                               4     �   ���  �3 ���   � ���     
    @��  ���     @      DEFAULT             System      �   |0|0 @|    @Z   MS Sans Serif @       HH':'mm':'ss @      dd'-'MM'-'yyyy   dd'-'MM'-'yyyy HH':'mm':'ss�����                      )   HH':'mm':'ss @                             dd'-'MM'-'yyyy @       '   $   , � � �P           ALTEZZA ��b	��b                      ,   TYPE ALTEZZA: (nd_A, basso, alto);
END_TYPE             #   , � � �6           COLORE ��b	��b                      ,   TYPE COLORE: (nd_C, rosso, altro);
END_TYPE             2   , 4 4 ��           LOCK_INGRESSO_GIOSTRA ��b	��b      i)OD].ne        �   TYPE LOCK_INGRESSO_GIOSTRA :
STRUCT
  FlagNastro: BOOL:=FALSE;
  FlagGIostra: BOOL:=FALSE;
  Turno: TURNO;
END_STRUCT
END_TYPE             "   , h h �           PEZZO ��b	��b                      P   TYPE PEZZO :
STRUCT
	Colore :COLORE;
	Altezza :ALTEZZA;
END_STRUCT
END_TYPE             !   , g 4 ~�           POSTO ��b	��b      ��    ��        �   TYPE POSTO :
STRUCT
	Presenza :BOOL;
	Pezzo :PEZZO;
	Ready :BOOL; (*uguale a 1 quando nel posto � terminato il lavoro*)
	Fine_Lavorazione :BOOL;
END_STRUCT
END_TYPE             3   , N N �           TURNO ��b	��b                      (   TYPE TURNO : (Giostr, nastro);
END_TYPE                  ,   Rf           MAIN e��b	e��b                      �	  PROGRAM MAIN
VAR

(*Variabili Pistone*)
  Presenza_Pezzo AT %IX0.0: BOOL;
  Pistone_Indietro AT %IX0.4: BOOL;
  Pistone_Avanti AT %IX0.2: BOOL;
  Pistone_On AT %QX0.2: BOOL;

(*Variabili nastro*)
  Nastro_On AT %QX0.0: BOOL;
  Fine_Corsa AT %IX0.6: BOOL;
  NumPeN: INT:= 0;

(*Variabili gestione timers per non creare conflitti tra nastro pistone e giostra*)
  TimerNP: TON;
  Timer_GN: TON;
  Timer_Nastro: TON;
  ResetTimer: BOOL := FALSE;
  AttesaNP: TIME:= t#0.6s;
  Q: BOOL;
  Delay_Pistone: TON;
  Ritardo_Pistone: BOOL;


(*Interfaccia Nastro-Giostra*)
  InserimentoNG: BOOL:=FALSE; (*Il nastro deve mettere a TRUE quando sta inserendo un pezzo all'interno della giostra e a FALSE quando non lo sta facendo*)
  FineInserimentoGN: BOOL;
  NReady: BOOL := TRUE;    (*Vero quando il nastro autorizza il pistone a spingere un nuovo pezzo*)
  GStart: BOOL := TRUE;    (*Vero quando la giostra � autorizzata a girare*)


(*variabili giostra*)
  Movimento_Giostra AT %QX3.4: BOOL;
  Giostra_BUSY AT %IX6.1: BOOL;
  Giostra: ARRAY[0..7] OF POSTO; (*Array che descrive lo stato di tutti i posti della giostra*)
  TEMP: ARRAY[0..7] OF BOOL; (*Array di supporto per verificare delle condizioni su array di 8 elementi*)
  presenza_fine_lav: BOOL; (*Variabile che deve essere settata a TRUE quando tutti i pezzi presenti nella giostra hanno finito la lavorazione oppure non � presente nessun pezzo nella giostra*)
  i: INT:=0; (*Contatore per il numero di movimenti della giostra (8 movimenti = un giro)*)
  index: INT; (*Variabile di supporto per iterare sull'array*)

  Sensore_Colore AT %IX2.1: BOOL;

  Trapano_Basso AT %IX2.5: BOOL := FALSE;
  TrapanoOn AT %QX3.7:BOOL;
  TimerTrapano: TON; (*timer che tiene conto del tempo di lavorazione trascorso per il pezzo sotto al trapano*)
  FineTrapanazione: BOOL := FALSE;
  Trapano_Alto AT %IX2.3: BOOL;
  Trapano_Down AT %QX7.0: BOOL;

  Tastatore_Basso AT %IX5.3: BOOL;
  Tastatore_Alto AT %IX2.7: BOOL;
  Tastatore_Down AT %QX3.6: BOOL := FALSE;
  ValTastatore: REAL; (*Valore di output del tastatore*)

  Pennarello_Down AT %QX3.3: BOOL;
  Pennarello_Alto AT %IX5.4: BOOL;
  Pennarello_Basso AT %IX5.5: BOOL;
  Fine_Colorazione: BOOL;

  Pistone_PT5_On AT %QX3.1:BOOL := FALSE;
  Pistone_PT5_Avanti AT %IX5.0: BOOL;
  Pistone_PT5_Indietro AT %IX5.1: BOOL;

  Pistone_PT6_On AT%QX3.5: BOOL := FALSE;
  Pistone_PT6_Avanti AT %IX5.7: BOOL;
  Pistone_PT6_Indietro AT %IX5.6: BOOL;
  Pezzo_Baia AT %IX5.2: BOOL;

END_VAR       Init 
   InitConfig   N    3        TRUE           Dummy_Pistone  1     -   Presenza_Pezzo AND NReady AND Ritardo_Pistone         Movimento_Pistone 
   Pistone_On   N    1    E     �/��              Action Movimento_Pistone - Exit M��b   NumPeN := NumPeN + 1;   Pistone_Avanti         Ritorno_Pistone 
   ResetTimer   P       NReady   R           Pistone_Indietro     Dummy_Pistone        Dummy_Nastro  1          NumPeN=0         Nastro_Waiting         NumPeN>0   O   NumPeN>0 AND NOT Fine_Corsa AND (Giostra_BUSY OR Giostra[(8-i) MOD 8].Presenza)         Stop_Nastro 	   Nastro_On   R        6   NOT Giostra_BUSY AND NOT Giostra[(8-i) MOD 8].Presenza     Lock_Inserimento    NumPeN>0 AND Fine_Corsa         Movimento_Nastro 	   Nastro_On   N           NOT Fine_Corsa   V   NumPeN>0 AND NOT Fine_Corsa AND NOT Giostra_BUSY AND NOT Giostra[(9-i) MOD 8].Presenza         Lock_Inserimento    GStart   R           NOT Giostra_BUSY         Inserimento 	   Nastro_On   N           FineInserimentoGN         Unlock_Insrimento    AggiungiPezzoAGiostra   P       GStart   S     ;     �/��              Action Unlock_Insrimento - Exit M��b   FineInserimentoGN := FALSE;
 /     ANNO(Gst           Action Unlock_Insrimento - Exit M��b   NumPeN := NumPeN - 1;   TRUE     Dummy_Nastro        Dummy_Giostra  1        TRUE           P0_Busy  1        TRUE         P0_Ready    Giostra[(8-i) MOD 8] .Ready   S                Colore_Busy        J   NOT giostra[(9-i) MOD 8].Presenza OR giostra[(9-i) MOD 8].Fine_Lavorazione   K   giostra[(9-i) MOD 8].Presenza AND NOT giostra[(9-i) MOD 8].Fine_Lavorazione         Pezzo_su_Laser           Sensore_Colore         Colore_Rosso   0     �/��              Action Colore_Rosso - Exit M��b+   giostra[(9-i) MOD 8].Pezzo.Colore := rosso;  )   Giostra[(9-i) MOD 8].Pezzo.Colore = Rosso      NOT Sensore_Colore         Colore_Non_Rosso   7     �/��              Action Colore_Non_Rosso - Exit M��b+   giostra[(9-i) MOD 8].Pezzo.Colore := altro;  )   Giostra[(9-i) MOD 8].Pezzo.Colore = Altro         Colore_Ready    Giostra[(9-i) MOD 8] .Ready   S                Trapano_Busy        M   Giostra[(10-i) MOD 8].Presenza AND NOT giostra[(10-i) MOD 8].Fine_Lavorazione         Pezzo_Su_Trapano       	 ?   Giostra[(10-i) MOD 8].Pezzo.Colore = Rosso AND NOT Giostra_BUSY         Sicura_Trapano         NOT Giostra_BUSY         Abbassa_Trapano    Trapano_Down   S           Trapano_Basso      
   Trapano_On 	   TrapanoOn   N           FineTrapanazione         Alza_Trapano    Trapano_Down   R     5     or= ssAN           Action Alza_Trapano - Exit M��b   FineTrapanazione := FALSE;     Trapano_Alto   0   NOT (Giostra[(10-i) MOD 8].Pezzo.Colore = Rosso)   L   NOT Giostra[(10-i) MOD 8].Presenza OR giostra[(10-i) MOD 8].Fine_Lavorazione         Trapano_Ready    Giostra[(10-i) MOD 8].Ready   S                Tastatore_Busy        b   Giostra[(11-i) MOD 8].Presenza AND NOT Giostra_BUSY AND NOT giostra[(11-i) MOD 8].Fine_Lavorazione         Pezzo_Su_Tastatore    Tastatore_Down   S     ?     �/��           !   Action Pezzo_Su_Tastatore - Entry M��b]   IF (i MOD 2) = 1 THEN
    ValTastatore := 0.6;
	ELSE
    		ValTastatore := 0.4;
END_IF;
    (   Tastatore_Basso AND (ValTastatore > 0.5)      
   Pezzo_Alto    SetAlto   N        *   Giostra[(11-i) MOD 8].Pezzo.Altezza = alto   )   Tastatore_Basso AND (ValTastatore <= 0.5)         Pezzo_Basso    SetBasso   N        +   Giostra[(11-i) MOD 8].Pezzo.Altezza = basso         Alza_Tastatore    Tastatore_Down   R           Tastatore_Alto   L   NOT Giostra[(11-i) MOD 8].Presenza OR giostra[(11-i) MOD 8].Fine_Lavorazione         Tastatore_Ready    Giostra[(11-i) MOD 8].Ready   S                Pennarello_Busy        �   Giostra[(12-i) MOD 8].Presenza AND (Giostra[(12-i) MOD 8].Pezzo.Altezza = basso) AND NOT Giostra_BUSY AND NOT giostra[(12-i) MOD 8].Fine_Lavorazione         InizioContrassegno    Pennarello_Down   S           Pennarello_Basso         Colorazione    Fine_Colorazione	   D T#200ms           Fine_Colorazione         Ritorno_Pennarello    Pennarello_Down   R           Pennarello_Alto   �   NOT Giostra[(12-i) MOD 8].Presenza OR NOT (Giostra[(12-i) MOD 8].Pezzo.Altezza = basso) OR giostra[(12-i) MOD 8].Fine_Lavorazione         Fine_Pennarello           Giostra[(12-i) MOD 8].Presenza         Set_FineLavorazione   @     �/��           "   Action Set_FineLavorazione - Entry M��b/   Giostra[(12-i) MOD 8].Fine_Lavorazione := TRUE;     TRUE   "   NOT Giostra[(12-i) MOD 8].Presenza         P4_Ready    Giostra[(12-i) MOD 8].Ready   S       Fine_Colorazione   R                Pistone5_Busy        h   Giostra[(13-i) MOD 8].Presenza AND NOT (Giostra[(13-i) MOD 8].Pezzo.Colore = Rosso) AND NOT Giostra_BUSY         InizioScarto5   1     �/��              Action InizioScarto5 - Entry M��b   Pistone_PT5_On := TRUE;     Pistone_PT5_Avanti         RitorrnoPisotne5   A     �/��              Action RitorrnoPisotne5 - Entry M��b�   Giostra[(13-i) MOD 8].Presenza:= FALSE;
Giostra[(13-i) MOD 8].Pezzo.Altezza := nd_a;
Giostra[(13-i) MOD 8].Pezzo.Colore := nd_c;
Giostra[(13-i) MOD 8].Fine_Lavorazione:=FALSE;

Pistone_PT5_On := FALSE;     Pistone_PT5_Indietro   R   NOT Giostra[(13-i) MOD 8].Presenza OR (Giostra[(13-i) MOD 8].Pezzo.Colore = Rosso)         Pistone5_Ready    Giostra[(13-i) MOD 8].Ready   S                P6_Busy           Giostra[(14-i) MOD 8].Presenza         Pezzo_su_PistPT6        k   Giostra[(14-i) MOD 8].Pezzo.Colore = Rosso AND NOT Giostra_Busy AND NOT Pezzo_Baia AND Pistone_PT6_Indietro         Pistone    Pistone_PT6_On   N           Pistone_PT6_Avanti         Ritorno_PistPT6     <     �/��              Action Ritorno_PistPT6 - Exit M��b�   Giostra[(14-i) MOD 8].Presenza := FALSE;
Giostra[(14-i) MOD 8].Fine_Lavorazione := FALSE;
Giostra[(14-i) MOD 8].Pezzo.Altezza := nd_A;
Giostra[(14-i) MOD 8].Pezzo.Colore := nd_C;   Pistone_PT6_Indietro   0   NOT (Giostra[(14-i) MOD 8].Pezzo.Colore = Rosso)   ;   Pezzo_Baia AND (Giostra[(14-i) MOD 8].Pezzo.Colore = Rosso)   $   NOT (Giostra[(14-i) MOD 8].Presenza)         P6_Ready    Giostra[(14-i) MOD 8] .Ready   S                P7_Busy         TRUE         P7_Ready    Giostra[(15-i) MOD 8] .Ready   S            �   Giostra[(8-i) MOD 8].Ready AND Giostra[(9-i) MOD 8].Ready AND Giostra[(10-i) MOD 8].Ready AND Giostra[(11-i) MOD 8].Ready AND Giostra[(12-i) MOD 8].Ready AND Giostra[(13-i) MOD 8].Ready AND Giostra[(14-i) MOD 8].Ready AND Giostra[(15-i) MOD 8].Ready         PostazioniReady      
  Giostra[(8-i) MOD 8].Presenza OR Giostra[(9-i) MOD 8].Presenza OR Giostra[(10-i) MOD 8].Presenza OR Giostra[(11-i) MOD 8].Presenza OR Giostra[(12-i) MOD 8].Presenza OR Giostra[(13-i) MOD 8].Presenza OR Giostra[(14-i) MOD 8].Presenza OR Giostra[(15-i) MOD 8].Presenza         GiostraCarica   9     �/��              Action GiostraCarica - Entry M��bz  FOR index := 0 TO 7 BY 1 DO
 	IF (NOT Giostra[index].Presenza OR Giostra[index].Fine_Lavorazione) THEN
	TEMP[index] := TRUE;
    	ELSE
       		TEMP[index] := FALSE;
  	END_IF;
END_FOR;

IF (TEMP[0] AND TEMP[1] AND TEMP[2] AND TEMP[3] AND TEMP[4] AND TEMP[5] AND TEMP[6] AND TEMP[7]) THEN
  	presenza_fine_lav := TRUE;
  	ELSE
    		presenza_fine_lav :=FALSE;
END_IF       NOT presenza_fine_lav      presenza_fine_lav         FineLavorazioni          Giostra[(8-i) MOD 8].Presenza AND Giostra[(9-i) MOD 8].Presenza AND Giostra[(10-i) MOD 8].Presenza AND Giostra[(11-i) MOD 8].Presenza AND Giostra[(12-i) MOD 8].Presenza AND Giostra[(13-i) MOD 8].Presenza AND Giostra[(14-i) MOD 8].Presenza AND Giostra[(15-i) MOD 8].Presenza         PostiOccupati         TRUE     ResetReadyGiostra   NOT (Giostra[(8-i) MOD 8].Presenza AND Giostra[(9-i) MOD 8].Presenza AND Giostra[(10-i) MOD 8].Presenza AND Giostra[(11-i) MOD 8].Presenza AND Giostra[(12-i) MOD 8].Presenza AND Giostra[(13-i) MOD 8].Presenza AND Giostra[(14-i) MOD 8].Presenza AND Giostra[(15-i) MOD 8].Presenza)         PostiNonOccupati           Giostra[(14-i) MOD 8].Presenza         PezzoInPistone6        /   Giostra[(8-i) MOD 8].Presenza AND INSERIMENTO.x     GiostraConPezzi 5   NOT (Giostra[(8-i) MOD 8].Presenza AND INSERIMENTO.x)   "   NOT Giostra[(14-i) MOD 8].Presenza     GiostraConPezzi   Dummy_GIostra       GiostraConPezzi         GStart         GiroGiostra   4     �/��              Action GiroGiostra - Entry M��b   Movimento_Giostra := TRUE;     Giostra_BUSY         Giostra_In_Movimento   6     �/��           #   Action Giostra_In_Movimento - Entry M��bV   IF i=7 THEN
    i:=0;
	ELSE
  	 i := i + 1;
END_IF;

Movimento_Giostra := FALSE;     NOT Giostra_BUSY         ResetReadyGiostra 
   ResetReady   S           TRUE     Dummy_Giostra        TimerDaemon    GestoreTimers   N       SetResetTimer   N    1            FALSE     TimerDaemond    -   ,     �}           AggiungiPezzoAGiostra ��bJ   Giostra[(8-i) MOD 8].Presenza := TRUE;
Giostra[(8-i) MOD 8].Ready :=TRUE;&   , ������           GestoreTimers ���b      �		Nastro_On�
ResetTimerETimerNP A TON         Q     �	INSERIMENTO.xETimer_GN A T#1sTON        FineInserimentoGN     �	Trapano_On.xETimerTrapano AT#2sTON        FineTrapanazione     �	Dummy_Pistone.xPresenza_PezzoEDelay_Pistone AT#0.4sTON         Ritardo_Pistoned      ,     ��         
   InitConfig ��b%   TimerNP.PT := t#20d;
NReady := TRUE;8   ,   �+        
   ResetReady ��bJ   FOR index := 0 TO 7 BY 1 DO
   Giostra[index].Ready := FALSE;
END_FOR;
=   , h h �           SetAlto ��b,   Giostra[(11-i) MOD 8].Pezzo.Altezza := alto;>   , � � �*           SetBasso ��b-   Giostra[(11-i) MOD 8].Pezzo.Altezza := basso;   , N N �           SetResetTimer  ��b       InitSetResetTimer         TRUE         DummyTimerNP        !   TimerNP.ET >=AttesaNP OR NumPeN=0   !   TimerNP.ET <AttesaNP AND NumPeN>0         Pezzo_Davanti_Pistone 
   ResetTimer   R        !   TimerNP.ET>=AttesaNP OR NumPeN =0     DummyTimerNP       Pezzo_Transitato    NReady   S           TRUE     DummyTimerNPd                  ����, � � '            STANDARD.LIB @F�w5!   Iecsfc.lib 12.5.98 11:03:00 @DX5      CONCAT @                	   CTD @        	   CTU @        
   CTUD @           DELETE @           F_TRIG @        
   FIND @           INSERT @        
   LEFT @        	   LEN @        	   MID @           R_TRIG @           REPLACE @           RIGHT @           RS @        
   SEMA @           SR @        	   TOF @        	   TON @           TP @              Global Variables 0 @           F   SFCActionControl @      SFCActionType       SFCStepType                      Globale_Variablen @                                             2                ����������������  
             ����                  ����  X���hÀ�                      POUs               MAIN                AggiungiPezzoAGiostra  -                  GestoreTimers  &               
   InitConfig                 
   ResetReady  8                  SetAlto  =                  SetBasso  >                  SetResetTimer         ����           
   Data types                 ALTEZZA  $                   COLORE  #                  LOCK_INGRESSO_GIOSTRA  2                   PEZZO  "                   POSTO  !                   TURNO  3   ����             Visualizations  ����              Global Variables                 Global_Variables                     Variable_Configuration  	   ����                                                              ��b                         	   localhost            P      	   localhost            P      	   localhost            P            �5\