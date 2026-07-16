---- MODULE ex2 ----
EXTENDS TLC, Integers


(* --algorithm ex

variables
    pos = [x \in {"farmer", "wolf", "goat", "cabbage"} |-> FALSE];

define 
    IsSafe(etat) == 
    /\ (etat["goat"] = etat["wolf"]) => (etat["farmer"] = etat["goat"])
    /\ (etat["goat"] = etat["cabbage"]) => (etat["farmer"] = etat["goat"])

    NextState(etat, passager) == 
        IF passager = "none" 
        THEN [etat EXCEPT !["farmer"] = ~etat["farmer"]]
        ELSE [etat EXCEPT !["farmer"] = ~etat["farmer"], ![passager] = ~etat[passager]]

    NotSolved ==
        \/ pos["goat"] # TRUE
        \/ pos["wolf"] # TRUE
        \/ pos["cabbage"] # TRUE
end define;

begin 
    Iterate: 
        while TRUE do 
            with who \in {"goat", "wolf", "cabbage", "none"} do 
                if who = "none" \/ pos[who] = pos["farmer"] then 
                    if IsSafe(NextState(pos, who)) then 
                        pos := NextState(pos, who);
                    end if;
                end if;
            end with;
        end while;
        
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "a75bd593" /\ chksum(tla) = "23731a01")
VARIABLE pos

(* define statement *)
IsSafe(etat) ==
/\ (etat["goat"] = etat["wolf"]) => (etat["farmer"] = etat["goat"])
/\ (etat["goat"] = etat["cabbage"]) => (etat["farmer"] = etat["goat"])

NextState(etat, passager) ==
    IF passager = "none"-dump dot,colorize,actionlabels graphe.dot
    THEN [etat EXCEPT !["farmer"] = ~etat["farmer"]]
    ELSE [etat EXCEPT !["farmer"] = ~etat["farmer"], ![passager] = ~etat[passager]]

NotSolved ==
    \/ pos["goat"] # TRUE
    \/ pos["wolf"] # TRUE
    \/ pos["cabbage"] # TRUE


vars == << pos >>

Init == (* Global variables *)
        /\ pos = [x \in {"farmer", "wolf", "goat", "cabbage"} |-> FALSE]

Next == \E who \in {"goat", "wolf", "cabbage", "none"}:
          IF who = "none" \/ pos[who] = pos["farmer"]
             THEN /\ IF IsSafe(NextState(pos, who))
                        THEN /\ pos' = NextState(pos, who)
                        ELSE /\ TRUE
                             /\ pos' = pos
             ELSE /\ TRUE
                  /\ pos' = pos

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

====
