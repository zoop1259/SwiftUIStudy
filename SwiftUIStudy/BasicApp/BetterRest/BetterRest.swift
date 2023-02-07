//
//  BetterRest.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/08.
//

import CoreML
import SwiftUI

struct BetterRest: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    //Cannot use instance member 'defaultWakeTime' within property initializer; property initializers run before 'self' is available 이 에러는 static을 사용해주면 된다.
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading,spacing: 5) {
                Text("일어나고 싶은 시간은?")
                    .font(.headline)
                
                DatePicker("시간을 정해주세요.",selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }

            VStack(alignment: .leading,spacing: 5) {
                Text("수면 시간은?")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) 시간", value: $sleepAmount, in: 4...12, step: 0.25)
            }
            
            VStack(alignment: .leading,spacing: 5) {
                Text("오늘 마실 커피량")
                    .font(.headline)
                
                Stepper(coffeeAmount == 1 ? "1 Cup" : "\(coffeeAmount) Cups", value: $coffeeAmount, in: 1...20)
            }
        }
        .navigationBarTitle("BetterRest")
        .toolbar {
            Button("계산", action: calculateBedTime)
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 //* 초 * 분
            let minute = components.minute ?? 0 * 60 // * 초
           
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "당신이 자야할 시간은..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            //무슨일!?
            alertTitle = "Error"
            alertMessage = "계산 중 문제가 생겼습니다."
        }
        showingAlert = true
    }
    
}

struct BetterRest_Previews: PreviewProvider {
    static var previews: some View {
        BetterRest()
    }
}
