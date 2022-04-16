//
//  RequestTest.swift
//  GBShopTests
//
//  Created by LACKY on 01.04.2022.
//

import XCTest
@testable import GBShop

class  RequestsTests: XCTestCase {
    let timeoutValue = 10.0
    let expectation = XCTestExpectation(description: "нормальный реквест")
    var requestFactory: RequestFactory!
    var user: User!
    
    

    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        user = User(login: "1",
                    password: "1",
                    email: "1@gmail.com",
                    gender: "f",
                    creditCard: "1",
                    bio: "1",
                    name: "1",
                    lastname: "1")
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        user = nil
    }
    
    func testShouldPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        
        factory.login(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformSignupRequest() {
        let factory = requestFactory.makeSignupRequestFactory()
        
        factory.signUp(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformChangeUserDataRequest() {
        let factory = requestFactory.makeChangeUserDataRequestFactory()
        
        factory.changeUserPersonalData(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformLogoutRequest() {
        let factory = requestFactory.makeLogoutRequestFactory()
        
        factory.logout(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetCatalogRequest() {
        let factory = requestFactory.makeGetCatalogRequestFactory()
        
        factory.catalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success: break
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetProductRequest() {
        let factory = requestFactory.makeGetProductRequestFactory()
        
        factory.product(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.getReviews(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertGreaterThan(result.count, 0)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformAddReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.addReview(review: ReviewRequest(reviewText: "Плохой товар", userId: 123, productId: 666)) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformRemoveReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.removeReview(reviewId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.getCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result): XCTAssertNotNil(result.count)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformPayCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.payCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformAddToCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.addToCart(cart: CartRequest(productId: 666, quantity: 1)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformDeleteFromCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.deleteFromCart(cart: CartRequest(productId: 666)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
}
