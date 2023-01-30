//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

struct ContentView: View { //하나 이상의 시각적 요소를 정의한다.
    var body: some View { //
        NavigationView {
            Form {
                
                Section(header: Text("조금 다른 문법들")) {
                    NavigationLink(destination: IF______________()) {
                        Text("IF와 삼항연산자")
                    }
                }
                
                Section(header: Text("Base"), content: { //section의 헤더에 헤더 이름을 써주고 컨텐트안에 묶는다.
                    Group {
                        NavigationLink(destination: Text("basic")) {
                            Text("기본 네비게이션링크")
                        }
                        NavigationLink(destination: BasicAdaptableView()) {
                            Text("BasicAdaptableView")
                        }
                        NavigationLink(destination: AlertView()) {
                            Text("Alert")
                        }
                        NavigationLink(destination: TextFieldView()) {
                            Text("TextField")
                        }
                        NavigationLink(destination: PickerView()) {
                            Text("PickerView")
                        }
                        NavigationLink(destination: StackView()) {
                            Text("StackView")
                        }
                        NavigationLink(destination: ColorAndFrameView()) {
                            Text("ColorAndFrameView")
                        }
                        NavigationLink(destination: GradientView()) {
                            Text("GradientView")
                        }
                        NavigationLink(destination: ButtonView()) {
                            Text("ButtonView")
                        }
                        NavigationLink(destination: ViewAndModifiers()) {
                            Text("ViewAndModifiers")
                        }
                    }
                    Group {
                        NavigationLink(destination: AlertView()) {
                            Text("SearchableView")
                        }
                        NavigationLink(destination: MVVMMV()) {
                            Text("MVVM + Combine + TextField")
                        }
                        
                    }
                })
                
                Section {
                    NavigationLink(destination: ProfileView()) {
                        Text("Simple프로필")
                    }
                    NavigationLink(destination: CountingButton()) {
                        Text("CountingButton")
                    }
                    NavigationLink(destination: CurrencyView()) {
                        Text("계산앱")
                    }
                    NavigationLink(destination: SearchBarView()) {
                        Text("Use SearchBar")
                    }
                    NavigationLink(destination: Todos()) {
                        Text("간단한 TODO")
                    }
                    NavigationLink(destination: GuessTheFlag()) {
                        Text("GuessTheFlag")
                    }
                    NavigationLink(destination: APICallsPracticeView()) {
                        Text("SwiftUI로 API통신")
                    }
                    //Link("단순히 링크로 듸우기", destination: URL(string: "https://www.naver.com")!)
                }
                
                //이렇게 섹션아래에 헤더로 해줘도 된다.
                header : {
                    Text("Basic App") //자동으로 대문자전환.
                }
            }
            .navigationBarTitle("List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
