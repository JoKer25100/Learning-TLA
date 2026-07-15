==== Missionaries And Cannibals ====


  * Difficulty: Easy
  * Example solution: https://github.com/tlaplus/Examples/tree/master/specifications/MissionariesAndCannibals
  * Type: Puzzle

In the missionaries and cannibals problem, three missionaries and three cannibals must cross a river using a boat which can carry at most two people, under the constraint that, for both banks, if there are missionaries present on the bank, they cannot be outnumbered by cannibals (if they were, the cannibals would eat the missionaries). The boat cannot cross the river by itself with no people on board. And, in some variations, one of the cannibals has only one arm and cannot row. From [[https://en.wikipedia.org/wiki/Missionaries_and_cannibals_problem|Wikipedia]].

Hint: You should specify the problem in TLA+ (define all the actors and how they interact with each other), then you can specify an invariant saying that this problem is impossible, and running model checking TLC should give you a sequence of logical steps to follow to solve the quiz.
