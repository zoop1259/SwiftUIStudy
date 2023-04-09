//
//  JFilteredList.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/09.
//

import SwiftUI

//필터 상위부분을 위한 enum , CaseIterable을 사용하면 랜덤적인 부분을 사용 할 수 있게 된다. 생성자 메소드 부분에서 for문을 확인해보자.
enum School : String, CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

//목록을 위한 구조체
struct MyFriend : Identifiable, Hashable {
    var id = UUID()
    var name: String
    var school : School
}

//func사용하여 리스트 생성, 이 함수를 부르면 newList반환
func createList() -> [MyFriend] {
    var newList = [MyFriend]()
    
    for i in 0...20 {
        //여기서 randomElement를 사용할 수 있다.
        let newFriend = MyFriend(name: "내 친구 \(i)", school: School.allCases.randomElement()!)
        newList.append(newFriend)
    }
    
    return newList
}

struct JFilteredList: View {
    @State private var filteredValue = School.elementary //초기값 정하기.
    //State는 바로 적용이 안되기 때문에 값을 넣어주고 Foreach를 통해 사용하는데 그럴러면 아래에 생성자메서드를 사용해야함.
    @State private var myFriendsList = [MyFriend]()
    
    //생성자 메소드
    init() {
        //아래처럼 _ (언더바)를 사용하면 State를 가리키게 된다.
        //함수를 불러와서 return값을 사용한다.
        _myFriendsList = State(initialValue: createList())
    }
    
    
    var body: some View {
        VStack {
            Text("선택한 필터 : \(filteredValue.rawValue)")
            
            Picker("", selection: $filteredValue) {
                Text("초등학교").tag(School.elementary)
                Text("중학교").tag(School.middle)
                Text("고등학교").tag(School.high)
            }.pickerStyle(.segmented)
            
            List {
                //id가 아닌 filter를 사용하면 seg의 rawValue를 사용한 필터링이 가능.
                ForEach(myFriendsList.filter({ filtered in
                    filtered.school == filteredValue
                })) { list in
                    GeometryReader { geo in
                        HStack {
                            Text("name : \(list.name)")
                                .frame(width: geo.size.width / 2)
                            Divider()
                            Text("\(list.school.rawValue)")
                                .frame(width: geo.size.width / 3)
                        }
                    }
                }
            }
            
            /*
            List {
                //MyFriend에 Hashable을 상속시켜주지 않으면 에러는 발생하지 않으나 값이 나오지 않음.
//                ForEach(myFriendsList) { list in
//                    Text("name : \(list.name)")
//                }
    
                //물론 Hashable을 사용한 후에는 id를 넣어줘야함.
                ForEach(myFriendsList, id : \.self) { list in
                    GeometryReader { geo in
                        HStack {
                            Text("name : \(list.name)")
                                .frame(width: geo.size.width / 2.5)
                            Divider()
                            Text("name : \(list.school.rawValue)")
                                .frame(width: geo.size.width / 1.5)
                        }
                    }
                }
            }
             */
        }
    }
}

struct JFilteredList_Previews: PreviewProvider {
    static var previews: some View {
        JFilteredList()
    }
}
