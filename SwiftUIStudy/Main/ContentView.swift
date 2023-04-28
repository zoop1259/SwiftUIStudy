//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

///퀵헬프 주석 퀵헬프를 띄웠을떄 Summarr에 뜨는 글 ( option + CMD + / )
struct ContentView: View { //하나 이상의 시각적 요소를 정의한다.
  //아래처럼 한방에 작성할 수 있다.
  /**
    body의 (Summary 부분)
   
   >(Description 부분)
   - Papameters:
       - property: 각각의 View들을 Form으로...
   
   위처럼 비워야 한줄이 띄워진다. (주석에선 두줄을 띄워야한다는것.)
   *[이렇게하면 기울어진다]*
   **[이렇게하면 굵어진다]**
    [이건 실험용 네이버링크](www.naver.com)
  #[큰제목이야]
   ##[조금 작은 중간 제목이야]
   ```[코드]```
   
   ---
  - 마크업 문법
   줄바꿈: 텍스트 간에 한줄 비우기
   문단 바꿈: 바를 세 개 이상 사용 ( --- )
   텍스트 기울이기: *[텍스트]*
   bold: **[텍스트]**
   link: [링크 이름](링크 주소)
   큰 제목: # [제목]
   중간 제목: ## [중간 제목]
   코드블록: backquote사용  ```[코드]```
   ---
   
   */
  
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
                        NavigationLink(destination: SearchView()) {
                            Text("SearchableView")
                        }
                        NavigationLink(destination: MVVMMV()) {
                            Text("MVVM + Combine + TextField")
                        }
                        NavigationLink(destination: OContentView()) {
                            Text("Observable 사용해보기.")
                        }
                        NavigationLink(destination: SRandomNumberView()) {
                            Text("StateObject 실험.")
                        }
                        NavigationLink(destination: LocalNotifications()) {
                            Text("LocalNotifications")
                        }
                    }
                })
                
                Section {
                    Group {
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
                        NavigationLink(destination: QRReaderView()) {
                            Text("QR리더기")
                        }
                        NavigationLink(destination: VisionKitView()) {
                            Text("VisionKit")
                        }
                    }
                    
                    Group {
                        NavigationLink(destination: BetterRest()) {
                            Text("수면시간계산기(use CoreML)")
                        }
                      NavigationLink(destination: FileManagerView()) {
                          Text("TextField로 파일 저장해보기")
                      }
                    }
                    //Link("단순히 링크로 듸우기", destination: URL(string: "https://www.naver.com")!)
                }
                
                //이렇게 섹션아래에 헤더로 해줘도 된다.
                header : {
                    Text("Basic App") //자동으로 대문자전환.
                }
                
                Section(header: Text("정대리 따라하기") ){
                    NavigationLink(destination: JContentView()) {
                        Text("Chapter1")
                    }
                    NavigationLink(destination: JWebContentView()) {
                        Text("Chapter2")
                    }
                    NavigationLink(destination: JGeometryReader()) {
                        Text("Chapter3")
                    }
                    NavigationLink(destination: JTapView()) {
                        Text("Chapter4")
                    }
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
