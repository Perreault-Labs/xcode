/*
Une fonction est un bloc de code réutilisable qui fait une tâche spécifique.
Une fonction est définie une fois et elle peut être appelée autant de fois que nécessaire.

Voici une structure basique de fonction:
*/

func salue() {
    print("Hello, World!")
}

/*
Dans cet exemple:
- `func` est le mot clé pour définir une fonction.
- `salue` est le nom de la fonction.
- `{}` est l'espace dans lequel place notre code à exécuter.

Pour appeler une fonction, il suffit d'utiliser le nom de la fonction, suivie par des parenthèses:
*/

salue()  // Cela affichera: "Hello, World!"


/*
Parfois, on veut passer des informations à une fonction.
C'est là où les paramètres entrent en jeu. Les Paramètres sont comme des mots de substitution qui vont nous permettre de passer de l'information.

Définissons une fonction qui prend un nom comme paramètre:
*/

func salue(nom: String) {
    print("Salut, \(nom)!")
}

// Appeler la fonction et passer la valeur du paramètre:
salue(nom: "Alice")  // Cela affichera: "Salut, Alice!"


/*
Les fonctions peuvent aussi retourner une valeur. Par exemple, définissons une fonction qui additionne deux nombres ensemble et retourne le résultat.

Voici comment on définit une fonction avec une valeur de retour:
*/

func additionne(a: Int, b: Int) -> Int {
    return a + b
}

// Pour appeler la fonction et utiliser la valeur de retour:
let sum = additionne(a: 10, b: 5)
print(sum)  // Cela affichera: 15

/*
Maintenant, à ton tour ! Créer une fonction qui:
- prend deux nombres en paramètres.
- retourne le produit de ces nombres.

Exemple:
Créer une fonction appelée `multiplie` qui multiplie deux nombres et retourne le résultat.
*/

func multiplie(multiplicande: Double, multiplicateur: Double) -> Double {
    return multiplicande * multiplicateur
}



// Teste ta fonction:
let multiplicande: Double = 10
let multiplicateur: Double = 20.4
print("La multiplication de \(multiplicande) par \(multiplicateur) donne \(multiplie(multiplicande: multiplicande, multiplicateur: multiplicateur))")

/*
Maintenant, essayons de créer plusieurs autres fonctions de toi-même !
- Créer une fonction qui prend en paramètre deux nombres et retourne leur différence.
- Créer une fonction qui prend un texte en paramètre et retourne une salutation personnalisée.
*/


//fonction 1 qui permet la divison
func division(dividende: Double, diviseur: Double) -> Double {
    return dividende / diviseur
}

let dividende: Double = 10.5
let diviseur: Double = 0.5
print("La division de \(dividende) par \(diviseur) donne \(division(dividende: dividende, diviseur: diviseur))")

//fonction 2 qui permet de faire des salutations
func salutation(nom: String) -> String {
    return "Salam alaykum, toi... Oui, toi, \(nom). "
}

let nom: String = "Elliot"
print(salutation(nom: nom))

