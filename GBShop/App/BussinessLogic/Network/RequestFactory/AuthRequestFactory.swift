//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 27.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
