/*
 Bienvenue au Lab sur les Constantes et les Variables !

 Dans ce laboratoire, nous allons explorer comment utiliser les constantes et les variables en Swift.

 - Les constantes (créées avec `let`) sont des valeurs qui ne changent pas.
 - Les variables (créées avec `var`) sont des valeurs qui peuvent changer.

 Plongeons dans le vif du sujet ! 🚀
*/

// Exercice 1: Declarer une constante
// TODO: Declarer une constante nommée `annéeDeNaissance` et lui assigner la valeur de ton année de naissance.
//let monAnnéeDeNaissance: Int = 2008
let annéeDeNaissance = 1997

// Exercice 2: Declarer une variable
// TODO: Declarer une variable appelée `ageActuel` et lui assigner ton age actuel.
var ageActuel = 28
//var monAgeActuel = 16

// Exercice 3: Changer la valeur d'une variable
// Imagine que tu nous sommes un an plus tard. Mets à jour `ageActuel` pour refléter ce nouvel age.
//monAgeActuel+=1
ageActuel+=1

// Exercice 4: Essayer de changer une constante
// Dé-commenter la line juste en dessous pour voir ce qu'il se passe quand on essaie de modifier la valeur d'une constante !
// annéeDeNaissance += 1
// Question: Pourquoi cela ne fonctionne pas ?
// Réponse: cela ne fonctionne pas, car une constante est une valeur qui doit rester pareille à travers le temps. C'est logique quand on sait que la définition même d'une constante (d'un point de vue mathématique) selon le dictionnaire est Quantité dont la valeur ne change pas

/*
Mini Projet: Traqueur de vie (5 min)

Écrivons un petit script qui simule le fait de suivre ton age durant les prochaines années.
1. Déclarer une constante représentant `monAnnéeDeNaissance`.
2. Declarer une variable `annéeActuelle` (lui assigner l'année actuelle).
3. Calculer ton age en soustrayant `monAnnéeDeNaissance` de `annéeActuelle`.
4. Mettre à jour `annéeActuelle` pour simuler chaque nouvelle année, et mettre à jour ton age.

Essayer d'ajouter des instructions d'affichage pour suivre les changements.
*/
let monAnnéeDeNaissance: Int = 2008
var annéeActuelle: Int = 2025


//@mainActor donne l'accès root
@MainActor func CalculateAge() {
    var ageActuel = annéeActuelle - monAnnéeDeNaissance
    if (ageActuel <= 0) {
        print("Vous n'exister pas")
        return
    }
    print("Vous avez \(ageActuel) ans !")
}
@MainActor func IncrementerAnnée() {
    annéeActuelle+=1
    print("Une année vient de passer")
}


CalculateAge()

//  Incrémenter l'année et l'âge pour simuler le temps qui passe.
IncrementerAnnée()
IncrementerAnnée()
CalculateAge()
