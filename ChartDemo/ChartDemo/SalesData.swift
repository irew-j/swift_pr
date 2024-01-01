//
//  SalesData.swift
//  ChartDemo
//
//  Created by 김종웅 on 12/14/23.
//

import Foundation

struct SalesInfo: Identifiable {
    var id = UUID()
    var month: String
    var total: Int
    var year: String
}

var retailSales: [SalesInfo] = [
    .init(month: "Jan", total: 5, year: "2022"),
    .init(month: "Fed", total: 7, year: "2022"),
    .init(month: "March", total: 6, year: "2022"),
    .init(month: "April", total: 5, year: "2022"),
    .init(month: "May", total: 6, year: "2023"),
    .init(month: "June", total: 3, year: "2023"),
    .init(month: "July", total: 6, year: "2023")
]

var onlineSales: [SalesInfo] = [
    .init(month: "Jan", total: 2, year: "2022"),
    .init(month: "Fed", total: 4, year: "2022"),
    .init(month: "March", total: 5, year: "2022"),
    .init(month: "April", total: 2, year: "2022"),
    .init(month: "May", total: 4, year: "2023"),
    .init(month: "June", total: 1, year: "2023"),
    .init(month: "July", total: 4, year: "2023")
]
