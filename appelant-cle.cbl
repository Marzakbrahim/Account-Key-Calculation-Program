       IDENTIFICATION DIVISION.
       PROGRAM-ID. appelant.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TAB-NUM ASSIGN TO
                       "C:/Users/HP/Downloads/TAB-NUM.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS L-Fst
                .
           SELECT TAB-NUM-SORTIE ASSIGN TO
                       "C:/Users/HP/Downloads/TAB-NUM-SORTIE2.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS L-Fst2
                .

           SELECT TAB-NUM-ERREURS ASSIGN TO
                       "C:/Users/HP/Downloads/TAB-NUM-ERREURS2.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS L-Fst3
                .
      *----------------------------------------------------------------*
       DATA DIVISION.
       FILE SECTION.
       FD TAB-NUM.
      * La structure des données d'entrées :
       01 NUM                                    PIC X(10).
       FD TAB-NUM-SORTIE.
      * La structure des données de sorties :
       01 SORTIE-CLE-ET-NUM.
           05 SORTIE-MUN                         PIC 9(10).
           05 SORTIE-CLE                         PIC 9(1).

       FD TAB-NUM-ERREURS.
      * La structure des enregistrements de erreurs :
       01 SORTIE-ERR.
           05 Phrase                             PIC X(25).
           05 Ligne-Erreur                       PIC 9(3).
           05 Deux-Points                        PIC X(3).
           05 ENR                                PIC X(10).
      *----------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      * Déclaration des variables.

       01 WS-Num-Cle-Err.
           COPY 'C:/Users/HP/OneDrive/Bureau/Structure-clcl-cle.txt'.

       01 COMPTEUR-ENTREE                                 PIC 9(10).
       01 COMPTEUR-SORTIE                                 PIC 9(10).
       01 COMPTEUR-ERREUR                                 PIC 9(10).
       01 EOF-Switch                                      PIC X(1).
           88 FIN-OUI VALUE 'Y'.
           88 FIN-NON VALUE 'X'.
       01 L-Fst                                           PIC 99.
       01 L-Fst2                                          PIC 99.
       01 L-Fst3                                          PIC 99.
      *----------------------------------------------------------------*
       PROCEDURE DIVISION.

      *********************
       PROGRAMME-PRINCIPAL.
      *********************

      *-----------------------------------------------------------------
      * Déroulement général du programme.
           PERFORM INITIALISATION-DEB           THRU INITIALISATION-FIN
           PERFORM TRAITEMENT                   THRU FIN-TRAITEMENT
           PERFORM FIN

           .
      *-----------------------------------------------------------------


      ********************
       INITIALISATION-DEB.
      ********************

           INITIALISE WS-Num-Cle-Err
                      COMPTEUR-ENTREE
                      COMPTEUR-SORTIE
                      COMPTEUR-ERREUR
                      L-Fst
                      L-Fst2
                      L-Fst3

           SET FIN-NON TO TRUE
           SET Erreur-Non TO TRUE
           OPEN INPUT TAB-NUM
                OUTPUT TAB-NUM-SORTIE
                OUTPUT TAB-NUM-ERREURS


           DISPLAY '**********************'
           DISPLAY '***  Calcul CLE    ***'
           DISPLAY '**********************'
           .
      *-----------------------------------------------------------------

      **************************
       INITIALISATION-FIN. EXIT.
      **************************


      ****************
       Lecturefichier.
      ****************
           READ TAB-NUM
               AT END
                   SET FIN-OUI TO TRUE
               NOT AT END
                   IF L-Fst NOT = ZERO
                       DISPLAY 'Erreur lecture fichier =' L-Fst
                    END-IF
                   DISPLAY "NUMERO  COMPTE :" NUM
                   ADD 1 TO COMPTEUR-ENTREE
           .
      ********************
       FIN-Lecturefichier.
      ********************

      ************
       TRAITEMENT.
      ************
           PERFORM UNTIL FIN-OUI
             PERFORM Lecturefichier THRU FIN-Lecturefichier
             MOVE NUM TO NUM-COMP
             CALL 'CLCCle' USING WS-Num-Cle-Err
             IF Erreur-Oui
               PERFORM Ecrire-fic-ERR THRU FIN-Ecrire-fic-ERR
             ELSE
               IF FIN-NON
                 MOVE Cle TO SORTIE-CLE
                 MOVE NUM-COMP TO SORTIE-MUN
                 PERFORM Ecrire-fichier THRU FIN-Ecrire-fichier
               END-IF
             END-IF
           END-PERFORM
           .
      ****************
       FIN-TRAITEMENT. EXIT.
      ****************

      ****************
       Ecrire-fichier.
      ****************
           WRITE SORTIE-CLE-ET-NUM
           IF L-Fst NOT = ZERO
                       DISPLAY 'Erreur lecture fichier =' L-Fst
           END-IF
           ADD 1 TO COMPTEUR-SORTIE
           .
      ********************
       Fin-Ecrire-fichier.
      ********************


      ****************
       Ecrire-fic-ERR.
      ****************
           MOVE "Erreur dans la ligne " TO Phrase
           MOVE COMPTEUR-ENTREE TO Ligne-Erreur
           MOVE " : " TO Deux-Points
           MOVE NUM-COMP TO ENR
           WRITE SORTIE-ERR
           IF L-Fst NOT = ZERO
                       DISPLAY 'Erreur lecture fichier =' L-Fst3
           END-IF
           ADD 1 TO COMPTEUR-ERREUR
           .
      ********************
       Fin-Ecrire-fic-ERR.
      ********************

      *****
       FIN.
      *****
      * Fermeture des fichiers :
           CLOSE TAB-NUM
                 TAB-NUM-SORTIE
                 TAB-NUM-ERREURS
           DISPLAY "Nombre d'enregistrements entrees :" COMPTEUR-ENTREE
           DISPLAY "Nombre d'enregistrements SORTIES :" COMPTEUR-SORTIE
           DISPLAY "Nombre d'enregistrements INCORRECTS :"
                                                         COMPTEUR-ERREUR
           DISPLAY 'Fin de traitement.'
           STOP RUN.


       END PROGRAM appelant.
