//
//  Todos.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/30.
//

import SwiftUI

struct Todos: View {
    @State private var newTodo = ""
    @State private var allTodos: [TodoItem] = []
    private let todosKey = "todosKey"
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add Todo...", text: $newTodo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    //비어있지 않을떄를 원한다.
                    guard !self.newTodo.isEmpty else { return }
                    //alltodos에 입력된 newtodo를 추가하고
                    self.allTodos.append(TodoItem(todo: self.newTodo))
                    //입력창을 다시 초기화하고
                    self.newTodo = ""
                    //유저디폴트에 값을 집어넣어준다.
                    self.saveTodos()
                }) {
                    Image(systemName: "plus")
                }
                .padding(.leading, 5) //여긴 컴포넌트간의 패딩
            }
            .padding(.horizontal, 20.0) //여긴 좀 더 상위인 뷰의 패딩
            
            List {
                ForEach(allTodos) { todoItem in
                    Text(todoItem.todo)
                }
                //삭제 명령어
                .onDelete(perform: deleteTodos)
            }
        }
        .navigationTitle("Todo")
        //앱이 열릴때마다.
        .onAppear(perform: loadTodos)
    }

    
    //userdefaults
    //SwiftUI에서의 함수는 최소한 View안에서 사용해야한다..
    //값을 저장할떈 encode
    private func saveTodos() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.allTodos), forKey: todosKey)
    }
    //값을 읽어오기.
    private func loadTodos() {
        if let todosData = UserDefaults.standard.value(forKey: todosKey) as? Data {
            //값이 있으면 decode한다.
            if let todoList = try? PropertyListDecoder().decode([TodoItem].self, from: todosData) {
                self.allTodos = todoList
            }
        }
    }
    //todo 삭제
    //IndexSet에 대해서 알아보자.
    private func deleteTodos(at offsets: IndexSet) {
        //List의 요소를 삭제하려면 atOffsets를 써줘야한다.
        self.allTodos.remove(atOffsets: offsets)
        //그리고 값을 저장해준다.
        saveTodos()
    }

    
}

/* 여기서 함수를 사용하게되면 찾지 못한다.
 private func saveTodos() {
     UserDefaults.standard.set(try? PropertyListEncoder().encode(self.allTodos), forKey: todosKey)
 }
 */

//단순한 모델
struct TodoItem: Codable, Identifiable {
    var id = UUID()
    let todo: String
}

struct Todos_Previews: PreviewProvider {
    static var previews: some View {
        Todos()
    }
}
