//
//  ContentView.swift
//  GridDemo
//
//  Created by 김종웅 on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
    /*
     유연한 gridItem
    private var gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] 3 열
        4 열
    private var gridItems = [GridItem(), GridItem(), GridItem(), GridItem()]
     */
    
    /*
    // 적응형 gridItem 차지하는 공간에 맞출 수 있는 한 많은 행이나 열이 자동으로 표시되도록 그리드 뷰를 구성함.
    // 열의 너비가 50pt보다 작을 수 없다는 제한과 가능한 많은 열이 표시되도록 할 것이다. (세로로 했을 때 11 까지 표시됨.)
    private var gridItems = [GridItem(.adaptive(minimum: 50))]
     */
    
    /*
    // 고정형  gridItem 너비가 100인 단일 열을 가진 그리드가 표시됨.
    private var gridItems = [GridItem(.fixed(100))]
    */
    
    /*
    각각 75, 125, 175의 크기의 열이 있는 3열 그리드
    private var gridItems = [GridItem(.fixed(75)), GridItem(.fixed(125)), GridItem(.fixed(175))]
    */
    
    /*
     첫번째 열은 고정 너비로 표시. 두 번째와 세 번째 열의 크기는 나머지 공간을 차지하도록 동일하게 조정된다.
    private var gridItems = [GridItem(.fixed(85)), GridItem(), GridItem()]
    */
    
    /*
     첫 번째 열은 고정된 크기로 표시, 나머지 행은 최소 너비 제한에 따라 가능한 많은 열로 채워짐.
    private var gridItems = [GridItem(.fixed(100)), GridItem(.adaptive(minimum: 50))]
     */
    private var gridItems = [GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
        /*
         LazyVGrid 표현
        ScrollView{
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
            .padding(5)
         */
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
        }
    }
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .contrast(8)
            .font(.largeTitle)
    }
}

/*
 LazyVGrid 구조체
struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}
*/
#Preview {
    ContentView()
}
