//
//  SignUpRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 28.03.2022.
//

import Foundation
import Alamofire

protocol SignUpRequestFactory {
    func signUp(user: User, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void)
}
