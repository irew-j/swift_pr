//
//  ContentView.swift
//  AnimationDemo
//
//  Created by 김종웅 on 12/6/23.
//

// 암묵적 애니메이션 (애니메이션 수정자 이전에 있는 뷰의 모든 프로퍼티가 애니메이션되도록 구현한다.)


import SwiftUI

struct ContentView: View {
    
    // 회전
    @State private var rotation: Double = 0
    // 크기
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        // withAnimation 클로저 내에서 수행되록 (명시적 애니메이션)
        Button(action: { withAnimation(.linear (duration: 2)) {
            // 버튼을 터치할때 마다 60도 회전 360도를 완전히 회전하면 반시계 방향으로 회전
            self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
        }
            // 회전효과와 함께 크기도 조절함
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
        }) {
            Text("Click to animate")
                
                //  애니메이션 빈복하기
//                .animation(Animation.linear(duration: 1).repeatCount(10), value: 10)
                
                // 즉시 되돌아가기 autoreverses를 false 설정, repretForever() 수정자를 사용하면 무한반복
//                .animation(Animation.linear(duration: 1).repeatCount(10, autoreverses: false), value: rotation, repeatForever(autoreverses: true))
                
            
                // 크기
//                .scaleEffect(scale)

                .rotationEffect(.degrees(rotation))
            
                // 회전효과의 속도를 줄이고 부드럽게 회전하도록 제어. value 매게변수는 애니메이션을 제어하는 데 사용되는 값을 애니메이션 함수에 알려줌
//                .animation(.linear(duration: 1), value: rotation)
            
                // 스프링처럼 회전과 크기 조절 효과가 지정된 범위를 살짝 넘어깄다가 다시 돌아오는 효과가 나오면서 지정한 각도와 크기로 될 것이다.
//                .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0), value: rotation)
            
                // animation() 수정지를 사용할 경우 이전에 적용된 수정자들에게만 애니메이션이 암묵적으로 적용된다. 회전 효과에만 애니메이션된다.
                // 왜냐 크기 조절 효과는 애니메이션 수정자가 다음에 적용되었기 때문에
                .scaleEffect(scale)
        }
    }
}

#Preview {
    ContentView()
}
