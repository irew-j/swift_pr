//
//  SecondTabView.swift
//  LifecycleDemo
//
//  Created by 김종웅 on 11/21/23.
//

import SwiftUI

struct SecondTabView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text, perform: { value in
                print("onChange triggered")
            })
    }
}

#Preview {
    SecondTabView()
}
