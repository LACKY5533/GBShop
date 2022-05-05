//
//  Auth.swift
//  GBShop
//
//  Created by LACKY on 27.03.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://vapor-gbshop.herokuapp.com/")!
    
    init( errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension Auth: AuthRequestFactory {
    func login(user: User, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: user.login ?? "", password: user.password ?? "")
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    
    struct Login: RequestRouter {
        
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [ "username": login,
                     "password": password ]
        }
    }
}
