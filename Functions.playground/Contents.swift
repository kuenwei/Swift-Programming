//: Playground - noun: a place where people can play

import UIKit

func printGreeting() -> Void {
    print("Hello, playground.")
}

//printGreeting()

func printPersonalGreeting(to names: String...) {
    for name in names {
        print("Hello \(name), welcome to your playground.")
    }
}

//printPersonalGreeting(to: "Matt", "Chris", "Drew", "Pat")

func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
}

//print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0))
//print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))


var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)


func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangleWith(base: 3.0, height: 5.0)


func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds).")


func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}
let middleName = grabMiddleName(fromFullName: ("Matt", nil, "Mathias"))
if let theName = middleName {
    print(theName)
}


func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)!")
}
greetByMiddleName(fromFullName: ("Matt", "Danger", "Mathias"))


let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers
evenOddFunction([1, 2, 3])


// challenge
func siftBeans(fromGrocerylist list: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()
    for item in list {
        item.hasSuffix("en beans") ? beans.append(item) : otherGroceries.append(item)
    }
    return (beans, otherGroceries)
}

let result = siftBeans(fromGrocerylist: ["green beans", "milk", "black beans", "pinto beans", "apples"])
result.beans == ["green beans", "black beans", "pinto beans"]
result.otherGroceries == ["milk", "apples"]
