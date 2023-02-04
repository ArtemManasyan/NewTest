//
//  CartModelParsing.swift
//  TestTask
//
//  Created by Артем Манасян on 29.01.2023.
//

import Foundation


struct CartModelParsing: Codable {
    
    let basket: [Basket]
    let delivery: String
    let id: String
    let total: Int
}

struct Basket: Codable {
    let id: Int
    let price: Int
    let title: String
    let images: String
}
