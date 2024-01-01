//
//  ContentView.swift
//  demoprojct
//
//  Created by 김종웅 on 11/15/23.
//

import SwiftUI

class SpeedSetting: ObservableObject{
    @Published var speed = 0.0
}

struct SpeedControlView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    var body: some View {
        Slider(value: $speedsetting.speed, in: 0...100)
    }
}

struct SpeedDisplayView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    var body: some View {
        Text("Speed = \(speedsetting.speed)")
    }
}

struct ContentView: View {
    let speedsetting = SpeedSetting()
    var body: some View {
        VStack {
            SpeedControlView()
            SpeedDisplayView()
        }
        .environmentObject(speedsetting)
    }
}
    
    
#Preview {
    ContentView()
}


/*.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)*/ //배터리 표시하는 곳 까지 화면을 사용하겠다
