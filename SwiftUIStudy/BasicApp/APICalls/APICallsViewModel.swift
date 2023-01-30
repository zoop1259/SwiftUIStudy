//
//  APICallsViewModel.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/30.
//

import SwiftUI

class APICallsViewModel: ObservableObject {
    @Published var courses: [APICallsModel] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { //data가 있고 error가 없으면 넘어가라.
                return //여기에 에러핸들링을 해주면 된다.
            }
            
            //JSON변환
            do {
                let courses = try JSONDecoder().decode([APICallsModel].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            } catch {
                print(error.localizedDescription)
            }
        } //만약 여기서 task.resume()쓰려면 앞에 ;를 붙여줘야한다. -> ;task.resume()
        task.resume()
    }
}
