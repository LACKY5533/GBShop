//
//  ChangeUserPersonalDataRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 28.03.2022.
//

import Foundation
import Alamofire

protocol ChangeUserPersonalDataRequestFactory {
    func changeUserPersonalData(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
}
