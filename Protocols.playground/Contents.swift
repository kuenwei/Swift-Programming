//: Playground - noun: a place where people can play

import UIKit

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
    
}

//protocol PrintableTabularDataSource: TabularDataSource, CustomStringConvertible {
//
//}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    var firstRow = "|"
    var columnWidths = [Int]()
    
    for i in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.count)  // 每列寬度
    }
    
    print(firstRow)
    
    for i in 0..<dataSource.numberOfRows {
        var out = "|"
        
        for j in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)  // 標籤內容
            let paddingNeeded = columnWidths[j] - item.count  // 計算左邊需要寬度
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")  // 塞入左邊空格
            out += " \(padding)\(item) |"  // 取得空格和標籤內容字串
        }
        
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add (_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {  // 部門人數
        return people.count
    }
    
    var numberOfColumns: Int {  // 每個人有三個屬性
        return 3
    }
    
    func label(forColumn column: Int) -> String {  // 表頭屬性標籤
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {  // 人物對應屬性資料
        let person = people[row]
        let maxAge = 100
        switch column {
        case 0: return person.name
        case 1: return person.age < maxAge ? String(person.age) : "Err"
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")

department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)
//print(department)


protocol Toggleable {
    mutating func toggle()
}

enum Lightbulb: Toggleable {
    
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}
