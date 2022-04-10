//
//  ReviewResult.swift
//  GBShop
//
//  Created by LACKY on 10.04.2022.
//

import Foundation

struct ReviewResult: Codable {
    let result: Int
    let reviews: [ReviewRequest]?
    let errorMessage: String?
}

struct ReviewRequest: Codable {
    let reviewText: String?
    let userId: Int?
    let productId: Int?
}
