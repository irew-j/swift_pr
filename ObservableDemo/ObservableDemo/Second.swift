//
//  Second.swift
//  ObservableDemo
//
//  Created by 김종웅 on 11/25/23.
//

import SwiftUI

struct Second: View {
    
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack{
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        } .padding()
    }
}

#Preview {
    Second().environmentObject(TimerData())
}
