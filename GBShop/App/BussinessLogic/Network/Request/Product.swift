//
//  Product.swift
//  GBShop
//
//  Created by LACKY on 02.04.2022.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {
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

extension Product: ProductRequestFactory {
    func product(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Product {
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "product"
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}
