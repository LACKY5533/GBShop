//
//  CatalogResult.swift
//  GBShop
//
//  Created by LACKY on 02.04.2022.
//

import Foundation

struct CatalogResult: Codable {
    let id: Int
    let productName: String
    let price: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price
    }
}
