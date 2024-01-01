//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 김종웅 on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                NavigationLink(destination: Second()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
        .environmentObject(timerData)
    }
    
    func resetCount() {
        timerData.reseCount()
    }
}

#Preview {
    ContentView()
}
