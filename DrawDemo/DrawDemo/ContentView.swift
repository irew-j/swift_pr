//
//  ContentView.swift
//  DrawDemo
//
//  Created by 김종웅 on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    // 그레이언크 그리기 다섯가지 색상으로 구성된 그레이디언트를 생성하고 방사형 으로 채움
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.green, Color.blue, Color.purple])
    
    var body: some View {
        /*
         도형의 색상과 크기는 fill() 수정자와 frame() 수정자를 사용하여 조절함.
         Circle()
         .fill(.red)
         .frame(width: 200, height: 200)
         */
        
        /*
         도형의 색을 채우지 않고 테두리만 그리기 위해 선택사항인 선 두께 값을 인자로 받는 stroke() 수정자를 사용함. 외곽선은 foregroundColor() 수정자를 사용.
         Capsule() 도형의 프레임은 직사각형 형태로, 정사각형 프레임에 원을 양쪽 끝에 그린 모양
         Capsule()
         .stroke(lineWidth: 10)
         .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
         .frame(width: 200, height: 100)
         */
        
        /*
         stroke() 수정자는 StrokeStyle 인스턴스를 사용하여 다양한 스타일 지원. 대시라인을 사용해 모서리가 둥근 사각형을 그림.
         RoundedRectangle(cornerRadius: CGFloat(20))
         .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10)]))
         .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
         .frame(width: 200, height: 100)
         */
        
        /*
         StrokeStyle() 인스턴스에 추가적으로 dash 값을 주고 간격 값을 주면 ,
         Ellipse()
         .stroke(style: StrokeStyle(lineWidth: 20, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(150)))
         .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
         .frame(width: 250,  height: 150)
         */
        // # 오버레이 사용하기
        /*
         색을 채운 도형 위에 외곽선을 두는 법
         Ellipse()
         .fill(.red)
         .overlay(Ellipse()
         .stroke(.blue, lineWidth: 10))
         .frame(width: 250, height: 150)
         */
        
        /*
         커스텀 경로와 도형 그리기
         Shape 프로토콜을 따르기 위해 CGRect 형태의 사각형을 받아 그 사각형에 그려질 것을 정의하는 Path 객체를 반환하는 path() 함수를 구현해야함.
         Path 인스턴스는 포인트 간의 좌표를 지정, 그려질 선을 2차원 도형으로 제공.
         move() 메서드를 사용하여 시작점의 좌표로 경로가 시작됨
         직선을 추가하기 위해 addLine() 메서드를 사용
         Path() { path in
             path.move(to: CGPoint(x: 10, y: 0))
             path.addLine(to: CGPoint(x: 10, y: 350))
             path.addLine(to: CGPoint(x: 300, y: 300))
             path.closeSubpath()
         }
         .fill(.green)
         */
        
        /*
         커스텀 도형 받음
         MyShape()
             .fill(.red)
             .frame(width: 360, height: 350)
         */
        /*
         색상 그레이디언트와 섀도
         색상 선언에 .gradient를 적용, Shadow(), drop(), inner() 렌더링에 섀도 효과를 적용
         Circle()
             .fill(.blue.gradient)
             .frame(width: 200, height: 200)
         
         Circle()
             .fill(.blue.shadow(.drop(color: .black, radius: 10)))
             .frame(width: 200, height: 200)
         
         Circle()
             .fill(.blue.shadow(.inner(color: .white, radius: 15)))
             .frame(width: 200, height: 200)
         */
        
        
        // 그레이디언트 구현 방사형
        Circle()
            .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(300)))
        
        // 그레이디언트 원뿔형
        Circle()
            .fill(AngularGradient(gradient: colors, center: .center))
        
        // 대각선 방향 그래이디언트
        Rectangle()
            .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 360, height: 350)
        
        // fill 수정자와 background 수정자에 그에이디언트를 적용함.
        MyShape()
            .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(300)))
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 360, height: 350)
        
    }
}

// Shape 프로토콜을 따르므로 필수로 구현해야 하는 path() 함수를 구현. 함수에 전달되는 CGRect값은 삼각형 모양을 그리는 경계를 정의하는데 사용
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}
