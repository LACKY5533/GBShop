//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 28.03.2022.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(user: User, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
