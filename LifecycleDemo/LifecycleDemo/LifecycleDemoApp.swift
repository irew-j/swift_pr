//
//  LifecycleDemoApp.swift
//  LifecycleDemo
//
//  Created by 김종웅 on 11/21/23.
//

import SwiftUI

@main
struct LifecycleDemoApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, perform: { phase in
            switch phase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("background")
            default:
                print("Unknow scenephase")
            }
        })
    }
}
