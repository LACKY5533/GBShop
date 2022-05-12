//
//  ProductResult.swift
//  GBShop
//
//  Created by LACKY on 02.04.2022.
//

import Foundation

struct ProductResult: Codable {
    let result: Int?
    let price: Int?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case price = "product_price"
        case description = "product_description"
        case result
    }
}

struct ProductResponse: Codable {
    let result: Int?
    let productId: Int?
    let productName: String?
    let price: Int?
    let description: String?
    let picUrl: String?
    let quantity: Int?
}
