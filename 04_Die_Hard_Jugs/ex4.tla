---- MODULE ex4 ----
EXTENDS TLC, Integers

M == 5 \* 
N == 3 \* 
K == 4 \*

(* --algorithm ex

variables 
    jug_m = 0;
    jug_n = 0;

define 
    NotSolved == 
        /\ jug_m # K
        /\ jug_n # K
    
    Conditions ==
        /\ jug_m <= M
        /\ jug_n <= N
    
end define;
    
    begin 
        Iterate:
            while TRUE do 
                either
                    jug_m := M; \* fill jug_m
                or
                    jug_n := N; \* fill jug_n
                or
                    jug_m := 0; \* empty jug_m
                or
                    jug_n := 0; \* empty jug_n
                or
                    if jug_m + jug_n > N then \* pour jug_m in jug_n 
                        jug_m := jug_m - (N - jug_n);
                        jug_n := N;
                    else
                        jug_n := jug_m + jug_n;
                        jug_m := 0;
                    end if;
                or
                    if jug_m + jug_n > M then \* pour jug_n in jug_m
                        jug_n := jug_n - (M - jug_m);
                        jug_m := M;
                    else
                        jug_m := jug_m + jug_n;
                        jug_n := 0;
                    end if;
                end either;
            end while;
                        
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "d0b1ef20" /\ chksum(tla) = "cc32efe8")
VARIABLES jug_m, jug_n

(* define statement *)
NotSolved ==
    /\ jug_m # K
    /\ jug_n # K

Conditions ==
    /\ jug_m <= M
    /\ jug_n <= N


vars == << jug_m, jug_n >>

Init == (* Global variables *)
        /\ jug_m = 0
        /\ jug_n = 0

Next == \/ /\ jug_m' = M
           /\ jug_n' = jug_n
        \/ /\ jug_n' = N
           /\ jug_m' = jug_m
        \/ /\ jug_m' = 0
           /\ jug_n' = jug_n
        \/ /\ jug_n' = 0
           /\ jug_m' = jug_m
        \/ /\ IF jug_m + jug_n > N
                 THEN /\ jug_m' = jug_m - (N - jug_n)
                      /\ jug_n' = N
                 ELSE /\ jug_n' = jug_m + jug_n
                      /\ jug_m' = 0
        \/ /\ IF jug_m + jug_n > M
                 THEN /\ jug_n' = jug_n - (M - jug_m)
                      /\ jug_m' = M
                 ELSE /\ jug_m' = jug_m + jug_n
                      /\ jug_n' = 0

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

====
