//
//  ContentView.swift
//  TabViewDemo
//
//  Created by 김종웅 on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    // 태그 범위 (1 ~ 3) 내의 다른 값으로 변경히먄 탭 뷰는 전환됨.(tag 값을 봄)
    @State private var selection = 1
    
    var body: some View {
        // 현재 선택 값과 selection 상태 프로퍼티를 바인딩함.
        TabView(selection: $selection) {
            Text("First")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }.tag(1)
            Text("Second")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }.tag(2)
            Text("Third")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }.tag(3)
        }
        .font(.largeTitle)
        /*
         왼쪽/ 오른쪽으로 스와이프 하면 뷰 간의 이동 확인 가능.
        .tabViewStyle(PageTabViewStyle())
         */
    }
}

#Preview {
    ContentView()
}
