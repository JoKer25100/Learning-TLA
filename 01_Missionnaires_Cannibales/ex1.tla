---- MODULE ex1 ----
EXTENDS TLC, Integers

Nb_M == 3
Nb_C == 3

(* --algorithm ex

variables 
    \* Initialisation des variables avec l'état de départ
    rive_gauche = [m |-> Nb_M, c |-> Nb_C],
    bateau = "Gauche";
    
define 
    IsSafe(m,c) == 
        /\ m > 0 => m >= c
        /\ Nb_M - m > 0  => Nb_M - m >= Nb_C - c
    
    NotSolved ==
        \/ rive_gauche.m # 0 
        \/ rive_gauche.c # 0 
end define;
        
begin
    Iterate:
        while TRUE do
            with passagers_m \in 0..2, passagers_c \in 0..2 do
                if passagers_m + passagers_c >= 1 then 
                    if passagers_m + passagers_c <= 2 then 
                        if bateau = "Gauche" then
                            if rive_gauche.m >= passagers_m /\ rive_gauche.c >= passagers_c then 
                                if IsSafe(rive_gauche.m - passagers_m, rive_gauche.c - passagers_c) then
                                    bateau := "Droite";
                                    rive_gauche := [m |-> rive_gauche.m - passagers_m,
                                    c |-> rive_gauche.c - passagers_c];
                                end if;
                            end if;

                        else
                            if Nb_M - rive_gauche.m >= passagers_m /\ Nb_C - rive_gauche.c >= passagers_c then 
                                if IsSafe(rive_gauche.m + passagers_m, rive_gauche.c + passagers_c) then
                                    bateau := "Gauche";
                                    rive_gauche := [m |-> rive_gauche.m + passagers_m,
                                    c |-> rive_gauche.c + passagers_c];
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end with;
        end while;


end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "ff245ecb" /\ chksum(tla) = "1ca97e2b")
VARIABLES rive_gauche, bateau

(* define statement *)
IsSafe(m,c) ==
    /\ m > 0 => m >= c
    /\ Nb_M - m > 0  => Nb_M - m >= Nb_C - c

NotSolved ==
    \/ rive_gauche.m # 0
    \/ rive_gauche.c # 0


vars == << rive_gauche, bateau >>

Init == (* Global variables *)
        /\ rive_gauche = [m |-> Nb_M, c |-> Nb_C]
        /\ bateau = "Gauche"

Next == \E passagers_m \in 0..2:
          \E passagers_c \in 0..2:
            IF passagers_m + passagers_c >= 1
               THEN /\ IF passagers_m + passagers_c <= 2
                          THEN /\ IF bateau = "Gauche"
                                     THEN /\ IF rive_gauche.m >= passagers_m /\ rive_gauche.c >= passagers_c
                                                THEN /\ IF IsSafe(rive_gauche.m - passagers_m, rive_gauche.c - passagers_c)
                                                           THEN /\ bateau' = "Droite"
                                                                /\ rive_gauche' =                [m |-> rive_gauche.m - passagers_m,
                                                                                  c |-> rive_gauche.c - passagers_c]
                                                           ELSE /\ TRUE
                                                                /\ UNCHANGED << rive_gauche, 
                                                                                bateau >>
                                                ELSE /\ TRUE
                                                     /\ UNCHANGED << rive_gauche, 
                                                                     bateau >>
                                     ELSE /\ IF Nb_M - rive_gauche.m >= passagers_m /\ Nb_C - rive_gauche.c >= passagers_c
                                                THEN /\ IF IsSafe(rive_gauche.m + passagers_m, rive_gauche.c + passagers_c)
                                                           THEN /\ bateau' = "Gauche"
                                                                /\ rive_gauche' =                [m |-> rive_gauche.m + passagers_m,
                                                                                  c |-> rive_gauche.c + passagers_c]
                                                           ELSE /\ TRUE
                                                                /\ UNCHANGED << rive_gauche, 
                                                                                bateau >>
                                                ELSE /\ TRUE
                                                     /\ UNCHANGED << rive_gauche, 
                                                                     bateau >>
                          ELSE /\ TRUE
                               /\ UNCHANGED << rive_gauche, bateau >>
               ELSE /\ TRUE
                    /\ UNCHANGED << rive_gauche, bateau >>

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

====
