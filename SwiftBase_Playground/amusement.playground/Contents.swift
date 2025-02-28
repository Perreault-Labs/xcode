//bonjour je suis un commmentaire uniligne

/*
 je suis un commentaire sur plusieurs lignes
 ...
*/


print("hello world") // instruction pour écrire du texte dans la console


print("Somme de 10 / 2 \(10/2)")


let pi: Double = 3.14159 // on ne peut changer une constante

var age: Int = 16 // une variable peut être changée

print("valeur de pi:", pi)
print("mon age:", age)

age+=1
print("mon aeg:", age)



struct object {
    var name = "object name"
    
    func present() {print("hello my name is \(name)")}
}

var patate = object()

patate.present()
patate.name = "test"
patate.present()
