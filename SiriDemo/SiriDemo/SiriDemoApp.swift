//
//  SiriDemoApp.swift
//  SiriDemo
//
//  Created by 김종웅 on 12/22/23.
// 시리 승인 받기

import SwiftUI
import Intents

@main
struct SiriDemoApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {
            // 사용자에게 승인받고 앱이 시리 지원이 포함되어 있음을 알려서 처음 실행될 때 수행하는게 좋음
            INPreferences.requestSiriAuthorization({status in
                // 상태에 따라 처리
            })
        }
    }
}
