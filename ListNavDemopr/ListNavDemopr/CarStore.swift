//
//  CarStore.swift
//  ListNavDemopr
//
//  Created by 김종웅 on 12/1/23.
//

import SwiftUI
import Combine

class CarStore : ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
