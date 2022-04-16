//
//  ViewController.swift
//  GBShop
//
//  Created by LACKY on 25.03.2022.
//

import UIKit

class AuthViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Ошибка авторизации", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок(", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func moveToMainMenu() {
        let vc = R.Storyboard.MainMenu.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: loginTextField.text, password: passwordTextField.text)
        factory.login(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                    case .success(let success): success.result == 1 ? self.moveToMainMenu() : self.showError(success.errorMessage ?? "Ошибка.")
                    case .failure(let error): self.showError(error.localizedDescription)
                }
            }
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc = R.Storyboard.SignUp.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
}