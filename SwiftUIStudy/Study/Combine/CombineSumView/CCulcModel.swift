//
//  CCulcModel.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/08.
//

import SwiftUI
import Combine

class CCulcModel : ObservableObject {
    @Published var firstValue = ""
    @Published var secondValue = ""
    
    var calculation: AnyPublisher<Int, Never> {
        Publishers.CombineLatest($firstValue, $secondValue)
            .map { (first, second) -> Int in
                let firstInt = Int(first) ?? 0
                let secondInt = Int(second) ?? 0
                return firstInt + secondInt
            }
            .eraseToAnyPublisher()
    }
}

/*
 extension Publisher {
     func await() -> Output {
         let semaphore = DispatchSemaphore(value: 0)
         var result: Output?
         var subscription: AnyCancellable?
         
         subscription = self.sink(
             receiveCompletion: { _ in semaphore.signal() },
             receiveValue: { value in result = value; semaphore.signal() }
         )
         
         semaphore.wait()
         subscription?.cancel()
         
         return result!
     }
 }
 위의 코드에서는 await 함수를 사용하여 Future 타입을 동기적으로 처리하도록 구현하였습니다. 이를 위해 DispatchSemaphore와 AnyCancellable을 사용하였습니다.






 */
