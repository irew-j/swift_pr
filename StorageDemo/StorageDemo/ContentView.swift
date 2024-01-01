//
//  ContentView.swift
//  StorageDemo
//
//  Created by Neil Smyth on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
        
            AppStorageView()
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("AppStorage")
                    }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
