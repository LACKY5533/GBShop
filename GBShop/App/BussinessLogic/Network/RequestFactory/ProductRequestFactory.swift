//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 02.04.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func product(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void)
}
