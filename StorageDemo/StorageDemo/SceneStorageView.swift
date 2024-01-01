//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by Neil Smyth on 7/26/22.
//

import SwiftUI

struct SceneStorageView: View {
    
    @SceneStorage("mytext") private var editorText: String = ""

    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

struct SceneStorageView_Previews: PreviewProvider {
    static var previews: some View {
        SceneStorageView()
    }
}
