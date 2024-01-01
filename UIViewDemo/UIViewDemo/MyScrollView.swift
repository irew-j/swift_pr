//
//  MyScrollView.swift
//  UIViewDemo
//
//  Created by 김종웅 on 12/27/23.
//

import SwiftUI

struct MyScrollView: UIViewRepresentable {
    var text: String
    
    
    func makeUIView(context: UIViewRepresentableContext<MyScrollView>) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefresh), for: .valueChanged)
        
        
        let myLable = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        myLable.text = text
        scrollView.addSubview(myLable)
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIScrollView, context: UIViewRepresentableContext<MyScrollView>) {
        <#code#>
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var control: MyScrollView
        
        init(_ control: MyScrollView) {
            self.control = control
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("View is Scrolling")
        }
        @objc func handleRefresh(sender: UIRefreshControl) {
            sender.endRefreshing()
        }
    }
}



struct MyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView(text: "Hellow world")
    }
}
