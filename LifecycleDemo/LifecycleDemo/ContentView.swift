//
//  ContentView.swift
//  LifecycleDemo
//
//  Created by 김종웅 on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FirstTabView()
                .tabItem {
                    Image(systemName:"01.circle")
                    Text("First")
                }
            
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    ContentView()
}
