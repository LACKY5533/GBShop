//
//  Cart.swift
//  GBShop
//
//  Created by LACKY on 10.04.2022.
//

import Foundation

struct CartRequest: Codable {
    var productId: Int?
    var quantity: Int?
}

struct CartResponse: Codable {
    var amount: Int?
    var count: Int?
    var contents: [CartContents]
}

struct CartContents: Codable {
    var productId: Int?
    var productName: String?
    var productPrice: Int?
    var quantity: Int?
}
