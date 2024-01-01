//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by 김종웅 on 11/21/23.
//

import SwiftUI

struct FirstTabView: View {
    
    @State var title = "View one"
    
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappear triggered")
            })
            .task(priority: .background) {
                title = await changeTitle()
            }
    }
    
    func changeTitle() async -> String {
        sleep(5)
        return "Async task complete"
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}

#Preview {
    FirstTabView()
}
