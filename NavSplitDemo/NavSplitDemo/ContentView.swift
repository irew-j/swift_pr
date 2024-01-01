//
//  ContentView.swift
//  NavSplitDemo
//
//  Created by 김종웅 on 12/3/23.
//

// 3열 분활 네비게이션 앱을 만듬.
// 사이드바 열에는  선택된 카테고리에 속하는 아이콘이 나열되도록 콘텐트를 업데이트하는 카테고리가 나열된다.
// 디테일 열에는 콘텐트 목록에서 현재 선택한 아이콘이 표시된다.

import SwiftUI


struct ContentView: View {
    
    @State private var categories = [
        IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
                                                       "questionmark.folder",
                                                       "questionmark.folder.fill.ar",
                                                       "folder.fill.badge.gear",
                                                       "questionmark.folder.fill"]),
        IconCategory(categoryName: "Circles", images: ["book.circle",
                                                        "books.vertical.circle",
                                                        "books.vartical.circle.fill",
                                                        "book.circle.fill",
                                                        "book.closed.circle"]),
        IconCategory(categoryName: "Clouds", images: ["cloud.rain",
                                                      "cloud",
                                                      "cloud.drizzle.fill",
                                                      "cloud.fill",
                                                      "colud.drizzle"])
    ]
    
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    @State private var columnvisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnvisibility) {
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName).tag(category)
            }
        } content: {
            if let selectedCategory {
                List(selectedCategory.images, id: \.self, selection: $selectedImage) { image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }.tag(image)
                }
            } else {
                Text("Select a category")
            }
        } detail: {
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Select an image")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
