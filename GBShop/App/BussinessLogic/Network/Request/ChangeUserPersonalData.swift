//
//  ChangeUserPersonalData.swift
//  GBShop
//
//  Created by LACKY on 28.03.2022.
//

import Foundation
import Alamofire

class ChangePersonalData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangePersonalData: ChangeUserPersonalDataRequestFactory {
    func changeUserPersonalData(user: User, completionHandler: @escaping (AFDataResponse<ChangeUserPersonalDataResult>) -> Void) {
        let requestModel = ChangePersonalData(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangePersonalData {
    struct ChangePersonalData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserPersonalData.json"
        let user: User
        var parameters: Parameters? {
            return [
                "id_user": user.id!,
                "username": user.login!,
                "password": user.password! ]
        }
    }
}
