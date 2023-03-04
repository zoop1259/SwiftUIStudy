//
//  FileManagerScreen.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/03.
//

import SwiftUI

struct FileManagerScreen: View {
    var fileURL: URL // 파일 URL

    var body: some View {
        if let fileExtension = fileURL.fileExtension {
            if fileExtension == "rtf" {
                Text(readFile(url: fileURL))
            } else if fileExtension == "png" || fileExtension == "jpg" {
                Image(uiImage: UIImage(contentsOfFile: fileURL.path) ?? UIImage(systemName: "xmark.circle")!)
            } else {
                Text("Unsupported file type")
            }
        }
    }
    
    // 파일 내용을 읽어오는 함수
    func readFile(url: URL) -> String {
        do {
            let attributedString = try NSAttributedString(url: url, options: [:], documentAttributes: nil)
            return attributedString.string
        } catch {
            print("Unable to read file: \(error)")
            return ""
        }
    }
}

//파일 확장자를 가져오는 메서드.
extension URL {
    var fileExtension: String? {
        return (self.absoluteString as NSString).pathExtension
    }
}
