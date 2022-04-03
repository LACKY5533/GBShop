//
//  ViewController.swift
//  GBShop
//
//  Created by LACKY on 25.03.2022.
//

import UIKit

class TashaDesertsShopViewController: UIViewController {
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAuthRequest()
    }
    
    // MARK: Request methods
    
    func makeAuthRequest() {
        let factory = requestFactory.makeAuthRequestFatory()
        let user = User(id: 1111, login: "Admin", name: "One", lastname: "One1", password: "Admin")
        factory.login(userName: user.login ?? "", password: user.password ?? "") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
