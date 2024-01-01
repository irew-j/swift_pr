//
//  ImageDocDemoDocument.swift
//  ImageDocDemo
//
//  Created by 김종웅 on 12/15/23.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleImage: UTType {
        UTType(importedAs: "com.ebookfrenzy.image")
    }
}

struct ImageDocDemoDocument: FileDocument {
//    문자열 데이터
//    var text: String
    var image: UIImage = UIImage()

    // 이미지로 작업하도록
    init() {
        if let image = UIImage(named: "cascadefalls") {
            self.image = image
        }
    }
    
    
    /*
     문자열 데이터
    init(text: String = "Hello, world!") {
        self.text = text
    }
     */
    

    static var readableContentTypes: [UTType] { [.exampleImage] }

    init(configuration: ReadConfiguration) throws {
//        문자열 데이터
//        guard let data = configuration.file.regularFileContents,
//              let string = String(data: data, encoding: .utf8)
        
        // 이미지를 디코딩
        guard let data = configuration.file.regularFileContents, let decodedImage: UIImage = UIImage(data: data)
        
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
//        text = string. 문자열 데이터
        image = decodedImage
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
//        문자열을 문서에 저장
//        let data = text.data(using: .utf8)!
//        return .init(regularFileWithContents: data)
        
        //이미지를 문서에 저장
        let data = image.pngData()!
        return .init(regularFileWithContents: data)
    }
}
