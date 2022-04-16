//
//  CommonResult.swift
//  GBShop
//
//  Created by LACKY on 10.04.2022.
//

import Foundation

struct CommonResult: Codable {
    var result: Int
    var successMessage: String?
    var errorMessage: String?
}
