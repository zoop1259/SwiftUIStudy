//
//  GuessTheFlag.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/04.
//

/*
 도전
 가장 좋은 학습 방법 중 하나는 가능한 한 자주 자신의 코드를 작성하는 것입니다. 진행 상황을 완전히 이해하기 위해 이 앱을 확장해야 하는 세 가지 방법은 다음과 같습니다.
 1. 속성을 추가 @State하여 사용자의 점수를 저장하고 정답 또는 오답을 얻을 때 수정한 다음 경고 및 점수 레이블에 표시합니다.
 2. 누군가 잘못된 플래그를 선택하면 경고 메시지에서 실수를 알려주세요. “틀렸습니다! 예를 들어 저것은 프랑스의 국기입니다.”
 3. 게임에 8개의 질문만 표시되도록 합니다. 이때 점수를 판단하는 최종 경고가 표시되고 게임을 다시 시작할 수 있습니다.
 */


import SwiftUI

struct GuessTheFlag: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0 //도전1
    @State private var gameCount = 0 //도전3
    
    var body: some View {
        ZStack {
            //그래디언트를 추가하여 배경을 이쁘게..
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.2), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            
            VStack {
                Spacer() //공간을 알차게 사용하기
                
                Text("Guess the Flag")
//                    .font(.largeTitle.weight(.bold))
                    .font(.largeTitle.bold()) //간소화 방법
                    .foregroundColor(.white
                    )
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy)) //폰트 조절
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold)) //폰트 조절
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // 탭됨.
                            flagTapped(number)
                            gameCount += 1 //도전3
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding() //좌우 패딩 맞춰짐.
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            //아래처럼 순서를 action다음에 role하면 에러발생.
//            Button("Reset", action: askQuestion, role: .destructive)
            //아래처럼 순서를 지켜줘야한다. 근데 destructive를 생성하면 자동으로 캔슬이 생긴다.
//            Button("Reset", role: .destructive, action: resetTapped)
            if gameCount == 8 { //도전3
                Button("Reset", action: resetTapped)
            }
            Button("Continue", action: askQuestion)
        } message: {
            Text("현재 당신의 점수는 \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "정답"
            score += 1 //도전1
        } else {
            scoreTitle = "오답 당신이 선택한 답은 \(countries[correctAnswer])의 국기입니다." //도전2
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetTapped() {
        score = 0
    }
    
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}
