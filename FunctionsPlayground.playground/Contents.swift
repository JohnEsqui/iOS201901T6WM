//: Playground - noun: a place where people can play

import UIKit

func helloWorld(){
    print("Hola mundo Cibertec")
}

helloWorld()

func calculateSumNaturals(number: Int) -> Int {
    return (number*(number+1))/2
}

print(calculateSumNaturals(number: 4))
print(calculateSumNaturals(number: 5))

// Funciones recursivas

func calculateSumNaturalsRecursive(number: Int) -> Int {
    if (number == 1) {
        return 1
    } else {
        return calculateSumNaturalsRecursive(number: number-1) + number
    }
}

print(calculateSumNaturalsRecursive(number: 4))




