//
//  explicit_animation.swift
//  AnimationDemo
//
//  Created by 김종웅 on 12/10/23.
//

// 명시적 애니메이션 (withAnimation() 클로저 내에서 변경된 프로퍼티만 애니메이션 된다.)

import SwiftUI

struct explicit_animation: View {

    @State private var redCircle = false
    @State private var visibility = false
    
    @State private var rotation: Double = 0
    @State private var isSpinning: Bool = true
    
    @State private var isButtonVisible: Bool = true
    
    var body: some View {
    
        /*
        // 상태 변경애 따라 애니메이션 효과를 빠르게 추가할 수 있음. 원을 탭 할때 마다 색상을 바꿈
        Circle()
            .fill(redCircle ? .red : .blue)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                    redCircle.toggle()
                }
            }
         */
        
        /*
        // 애니메이션과 상태 바인딩 수정자를 상태 바인딩함, 토들을 온/오프로 바꾸면 text 뷰가 점점 사라지면서 다른 text 뷰는 점점 나타나게 될 것이다
        VStack {
            Toggle(isOn: $visibility.animation(.linear(duration: 2))) {
                Text("Toggle Text views")
            }
            .padding()
            
            if visibility {
                Text("Hello world")
                    .font(.largeTitle)
            }
            
            if !visibility {
                Text("Goodbye world")
                    .font(.largeTitle)
            }
        }
         */
        
        /*
         자동으로 애니메이션 시작하기 뷰를 초기화할 때 isSpinning 상태 프로퍼티는 true로 설정되고 삼항 연산자에 의해 회전 각도는 0ㅇ,로 설정됨. 하지만 뷰가 나타나면
         onAppear() 수정자가 isSpinning 상태 프로퍼티응 false로 전환하며 그 결과로 삼항 연산자에 회전 각도는 360도로 변경됨.
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.blue)
                .frame(width: 360, height: 360)
            
            Image(systemName: "forward.fill")
                .font(.largeTitle)
                .offset(y: -180)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear() {
            self.isSpinning.toggle()
            rotation = isSpinning ? 0 : 360
        }
         */
        
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 2))) {
                Text("Show/Hide Button")
            }
            .padding()
            
            if isButtonVisible {
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.largeTitle)
//                .transition(.move(edge: .top)) 조화롭지 않게 사라짐. (전환 결합을 사용해 해결)
//                .transition(.scale) 크기가 커지면서 나타나고 작아지면서 사라짐.
                
                // 전환 결합하기
//                .transition(AnyTransition.opacity.combined(with: .move(edge: .top)))
                // 클래스의 extension 으로 구현해 복잡함은 제거하면서 재사용성을 높임
//                .transition(.fadeAndMove)
                
                // 비대칭 전환 (추가될 때와 제거될 때 서로다른 전환을 지정함)
                .transition(.asymmetric(insertion: .scale, removal: .slide))
                
            }
        }
        
        
    }
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge: .top))
    }
}

#Preview {
    explicit_animation()
}
