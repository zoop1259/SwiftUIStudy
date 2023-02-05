//
//  PhotosUIView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/03.
//

import SwiftUI
import PhotosUI

struct PhotosUIView: View {
    
    //기본값은 nil
    @State private var selectedImage: [PhotosPickerItem] = []
    @State private var selectedImageData: [Data] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                
                //selectedImageData가 있고 그 데이터를 UIImage를 통해 이미지로 변경한 후에
                if selectedImageData.count > 0 {
                    //이미지를 보여주는 부분, 그리고 이미지크기를 조정.
                    ScrollView {
                        LazyVGrid(columns: [.init(.adaptive(minimum: 200)), .init(.adaptive(minimum: 200))]) {
                            ForEach(selectedImageData, id: \.self) { dataItem in
                                if let dataItem = dataItem, let uiImage = UIImage(data: dataItem) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(height: 150)
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }

                    
                } else {
                    Spacer()
                    Text("상단 툴바를 눌러 이미지를 선택해주세요.")
                        .foregroundColor(.gray)
                        .font(.system(.title, design: .rounded, weight: .bold))
                }
                Spacer()
                Text("\(selectedImageData.count)")
                
            }
            .navigationBarTitle("Select Photo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //바인딩으로 이미지를 선택하면 값이 변경될테니, 그리고 스크린샷 라이브 이미지 초상화 등만 표기하기 떄문에 매개변수에 추가.
                PhotosPicker(selection: $selectedImage,maxSelectionCount: 5 , matching: .images) {
                    Image(systemName: "photo.fill").font(.title2)
                    //가져오기 기능에 대해.. 변경 수정자 추가.
                        .onChange(of: selectedImage) { newItem in
                            Task {
                                selectedImage = []
                                for item in newItem {
                                    //여기서 앱 내에서 이미지를 로드하는데 사용되는 비동기 함수.
                                    if let data = try? await
                                        item.loadTransferable(type: Data.self) {
                                        selectedImageData.append(data)
                                    }
                                }
                            }
                        }
                }
            }
        }.padding()
        
    }
}

struct PhotosUIView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosUIView()
    }
}
