//
//  QRReaderView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI
import CodeScanner

struct QRReaderView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?

    var body: some View {
        VStack(spacing: 10) {
            if scannedCode != nil {
                NavigationLink("Next page", destination: Todos(), isActive: .constant(true)).hidden()
            }

            Button("Scan Code") {
                isPresentingScanner = true
            }

            Text("Scan a QR code to begin")
        }
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isPresentingScanner = false
                }
            }
        }
    }
    
    var scannerSheet: some View {
        ZStack {
            CodeScannerView(codeTypes: [.qr], showViewfinder: false) { response in
                switch response {
                case .success(let result):
                    print("Found code: \(result.string)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

struct QRReaderView_Previews: PreviewProvider {
    static var previews: some View {
        QRReaderView()
    }
}
