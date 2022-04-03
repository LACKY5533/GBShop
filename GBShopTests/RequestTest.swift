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
    let expectation = XCTestExpectation(description: "Perform request.")
    var requestFactory: RequestFactory!
    var user: User!
    
    

    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        user = User(id: 123, login: "pinkiepie", name: "mypassword", lastname: "Zaycev", password: "Slava")
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        user = nil
    }
    
    func testShouldPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFatory()
        factory.login(userName: user.login, password: user.password) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformSignupRequest() {
        let factory = requestFactory.makeSignUpRequestFactory()
        
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
        let factory = requestFactory.makeChangePersonalDataRequestFactory()
        
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
    
//    func testShouldPerformGetCatalogRequest() {
//        let factory = requestFactory.makeGetCatalogRequestFactory()
//
//        factory.getCatalog(pageNumber: 1, categoryId: 1) { response in
//            switch response.result {
//            case .success: break
//            case .failure: XCTFail()
//            }
//            self.expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: timeoutValue)
//    }
//
//    func testShouldPerformGetProductRequest() {
//        let factory = requestFactory.makeGetProductRequestFactory()
//
//        factory.getProduct(productId: 123) { response in
//            switch response.result {
//            case .success(let result): XCTAssertEqual(result.result, 1)
//            case .failure: XCTFail()
//            }
//            self.expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: timeoutValue)
//    }
}
