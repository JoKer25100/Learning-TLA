---- MODULE ex3 ----
EXTENDS TLC, Integers

Nb_B == 10 \* Number of black beans
Nb_W == 10 \* Number of white beans

(* --algorithm ex

variables
    sac = [w |-> Nb_W, b |-> Nb_B];

define

    ParityInvariant == 
        sac.w % 2 = Nb_W % 2

    IsEnough(s, b) == 
        /\ b <= s.b
        /\ (2 - b) <= s.w

end define;

begin 
    Iterate:
        while sac.w + sac.b > 1 do 
            with black \in 0..2 do
                if IsEnough(sac, black) then 
                    if black = 0 then 
                        sac := [w |-> sac.w - 2, b |-> sac.b + 1];
                    else
                        sac := [sac EXCEPT !.b = sac.b - 1]
                    end if;
                end if;
            end with;
        end while;

end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "3313beac" /\ chksum(tla) = "d9416fbe")
VARIABLES pc, sac

(* define statement *)
ParityInvariant ==
    sac.w % 2 = Nb_W % 2

IsEnough(s, b) ==
    /\ b <= s.b
    /\ (2 - b) <= s.w


vars == << pc, sac >>

Init == (* Global variables *)
        /\ sac = [w |-> Nb_W, b |-> Nb_B]
        /\ pc = "Iterate"

Iterate == /\ pc = "Iterate"
           /\ IF sac.w + sac.b > 1
                 THEN /\ \E black \in 0..2:
                           IF IsEnough(sac, black)
                              THEN /\ IF black = 0
                                         THEN /\ sac' = [w |-> sac.w - 2, b |-> sac.b + 1]
                                         ELSE /\ sac' = [sac EXCEPT !.b = sac.b - 1]
                              ELSE /\ TRUE
                                   /\ sac' = sac
                      /\ pc' = "Iterate"
                 ELSE /\ pc' = "Done"
                      /\ sac' = sac

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Iterate
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

====
