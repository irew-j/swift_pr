//
//  ContentView.swift
//  ChartDemo
//
//  Created by 김종웅 on 12/14/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        let sales = [ (channel: "Retail", data: retailSales), (channel: "Onliel", data: onlineSales)]
     
        Chart {
            ForEach(sales, id: \.channel) {channels in
                ForEach(channels.data) {sales in
                    LineMark(x: .value("Month", sales.month), y: .value("Total", sales.total))
                        // 두개의 그래프로 나누고 판매 채널을 기반으로 데이터를 필터링하도록 구성해줌
                        .foregroundStyle(by: .value("Channel", channels.channel))
                        // 데이터 포인트를 연결하기 위해 선을 그리기
                        .interpolationMethod(.catmullRom)
                        // 다른 기호를 나타냄
                        .symbol(by: .value("Year", sales.year))
                }
            }
        }
        .frame(height: 250)
        .padding()
    }
}

#Preview {
    ContentView()
}
