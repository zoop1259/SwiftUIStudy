//
//  UIGram.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/02.
//

import SwiftUI

/*
 공식 문서에도 class가 아닌 struct로 사용하길 권유.
 struct를 사용하는 이유
 1. 성능
  - Struct는 Class보다 단순하고 빠른 특징이 존재
  - UIView같은 경우에는, constrant, layer 등 많은 property와 메서드를 가진 클래스에의 subclass인데, UIView의 서브클래스들은 모두 UIView의 속성을 그대로 가져가야만 하는 구조 (애플 문서만 봐도, UIView관려 속성이 200개 넘게 존재)
  - SwiftUI에서는 상속을 대신하여 ViewModifier 개념을 사용하여 컴포넌트화 할 수 있도록 제공
 
 2. 가변성을 최소화
  - class는 reference type이므로 어디에서도 값을 쉽게 바꿀 수 있지만,
    Struct는 value type이므로 앱의 전체 상태를 고려할 필요 없이 코드의 일부에 대해서 더 쉽게 추론할 수 있는 장점이 존재
  - 가변성을 최대한 멀리하는게 함수형 프로그래밍의 핵심인데 이때 class보다 Struct가 더 유리 (=프로그램 실행 중에 상태가 변화하는 것을 최소화하는게 좋은 코드)

 3. 메모리릭(누수) 관리
  - Reference type을 사용하다보면 retain cycle때문에 메모리에서 해제가 안되는(memory leak) 현상이 발생하는데, 이 때 계속해서 메모리를 차지하는게 늘어나면서 크래시가 나는 반면에, value type인 struct을 쓰면 Memory leak에 안전한 프로그래밍이 가능
 
 */

struct UIGram: View {
    
    //@State는 SwiftUI는 var만으로 값을 변경 할 수 없다. 앱 화면을 다시 그려주기 위해 사용.
    @State var name : String
    
    //some은 불투명한 타입(Opaque Types)에 해당한다. 
    var body: some View {
        
        
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


/*
 네비게이션 뷰와 탭 뷰를 함께 사용하는 형식은 2가지가 있다.
 1. 탭뷰 내부에 네비게이션 뷰 이용하기
 2. 네비게이션 뷰 내부에 탭뷰 이용하기

 1번 이슈와 솔루션
 1번의 문제점은 화면 전환 시 탭바가 사라지지 않는다는 것이다. 이걸 해결하기 위해 구글링해보면 2번처럼 이용하라는 답을 많이 얻게된다. 그래서 나도 2번처럼 이용했다.

 2번 이슈와 솔루션
 탭바가 사라지는건 정상적으로 되는데, Navigation Bar가 Hidden되지 않는 문제가 생긴다. 엄청 시간을 들여서 찾은 솔루션은, 각 Tab이 Appear될 때마다 navigation title을 변경해주는 것이다. 원인은 모르겠지만 이렇게 하면 정상적으로 Navigation bar가 사라진다.
 */
