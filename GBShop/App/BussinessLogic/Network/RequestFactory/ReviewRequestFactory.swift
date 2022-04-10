//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by LACKY on 10.04.2022.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<[ReviewResult]>) -> Void)
    func addReview(review: ReviewRequest, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
    func removeReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void)
}
