//: Playground - noun: a place where people can play

import UIKit

struct Point: Comparable {
    let x: Double
    let y: Double
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        // return (lhs.x < rhs.x) && (lhs.y < rhs.y)
        return lhs.distanceFromZero() < rhs.distanceFromZero()
    }
    
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x:(lhs.x + rhs.x) ,y: (lhs.y + rhs.y))
    }
    
    func distanceFromZero() -> Double {
        return sqrt(pow(x, 2) + pow(y, 2))
    }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
a.distanceFromZero()

let abEqual = (a == b)
let abNotEqual = (a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

let aPlusb = a + b
aPlusb.x
aPlusb.y

let e = Point(x: 3, y: 4)
let f = Point(x: 2, y: 5)
e.distanceFromZero()
f.distanceFromZero()

let eGreatedThanF = (e > f)
let eLessThanF = (e < f)
let cEqualToD = (e == f)

class Person: Equatable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
}

var p1 = Person(name: "Bob", age: 18)
var p2 = Person(name: "Lily", age: 20)
var people = [p1, p2]

let p1Index = people.index(of: p1)


class NewPerson {
    var name: String
    weak var spouse: NewPerson?
    
    init(name: String, spouse: NewPerson?) {
        self.name = name
        self.spouse = spouse
    }
}

let matt = NewPerson(name: "Matt", spouse: nil)
let drew = NewPerson(name: "Drew", spouse: nil)

infix operator +++

func +++(lhs: NewPerson, rhs: NewPerson) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

matt +++ drew
matt.spouse?.name
drew.spouse?.name

