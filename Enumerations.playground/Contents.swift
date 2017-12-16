//: Playground - noun: a place where people can play

import UIKit

enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}

var alignment = TextAlignment.justify

//print("Left has raw value \(TextAlignment.left.rawValue)")
//print("Right has raw value \(TextAlignment.right.rawValue)")
//print("Center has raw value \(TextAlignment.center.rawValue)")
//print("Justify has raw value \(TextAlignment.justify.rawValue)")
//print("The alignment variable has raw value \(alignment.rawValue)")

let myRawValue = 20
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    print("successfully coverted \(myRawValue) into a TextAlignment")
} else {
    print("\(myRawValue) has no corresponding TextAlignment case")
}

if alignment == .right {
    print("we should right-align the text!")
}

switch alignment {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
case .center:
    print("center aligned")
case .justify:
    print("justified")
}


enum ProgrammingLanguage: String {
    case swift
    case objectC = "objective-c"
    case c
    case cpp = "c++"
    case java
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")


enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")


enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    case rightTriangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        case let .rightTriangle(width: w, height: h):
            return (w * h) / 2
        }
    }
    
    func perimeter() -> Double {  // challenge
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * 4
        case let .rectangle(width: w, height: h):
            return (w + h) * 2
        case let .rightTriangle(width: w, height: h):
            return w + h + sqrt(pow(w, 2) + pow(h, 2))
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point
var rightTriangle = ShapeDimensions.rightTriangle(width: 3.0, height: 4.0)

print("square's area = \(squareShape.area())")
print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's area = \(rectShape.area())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's area = \(pointShape.area())")
print("point's perimeter = \(pointShape.perimeter())")
print("rightTriangle's area = \(rightTriangle.area())")
print("rightTriangle's perimeter = \(rightTriangle.perimeter())")


enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
                         motherName: String, motherAncestorsy: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr.", fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents),
                                               motherName: "Marsha", motherAncestorsy: .noKnownParents)




