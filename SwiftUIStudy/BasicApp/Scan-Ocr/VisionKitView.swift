//
//  VisionKitView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/03.
//

import SwiftUI

struct VisionKitView: View {
    
    @State private var showScannerSheet = false
    @State private var texts: [ScanData] = []
    
    var body: some View {
        //NavigationView {
            VStack {
                if texts.count > 0 {
                    List {
                        ForEach(texts) { text in
                            NavigationLink(destination: ScrollView{Text(text.content)}) {
                                Text(text.content).lineLimit(1)
                            }
                        }
                    }
                } else {
                    Text("No scan")
                        .font(.title)
                }
            }.navigationBarTitle("Scan OCR")
                .navigationBarItems(trailing: Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.title)
                })
                .sheet(isPresented: $showScannerSheet, content: {
                    makeScannerView()
                })
                )
        //}
    }
    
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
    
}

struct VisionKitView_Previews: PreviewProvider {
    static var previews: some View {
        VisionKitView()
    }
}
