//
//  ContentView.swift
//  zsper
//
//  Created by 김종웅 on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .myAlignment) {
            Rectangle()
                .foregroundColor(Color.green)
                .alignmentGuide(HorizontalAlignment.myAlignment){d in d[.leading]}
                .alignmentGuide(VerticalAlignment.myAlignment) {d in d[VerticalAlignment.bottom]}
                .frame(width: 100, height: 100)
            
            Rectangle()
                .foregroundColor(Color.red)
                .alignmentGuide(VerticalAlignment.myAlignment) {d in d[VerticalAlignment.center]}
                .alignmentGuide(HorizontalAlignment.myAlignment) {d in d[HorizontalAlignment.trailing]}
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            
            Circle()
                .foregroundColor(Color.orange)
                .alignmentGuide(HorizontalAlignment.myAlignment) {d in d[.leading]}
                .alignmentGuide(VerticalAlignment.myAlignment) {d in d[.top]}
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
                
                
        }
    }
}

extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}


#Preview {
    ContentView()
}
