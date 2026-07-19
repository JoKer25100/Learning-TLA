# Modélisation et Vérification Formelle (TLA+ / PlusCal)

Ce dépôt centralise une série de travaux pratiques et de modélisations conceptuelles réalisés dans le cadre de l'étude des méthodes formelles. L'objectif de ces implémentations est de définir mathématiquement les règles et l'espace d'états de systèmes finis, puis d'utiliser le *Model Checking* pour valider des invariants de sécurité ou résoudre des problèmes complexes par exploration exhaustive.

## 🛠️ Technologies et Outils
* **Langages :** TLA+, PlusCal
* **Environnement de vérification :** TLA+ Toolbox (TLC Model Checker)

## 📂 Index des Exercices

Le tableau ci-dessous référence les différents modèles disponibles. Cliquez sur le nom du dossier pour accéder au code source et aux explications détaillées du problème.

| Dossier | Sujet Modélisé | Concepts Algorithmiques Abordés | Statut |
| :--- | :--- | :--- | :---: |
| [`01_Missionnaires_Cannibales`](./01_Missionnaires_Cannibales/) | Le puzzle des Missionnaires et Cannibales | Gardes de transition, Invariants de sécurité, Génération de trace d'erreur pour résolution | ✅ Terminé |
| [`02_Cabbage_Goat_Wolf`](./02_Cabbage_Goat_Wolf/) | Le problème du Loup, de la Chèvre et du Chou | Modélisation ensembliste/booléenne, Contraintes d'exclusion mutuelle, Automate à états finis | ✅ Terminé |
| [`03_Coffee_Can_Puzzle`](./03_Coffee_Can_Puzzle/) | Le puzzle de la boîte de café (Coffee Can Problem) | Non-déterminisme (`either/or`), Preuve formelle d'invariant (parité), Terminaison garantie | ✅ Terminé |
| [`04_Die_Hard_Jugs`](./04_Die_Hard_Jugs/) | Le problème des cruches d'eau (Die Hard 3) | Automates finis, Calcul de transitions (bornes et transferts), Résolution du plus court chemin par trace d'erreur | ✅ Terminé |

---
