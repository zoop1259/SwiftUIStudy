import SwiftUI

struct AlertView: View {
    @State private var showingAlert = false
    @State private var newAlert = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showingAlert = true
            }) {
                Text("과거 코드로 Alert 띄우기")
            }
            .alert(isPresented: $showingAlert) { //deprecated된 방식이라 언제부터 사용불가능해질지 모르겠다.
                Alert(title: Text("Alert 타이틀"), message: Text("Alert 메세지"), dismissButton: .default(Text("Dismiss")))
            }.padding(10)
            
            Button("새로 변경된 코드로 Alert 띄우기") {
                newAlert = true
            }
            .alert("메세지", isPresented: $newAlert) {
                Button("Ok", role: .destructive) { //이렇게 타이틀 설정후 롤을 설정해줄 수 있다.
                    print("ok")
                }
                Button("Cancel", role: .cancel) {
                    print("cancel")
                }
                //버튼이 3개 이상인경우엔 세로로 배치된다.
            } message: {
                Text("이렇게 아래에 메세지를 적어줄 수 있다.")
            }
        }
        .navigationTitle(Text("Alert"))
        //.navigationBarTitle("")
        //.navigationBarHidden(true) //이방법으로하면 뒤로 돌아갈 방법이 귀찮아진다.
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
