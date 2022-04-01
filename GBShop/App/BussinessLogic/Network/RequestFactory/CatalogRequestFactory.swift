//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 02.04.2022.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func catalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[CatalogResult]>) -> Void)
}
