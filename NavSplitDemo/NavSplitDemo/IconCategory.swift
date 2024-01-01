//
//  IconCategory.swift
//  NavSplitDemo
//
//  Created by 김종웅 on 12/3/23.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}
