//
//  HomeStoreModel.swift
//  TestTask
//
//  Created by Артем Манасян on 04.12.2022.
//

import Foundation

struct HomeStoreModel: Codable {
    var popularModels: [HotSalesProductModel]
    var bestSellerModels: [BestSellerProductModel]
    
    enum CodingKeys: String, CodingKey {
        case popularModels = "home_store"
        case bestSellerModels = "best_seller"
    }
}

struct HotSalesProductModel: Codable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle, picture
        case isNew = "is_new"
        case isBuy = "is_buy"
    }
}

struct BestSellerProductModel: Codable {
    let id: Int
    let isFavorites: Bool?
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case id,title,picture
        case isFavorites = "is_favorites"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
    }
}
