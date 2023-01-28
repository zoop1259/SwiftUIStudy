import SwiftUI
import Combine

Just((0...5))
    .sink { value in
        print(value) //그저 Just안의 값이 방출됨. 처음엔 0부터 5까지 방출되는줄 ㅋㅋ
    }



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

let a = ["data":["id","name"]]
print(a)
let b = a
    .map{ $0 }
print(b)
let c = a.flatMap{$0}
print(c)


