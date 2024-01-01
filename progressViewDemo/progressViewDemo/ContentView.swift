//
//  ContentView.swift
//  progressViewDemo
//
//  Created by 김종웅 on 12/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: Double = 0.1
    
    var body: some View {
        // 선형, 원형, 불확정, 사용자 정의
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
//                .progressViewStyle(LinearProgressViewStyle(tint: Color.red)) 선형
//                .progressViewStyle(CircularProgressViewStyle()) 원형
//                .progressViewStyle(MyCustomProgressViewStyle()) 사용자정의
//                .progressViewStyle(MycustomprogressViewStyle()) 사용자정의 진행률를 텍스트로 표시
                .progressViewStyle(MycustomprogressViewsyle())
            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
         
        
        // ProgressView("Working") 불확정적인 ProgressView 선언 (얼마큼 진행되었는지 퍼센트를 알수없음)
        
        
        /* progressViewStyle() 수정자가 ProgressView에 직접 적용될 수 있지만, VStack과 같은 컨테이너에 적용될 수 있다
        VStack {
            ProgressView("Task 1", value: progress, total: 100)
            ProgressView("Task 1", value: progress, total: 100)
            ProgressView("Task 1", value: progress, total: 100)
        }
        .progressViewStyle(CircularProgressViewStyle())
         */
    }
}

// 표시줄이 빨강색, 그림자는 초록색인 사용자 정의
struct MyCustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(.red)
            .shadow(color: Color(red: 0, green: 0.7, blue: 0), radius: 5.0, x: 2.0, y: 2.0)
            .progressViewStyle(LinearProgressViewStyle())
    }
}

// Text 뷰에 진행률을 표시함, 사용자 정의
struct MycustomprogressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let percent = Int(configuration.fractionCompleted! * 100)
        return Text("Task \(percent)% Complete")
    }
}

// fractionCompleted: 진행률.
// 진행률(fractionCompleted)을 바탕으로 점선으로 된 원형 경로를 그림
struct MycustomprogressViewsyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        let degrees = configuration.fractionCompleted! * 360
        let percent = Int(configuration.fractionCompleted! * 360)
        
        return VStack {
            MyCircle(startAngle: .degrees(1), endAngle: .degrees(degrees))
                .frame(width: 200, height: 200)
                .padding(50)
            Text("Task \(percent)% Complete")
        }
    }
}

struct MyCircle: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        return path.strokedPath(.init(lineWidth: 100, dash: [5, 3], dashPhase: 10))
    }
}

#Preview {
    ContentView()
}
