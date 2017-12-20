//: Playground - noun: a place where people can play

import UIKit

enum Token {
    case number(Int)
    case plus
    case minus
}


class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Int, Character)
    }
    
    let input: String
    var position: String.Index
    
    init(input: String) {  // 用字串初始化
        self.input = input
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {  // 確保還沒到最後一個
            return nil
        }
        return input[position]  // 返回當前字符
    }
    
    // 前進
    func advance() {
        assert(position < input.endIndex, "Cannot advamce past endIndex!") // 發布時會被刪除，檢查條件為false會觸發後者參數的消息
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        // 返回數字以及不是數字的position
        while let nextCharacter = peek() {  // position的位置和lex()是共用的
            switch nextCharacter {
            case "0"..."9":
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                //print("getNumber: \(value)")
                advance()
            default:
                //print("getNumber: \(nextCharacter), not number so finished")
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()  // 解析表
        
        while let nextCharacter = peek() {  // 接續getNumber()跳出循環的position開始
            print("nextCharacter: \(nextCharacter)")
            switch nextCharacter {
            case "0"..."9":  // 遇到數字進入取數字函數，返回數字以及不是數字的position
                let value = getNumber()
                print("we get value: \(value)")
                tokens.append(.number(value))  // 數字加入解析表
            case "+":
                tokens.append(.plus)  // 加號加入解析表
                //print("add plus, move on")
                advance()
            case "-":
                tokens.append(.minus)  // 減號加入解析表
                advance()
            case " ":
                //print("white space, move on")
                advance()
            default:
                let distanceToPosition = Int(input.distance(from: input.startIndex, to: position))
                throw Lexer.Error.invalidCharacter(distanceToPosition, nextCharacter)  // 遇到不是數字、加號、空白，拋出錯誤，例如英文字母
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Int, Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {  // 用解析表初始化
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]  // 取得解析元素，數字或是加號
        position += 1  // 索引指向下一個
        return token
    }
    
    func getNumber() throws -> Int {  // 取數字的函數
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput  // 遇到加號循環，但是後面沒數字了
        }
        
        switch token {
        case .number(let value):
            return value  // 成功取得數字
        case .plus, .minus:
            throw Parser.Error.invalidToken(position, token)  // 加號後面還是加號不行
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber()  // 第一個應該是數字
        
        while let token = getNextToken() {  // 取第二個元素，要是符號；每輪都預期取到符號
            switch token {
            case .plus:
                let nextNumber = try getNumber()  // 符號後面必須是數字，下一輪還是不斷需要符號
                value += nextNumber  // 數字加總
            case .minus:
                let nextNumber = try getNumber()  // 符號後面必須是數字，下一輪還是不斷需要符號
                value -= nextNumber  // 減掉數字
            case .number:
                throw Parser.Error.invalidToken(position, token)  // 數字後面還是數字不行
            }
        }
        return value
    }
}

func evaluate(_ input: String) {
    print("Evaluate: \(input)")
    let lexer = Lexer(input: input)

    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser outut: \(result)")
    } catch Lexer.Error.invalidCharacter(let position, let character) {
        print("Input contained an invalid at index \(position):  \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let position, let token) {
        print("Invalid token durung parsing at index \(position): \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 5 + 3")
// evaluate("1 + 3 + 7a + 8")  // Input contained an invalid at index 9:  a
// evaluate("10 + 3 3 + 7")  // Invalid token durung parsing at index 4: number(3)
// evaluate("10 + 5 - 3 - 1")  // 11
// evaluate("1 + 2 + abcdefg")  // Input contained an invalid character: a
// evaluate("10 + ")  // Unexpected end of input during parsing
// evaluate("10 + + 3") // Invalid token durung parsing: plus
// evaluate("10 + 3 5") // Invalid token durung parsing: number(5)


