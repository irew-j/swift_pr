//
//  ImageDocDemoApp.swift
//  ImageDocDemo
//
//  Created by 김종웅 on 12/15/23.
//

import SwiftUI

@main
struct ImageDocDemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ImageDocDemoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
