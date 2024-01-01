//
//  ContentView.swift
//  GridRowDemo
//
//  Created by 김종웅 on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        Grid(horizontalSpacing: 30, verticalSpacing: 0) {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    // 짝수열에 빈셀 추가
                    if (index % 2 == 1) {
                        CellContent(index: index, color: .red)
                    } else {
                        //
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }
            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }
            GridRow {
                ForEach(11...12, id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }
            CellContent(index: 16, color: .blue)
            
            GridRow {
                // 17의 수평은 2 크기, 18의 수평은 3의 크기로 전체 5로 화면을 차지함
                CellContent(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }
        }
        .padding()
         */
        
        Grid(alignment: .top) {
            // 개별 행의 디폴트 세로 정렬을 재정의.
            GridRow(alignment: .bottom) {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                // 개별 열의 대한 수평정 콘텐트 정렬.
                    .gridColumnAlignment(.trailing)
                Image(systemName: "record.circle.fill")
                // 개별 셀의 콘텐트 정렬을 재정의.
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.top)
                CellContent(index: 0, color: .yellow)
            }
            .font(.largeTitle)
            
            GridRow {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent(index: 0, color: .yellow)
            }
            .font(.largeTitle)
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    CellContent(index: index, color: .red)
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
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
