import SwiftUI
import Combine

print("------------------- Just --------------------")
Just((0...5))
    .sink { value in
        print(value) //그저 Just안의 값이 방출됨. 0부터5가 방출되는게 아님.
    }


/*
let _ = Just(5)                     // 1
    .map { value -> String in     // 2 Just를 value로 value는 string
        return "a string"
    }
    .sink { receivedValue in      // 3 value를 receivedValue로
        print("The end result was \(receivedValue)")
    }

let _ = Just(5)
    .map { value -> String in
        switch value {
        case _ where value < 1:
            return "none"
        case _ where value == 1:
            return "one"
        case _ where value == 2:
            return "couple"
        case _ where value == 3:
            return "few"
        case _ where value > 8:
            return "many"
        default:
            return "some"
        }
    }
    .sink { receivedValue in
        print("The end result was \(receivedValue)")
    }
*/

print("------------------- map --------------------")
//일반적인 map과 같지만. 에러를 뱉어내지 않는다.
let numbers = [5,4,3,2,1,0]
let romanNumeralDict: [Int : String] =
   [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]
let cancellable = numbers.publisher
    .map { romanNumeralDict[$0] ?? "(unknown) \n" }
    .sink { print("\($0)", terminator: " ") } // Prints: "V IV III II I (unknown)"

print("----------------tryMap -----------------")

struct ParseError: Error {}
func romanNumeral(from:Int) throws -> String {
    let romanNumeralDict: [Int : String] =
        [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]
    guard let numeral = romanNumeralDict[from] else {
        throw ParseError()
    }
    return numeral
}
let numbers2 = [5, 4, 3, 2, 1, 0]
let cancellable2 = numbers2.publisher
    .tryMap { try romanNumeral(from: $0) }
    .sink(
        receiveCompletion: { print ("completion: \($0)") },
        receiveValue: { print ("\($0)", terminator: " ") }
     )






