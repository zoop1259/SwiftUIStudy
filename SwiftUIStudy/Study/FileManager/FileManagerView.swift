//
//  FileManagerView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/10.
//
import SwiftUI

struct FileManagerView: View {
    @State private var fileManager = FileManager.default
    @State private var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    @State private var fileList = [URL]()
    @State private var newFileTitle = ""
    @State private var newFileContent = ""

    let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? nil
    
    var body: some View {
        let _ = print("Documents directory: \(documentsDirectoryURL)")
        VStack {
            VStack {
                TextField("Title", text: $newFileTitle)
                .padding(20)
                .font(.title2)
              TextField("Content", text: $newFileContent, axis: .horizontal)
                .font(.title3)
            }
            .padding()

            HStack {
                Button(action: {
                    self.saveFile()
                }) {
                    Text("문서 저장해보기")
                }
                
                Button(action: {
                    self.saveImage()
                }) {
                    Text("이미지 저장해보기")
                }
            }
            
            
            List {
                ForEach(fileList, id: \.self) { file in
//                    Text(file.lastPathComponent)
                    NavigationLink(destination: FileManagerScreen(fileURL: file)) {
                        Text(file.lastPathComponent)
                    }
                }
            }
            .onAppear(perform: fetchFiles)
        }
    }

    func fetchFiles() {
        do {
            fileList = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
        } catch {
            print("Unable to fetch files: \(error)")
        }
    }

    func saveFile() {
        guard !newFileTitle.isEmpty else { return }
        let fileURL = documentsDirectory.appendingPathComponent("\(newFileTitle).rtf")
        do {
            let attributedString = NSAttributedString(string: newFileContent)
            let fileData = try attributedString.data(from: NSRange(location: 0, length: attributedString.length), documentAttributes: [.documentType: NSAttributedString.DocumentType.rtf])
            try fileData.write(to: fileURL)
            fileList.append(fileURL)
            newFileTitle = ""
            newFileContent = ""
        } catch {
            print("Unable to save file: \(error)")
        }
    }
    
    //이미지를 저장하기 위해선 Info.plist에 Privacy - Documents Folder Usage Description 를 추가해줘야한다.
    func saveImage() {
        let randomInt = Int.random(in: 100000000..<9999999999)
        let imageName = "image\(randomInt)"
        let image = UIImage(systemName: "gear")
        //파일명을 생성할 때 appendingPathExtension 대신 appendingPathComponent를 사용하여 파일 경로를 사용했는데 appendingPathExtension은 파일 경로에 확장자만 추가해주는 메소드이기 때문에 이미지를 저장할 때는 appendingPathComponent를 사용해야한다.
        //let fileURL = documentsDirectory.appendingPathExtension(imageName)
//        let fileURL = documentsDirectory.appendingPathExtension(imageName).appendingPathExtension("png")
        let fileURL = documentsDirectory.appendingPathComponent(imageName).appendingPathExtension("png")
        if let imageData = image?.pngData() {
            do {
                let permissions = [FileAttributeKey : Any]()
                try FileManager.default.createDirectory(at: documentsDirectory, withIntermediateDirectories: true, attributes: permissions)
                try imageData.write(to: fileURL)

            } catch {
                print("이미지 저장 중 에러 발생: \(error)")
            }
        }
    }
    
    
}

struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}
