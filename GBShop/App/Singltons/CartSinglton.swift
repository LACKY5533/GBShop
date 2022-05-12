//
//  CartSinglton.swift
//  GBShop
//
//  Created by LACKY on 12.05.2022.
//

import Foundation

final class CartSinglton {
    static let shared = CartSinglton()
    private init(){}
    public var cartItems: [CartContents] = []
}
