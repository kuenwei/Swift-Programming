//: Playground - noun: a place where people can play

import UIKit

func greet(name: String, withGreetung greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greet(name: "Matt", withGreetung: "Hello,")
print(personalGreeting)

//func greeting(forName name: String) -> (String) -> String {
//    func greeting(_ greeting: String) -> String {
//        return "\(greeting) \(name)"
//    }
//    return greeting
//}
//
//let greetMattWith = greeting(forName: "Matt")
//let mattGreeting = greetMattWith("Hello,")

func greeting(_ greeting: String) -> (String) ->String {
    return { (name: String) -> String in
        return "\(greeting) \(name)"
    }
}
let friendlyGreetingFor = greeting("Hello,")
let mattGreeting = friendlyGreetingFor("Matt")
print(mattGreeting)

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var p = Person()
//let changeName = Person.changeTo
//let changeNameFromMattTo = changeName(&p)
//changeNameFromMattTo("John", "Gallagher")
p.changeTo(firstName: "John", lastName: "Gallagher")
p.firstName
p.lastName


