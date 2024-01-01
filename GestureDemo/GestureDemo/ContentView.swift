//
//  ContentView.swift
//  GestureDemo
//
//  Created by 김종웅 on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    // 크기 조절 (확대/축소 제스처)
    @State private var magnification: CGFloat = 1.0
    
    // 리셋
    @GestureState private var offset: CGSize = .zero
    // 동시 제스처
    @GestureState private var longPress: Bool = false
    
    @State private var dragEnable: Bool = false
    
    var body: some View {
        /*
        제스처 인식기를 변수에 할당 수정자에서는 변수를 참조.
        let tap = TapGesture()
        // 더블 탭만 인식함
        let tap = TapGesture(count: 2)
            .onEnded { _ in
                    print("tapped")
            }
        
        return Image(systemName: "hand.point.right.fill")
            .gesture(tap) */
        
        /*
         롱 프레스 (최소시간 값, 최대거리 지정 가능)
        let longPress = LongPressGesture(minimumDuration: 2, maximumDistance: 5)
            .onEnded {_ in
                    print("Long Press")
            }
        
        return Image(systemName: "hand.point.right.fill")
            .gesture(longPress)
            nil값을 전달하면 제스처 인식기를 뷰에서 제거할 수 있음
            .gesture(nil) */
        
        /*
         onChanged 액션 콜백 (제스처가 처음 인식 되었을 때 호출됨, 제스처가 끝날 때까지 제스처 값이 변할 때마다 호출) 두손가락으로 확대/축소
        let magnificationGesture = MagnifyGesture(minimumScaleDelta: 0)
            .onChanged({ value in
                magnification = value.magnification
            })
        
            .onEnded { _ in
                    print("Gesture Ended")
            }
        
        return Image(systemName: "hand.point.right.fill")
            .resizable()
            .font(.largeTitle)
            .scaleEffect(magnification)
            .gesture(magnificationGesture)
            .frame(width: 100, height: 90) */
        
        /* 드레그 제스처
         updating 콜백 액션 @GestureState(제스처와 함께 사용해야함.) 프로퍼티를 사용, 제스처가 끝나면 자동으로 리셋 됨(제스처를 하는동안 필요한 임시 상태)
         offset: 리셋 시킴, translation: 현재 위치
         
        let drag = DragGesture()
            .updating($offset) { dragValue, state, Transaction in
                state = dragValue.translation
            }
        
        return Image(systemName: "hand.point.right.fill")
            .font(.largeTitle)
            .offset(offset)
            .gesture(drag) */
        
        /* 제스처 구성하기 하나의 뷰에 여러게의 제스처를 구현, 동시에 감지하거나 순차적으로 검지할 수 있음. 롱 프레스, 드래그 제스처를 동시적으로 구성
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) {value, state, transaction in
                state = value
            }
        
            .simultaneously(with: DragGesture())
            .updating($offset) { value, state, transaction in
                state = value.second?.translation ?? .zero
            }
        
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(longPress ? Color.red : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressAndDrag) */
        
        let longPressBeforeDrag = LongPressGesture(minimumDuration: .zero)
            .onEnded({ _ in
                self.dragEnable = true
            })
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                
                switch value {
                    
                    case .first(true):
                        print("Long press in progress")
                    
                    case .second(true, let drag):
                    state = drag?.translation ?? .zero
                    
                default: break
                }
            }
            .onEnded { value in
                self.dragEnable = false
            }
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnable ? Color.green : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture((longPressBeforeDrag))
        
    }
}

#Preview {
    ContentView()
}
