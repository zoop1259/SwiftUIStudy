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

    var body: some View {
        VStack {
            HStack {
                TextField("Title", text: $newFileTitle)
                TextField("Content", text: $newFileContent)
            }
            .padding()

            Button(action: {
                self.saveFile()
            }) {
                Text("Save")
            }

            List {
                ForEach(fileList, id: \.self) { file in
                    Text(file.lastPathComponent)
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
        let fileURL = documentsDirectory.appendingPathComponent("\(newFileTitle).rtf")

        do {
            try newFileContent.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("Unable to save file: \(error)")
        }

        fileList.append(fileURL)
    }
}

struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}
