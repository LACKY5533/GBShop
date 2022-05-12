//
//  SignUpViewController.swift
//  GBShop
//
//  Created by LACKY on 16.04.2022.
//

import UIKit
import FirebaseCrashlytics

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
    private let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        guard formFilled() else { return self.showFillError() }
        
        let factory = requestFactory.makeSignupRequestFactory()
        let user = User(login: loginTextField.text,
                        password: passwordTextField.text,
                        email: emailTextField.text,
                        gender: genderTextField.text,
                        bio: bioTextField.text,
                        name: nameTextField.text,
                        lastname: lastNameTextField.text)
        factory.signUp(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let success): success.result == 1 ? self.moveToMainMenu() : self.showServerError("Ошибка")
                case .failure(let error): self.showServerError(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func backToAuthButton(_ sender: Any) {
        guard let vc = R.Storyboard.Auth.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private func moveToMainMenu() {
        let vc = R.Storyboard.MainMenu.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
    
    private func showServerError(_ errorMessage: String) {
        AnalyticsLogger.logEvent(name: "SignUp", key: "signup", value: "Failture. Server error")
        let alert = UIAlertController(title: "Ошибка сервера", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFillError() {
        AnalyticsLogger.logEvent(name: "SignUp", key: "change_data", value: "fillment error")
        let alert = UIAlertController(title: "Вы не заполнили поля", message: "Нужно заполнить все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func formFilled() -> Bool {
        guard nameTextField.text != "",
              lastNameTextField.text != "",
              emailTextField.text != "",
              loginTextField.text != "",
              passwordTextField.text != "" else {
                  return false
              }
        return true
    }

}
