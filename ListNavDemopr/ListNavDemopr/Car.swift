//
//  Car.swift
//  ListNavDemopr
//
//  Created by 김종웅 on 12/1/23.
//

import SwiftUI

struct Car : Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
