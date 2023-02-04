//
//  ProductModel.swift
//  TestTask
//
//  Created by Артем Манасян on 14.01.2023.
//

import Foundation

struct ProductDetailsModel: Codable {
    let cpu: String
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
    var id: String
    let images: [String]
    let camera: String
    let capacity: [String]
    let color: [String]
    
    enum CodingKeys: String, CodingKey {
        case isFavorites,price,rating,sd,ssd,title,id,capacity,camera,color,images
        case cpu = "CPU"
    }
}

