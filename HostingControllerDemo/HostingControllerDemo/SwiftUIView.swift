//
//  SwiftUIView.swift
//  HostingControllerDemo
//
//  Created by 김종웅 on 12/28/23.
//

import SwiftUI

struct SwiftUIView: View {
    
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Image(systemName: "smiley")
                Text("This is a SwiftUI View")
            }
        }
        .font(.largeTitle)
    }
}

struct SwiftUIView_previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(text: "Sample Text")
    }
}
