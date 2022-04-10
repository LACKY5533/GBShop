//
//  ChangeUserPersonalData.swift
//  GBShop
//
//  Created by LACKY on 28.03.2022.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://vapor-gbshop.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension ChangeUserData: ChangeUserPersonalDataRequestFactory {
    
    func changeUserPersonalData(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeuserdata"
        
        let user: User
        var parameters: Parameters? {
            return [
                "id": user.id ?? 0,
                "login": user.login ?? "",
                "password": user.password ?? "",
                "name": user.name ?? "John",
                "lastname": user.lastname ?? "Doe",
                "email": user.email ?? "",
                "gender": user.gender ?? "",
                "creditCard": user.creditCard ?? "",
                "bio": user.bio ?? ""
            ]
        }
    }
}
