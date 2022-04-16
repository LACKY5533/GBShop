//
//  CartRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 10.04.2022.
//

import Foundation
import Alamofire

protocol CartRequestFactory {
    func getCart(user: User, completionHandler: @escaping (AFDataResponse<CartResponse>) -> Void)
    func payCart(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
    func addToCart(cart: CartRequest, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
    func deleteFromCart(cart: CartRequest, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
}
