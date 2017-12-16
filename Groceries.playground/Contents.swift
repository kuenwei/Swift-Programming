//: Playground - noun: a place where people can play

import UIKit

/*
var groceryBag = Set<String>()
groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapple")
*/

// var groceryBag = Set(["Apples", "Oranges", "Pineapple"])
var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]

for food in groceryBag {
    print(food)
}

// Union
let hasBananas = groceryBag.contains("Bananas") // Bool
let friendGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendGroceryBag)

// Intersection
let roommateGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommateGroceryBag)

// isDisjoint
let yourSecondBag = Set(["Berries", "Yogurt"])
let roommateSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommateSecondBag) // Bool

// isSuperset
//let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
//let attendees: Set = ["Alicia", "Bethany", "Diana"]
//print(employees.isSuperset(of: attendees))

// formUnion
//var attendees: Set = ["Alicia", "Bethany", "Diana"]
//let visitors = ["Diana", "Marcia", "Nathaniel"]
//attendees.formUnion(visitors)
//print(attendees)

// formIntersection
//var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
//let neighbors = ["Bethany", "Eric", "Forlani", "Greta"]
//employees.formIntersection(neighbors)
//print(employees)

