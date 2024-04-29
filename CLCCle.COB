
      ******************************************************************
      *----------------------  SOUS PROGRAMME :------------------------*
      *------------Pour calculer la clé d'un numéro de compte----------*
      ******************************************************************


       IDENTIFICATION DIVISION.

       PROGRAM-ID. 'CLCCle'.


       ENVIRONMENT DIVISION.
      *----------------------
       CONFIGURATION SECTION.
       DATA DIVISION.


      *----------------------
       WORKING-STORAGE SECTION.
      *----------------------
       01 INDICE                                          PIC 9(2).
       01 RESTE1                                          PIC 9(10).
       01 SOMME-N7-N8                                     PIC 9(10).
       01 SOMME-RESULTATS                                 PIC 9(10).
       01 RESULTAT1                                       PIC 9(10).
       01 RESULTAT2                                       PIC 9(10).
       01 RESULTAT3                                       PIC 9(10).
       01 RESULTAT4                                       PIC 9(10).
       01 RESULTAT5                                       PIC 9(10).
       01 RESULTAT                                        PIC 9(10).
      *----------------------
       LINKAGE SECTION.
      *----------------------

       01 Num-Cle-Err.
           COPY 'C:/Users/HP/OneDrive/Bureau/Structure-clcl-cle.txt'.


      *=================================================================
       PROCEDURE DIVISION USING Num-Cle-Err.
      *=================================================================


      *-----------------------------------------------------------------
       PROGRAMME-PRINCIPAL.
      *--------------------

      *    Intelligence du programme :
           PERFORM INITIALISATION THRU FIN-INITIALISATION
           PERFORM TRAITEMENT THRU FIN-TRAITEMENT
           PERFORM FIN
           .

      *-----------------------------------------------------------------
       INITIALISATION.
      *---------------
           INITIALISE INDICE
                      RESULTAT1
                      RESULTAT2
                      RESULTAT3
                      RESULTAT4
                      RESULTAT5
                      RESULTAT
                      RESTE1
                      SOMME-N7-N8
                      SOMME-RESULTATS
           SET Erreur-Non TO TRUE
           .


      ********************
       FIN-INITIALISATION. EXIT.
      ********************
      *----------------------------------------------------------------*


       TRAITEMENT.
      *---------------
           IF NUM-COMP NOT NUMERIC
             SET Erreur-Oui TO TRUE
           ELSE
             PERFORM Calcul-INTER THRU FIN-Calcul-INTER
           END-IF
           .
      ****************
       FIN-TRAITEMENT. EXIT.
      ****************

      ***************
       Calcul-INTER.
      ***************
      *    Calcul de RESULTAT1 :
           IF N1 = 0
                  MOVE 0                               TO RESULTAT1
           ELSE
                  MOVE 0          TO RESULTAT1
               PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > N1
                           COMPUTE RESULTAT1 = RESULTAT1 + INDICE
               END-PERFORM
           END-IF.

      *    Calcul RESULTAT2 :
           COMPUTE RESULTAT2 = N1  + N2 + N3 + N4 + N5 .

      *    Calcul RESULTAT3 :
           MOVE FUNCTION MIN( N1 N2 N3 N4 )           TO RESULTAT3 .

      *    Calcul RESULTAT4 :
           IF N7 = 0
               MOVE 0                                  TO RESULTAT4
           ELSE
               IF N9 = 0
                   MOVE 1                              TO RESULTAT4
               ELSE
                   COMPUTE RESULTAT4 = N7 ** N9
               END-IF
           END-IF.

      *    Calcul RESULTAT5 :
           COMPUTE SOMME-N7-N8 = N7 + N8 .
           DIVIDE 2 INTO SOMME-N7-N8 GIVING RESULTAT REMAINDER RESTE1 .
           IF RESTE1 = 0
               COMPUTE RESULTAT5 = N8 + N10 - 2
           ELSE
               COMPUTE RESULTAT5 = N8 + N10 + 1
           END-IF.

      *    CALCUL DE LA CLE :
           COMPUTE SOMME-RESULTATS =
               RESULTAT1 + RESULTAT2 + RESULTAT3 + RESULTAT4 + RESULTAT5


           DIVIDE 10 INTO SOMME-RESULTATS GIVING RESULTAT REMAINDER Cle
           .
           DISPLAY " La cle est : " Cle .
      ************************
       FIN-Calcul-INTER. EXIT.
      ************************

      *-----------------------------------------------------------------
       FIN.
      *---------------
           GOBACK
           .

       END PROGRAM CLCCle.
