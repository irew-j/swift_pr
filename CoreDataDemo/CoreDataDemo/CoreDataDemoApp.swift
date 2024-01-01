//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by 김종웅 on 12/20/23.
// 뷰 컨테이너 설정하기

import SwiftUI

@main
struct CoreDataDemoApp: App {
    // 관리 객체 콘텍스트 얻기
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
