//: Playground - noun: a place where people can play

import UIKit

// var: declaro una variable
// let: declaro una constante
var str = "Hello, playground"

let name = "Jorge"

var myAge = 34

myAge += 2

// Ejercicio 01: Crear una constante de tipo Float cuyo valor es 4, de manera explícita

let explicitFloat: Float = 4

let newLabel = "Mi edad es " + String(myAge)

let oranges = 5
let apples = 3

let orangesSummary = "Tengo \(oranges) naranjas"
let applesSummary = "Tengo \(apples) manzanas"

let fruitsSummary = "Tengo \(oranges + apples) frutas"

let ageSummary = "Mi edad es \(myAge)"


// Arreglos

var notes: [Int]

notes = [Int]()

notes.append(16)
notes.append(18)
notes.append(17)
notes.append(15)

for i in notes {
    print(i)
}

// Diccionario

var person: [String:Any]

person = [
    "name": "Jorge",
    "age": 34,
    "dni": "42760965"
]

person["age"] = 35


//notes.remove(at: 0)










