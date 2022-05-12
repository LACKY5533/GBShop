//
//  UserSinglton.swift
//  GBShop
//
//  Created by LACKY on 12.05.2022.
//

import Foundation

final class UserSinglton {
    static let shared = UserSinglton()
    public var userLogin: User?
    private init(){}
}
