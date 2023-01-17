//
//  BasicAdaptableView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI

enum EnumChoiceList: String, CaseIterable, Identifiable { //대부분 enum을 사용해서 만든다.
    case enum옵션1, enum옵션2, enum옵션3
    var id: Self { self }
}

//뷰가 제공하는 기본적인것들의 모음
struct BasicAdaptableView: View {
    var choiceList = ["옵션1", "옵션2", "옵션3", "옵션4"] //이렇게 내부에서 사용가능하지만 Model로 따로 만드는게 좋다.
    @State private var choice = "선택해주세요." //흠.. 초기값이 의미가 없나..
    
    @State private var enumChoiceLists = EnumChoiceList.enum옵션1 //옵션1은 기본값
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hamlet")
                .font(.largeTitle)
            Text("by William Shakespeare")
                .font(.caption)
                .italic()
            
            HStack(spacing: 10) {
                Image(systemName: "folder.badge.plus")
                Image(systemName: "heart.circle.fill")
                Image(systemName: "alarm")
            }
            .symbolRenderingMode(.multicolor) //흑백에서 컬러로.
            .font(.largeTitle) //이미지 키우기.
            
            //Label과 Text는 큰 차이는 없다. 그러나 라벨은 Text만 사용하게되면 에러가 발생한다.
            //Cannot convert value of type 'String' to expected argument type 'LabelStyleConfiguration'
            Label("Books", systemImage: "books.vertical")
//                .labelStyle(.titleAndIcon) //굳이 필요없음
//                .labelStyle(.titleOnly) //텍스트만 사용. 이런걸 잘 쓸 수 있을지도...?
                .font(.largeTitle)
            
            
            HStack {
                Picker("Choice", selection: $choice) {
                    ForEach(choiceList, id: \.self) {
                        Text($0)
                    }
                    .pickerStyle(.inline)
                }
                .controlSize(.small)
            }
            
            HStack {
                Picker("EnumChoice", selection: $enumChoiceLists) {
                    ForEach(EnumChoiceList.allCases) { Text($0.rawValue.capitalized) }
                        .pickerStyle(.wheel)
                    //macOS에서는 라디오버튼 사용 가능.
//                        .pickerStyle(.radio)
                }
                Button("OK") {
                    print("선택됨")
                }
            }
            .controlSize(.large)
            
            //이렇게하면 그냥 밑에 네비게이션뷰가 깔리는구나.
            //var tips = [10,15,20,25,0]
//            NavigationView {
//                Form {
//                    Section {
//                        Picker("네비게이션 식", selection: $choice) {
//                            ForEach(0..<tips.count) {
//                                Text("\(tips[$0])")
//                            }
//                        }
//                    }
//                }
//                .navigationTitle("tips")
//            }
            
            //List는 아래를 쭉 장악하는듯.
//            HStack {
//                List {
//                    Picker("EnumChoice", selection: $enumChoiceLists) {
//                        ForEach(EnumChoiceList.allCases) { Text($0.rawValue.capitalized) }
//                    }
//                }
//            }
            
            VStack {
                MyControls(label: "Mini")
                    .controlSize(.mini)
                MyControls(label: "Small")
                    .controlSize(.small)
                MyControls(label: "Regular")
                    .controlSize(.regular)
            }
            .padding()
            .frame(width: 400)
            .border(Color.gray)
            
            
        }
        //이걸 사용하지않으면 navigation에 의해 view가 살짝 내려간다.
        .navigationTitle(Text("View가 제공하는 기본적인 기능?"))
        //.navigationBarTitle("")
        //.navigationBarHidden(true) //이방법으로하면 뒤로 돌아갈 방법이 귀찮아진다.
        .navigationBarTitleDisplayMode(.inline)
    }
}

//미리보기를 하면 리소스를 너무 잡아먹어 팬소리가 난다..
struct BasicAdaptableView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAdaptableView()
    }
}

struct MyControls: View {
    var label: String
    @State private var value = 3.0
    @State private var selected = 1
    var body: some View {
        HStack {
            Text(label + ":")
            Picker("Selection", selection: $selected) {
                Text("option 1").tag(1)
                Text("option 2").tag(2)
                Text("option 3").tag(3)
            }
            Slider(value: $value, in: 1...10)
            Button("OK") { }
        }
    }
}
