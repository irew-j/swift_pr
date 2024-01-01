//
//  Secound.swift
//  ObservableDemo
//
//  Created by 김종웅 on 11/25/23.
//

import SwiftUI

struct Secound: View {
    
    @StateObject var timerData: TimerData
    
    var body: some View {
        VStack{
            Text("Second View")
        }
    }
}

#Preview {
    Secound()
}
