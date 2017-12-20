//: Playground - noun: a place where people can play

import UIKit

struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems) // Stack<U>.init(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
 }

struct StackIterator<T>: IteratorProtocol {
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map { 2 * $0 }

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

print(doubledStack.pop())
print(doubledStack.pop())

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())

func myMap<T, U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.count }
print(stringLengths)

func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))  // true
print(checkIfDescriptionsMatch(1, 1.0))  // false
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))  // true

print("-----")

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

myStack.items  // [10, 20, 30]
var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() { // next()裡面是stack.pop()
    print("got \(value)")  // got 30, got 20, got 10
}

for value in myStack {
    print("for-in loop: got \(value)")
}

print("-----")

myStack.pushAll([1, 2, 3])
myStack.items  // [10, 20, 30, 1, 2, 3]
for value in myStack {
    print("after pushing: got \(value)")
}

print("-----")

myStack.items
var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1, 2, 3])  // [1, 2, 3]

myStack.pushAll(myOtherStack)  // [10, 20, 30, 1, 2, 3, 3, 2, 1]

for value in myStack {
    print("after pushing items onto stack, got \(value)")
}






