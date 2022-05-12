//
//  ChangeUserPersonalDataViewController.swift
//  GBShop
//
//  Created by LACKY on 16.04.2022.
//

import UIKit
import FirebaseCrashlytics

class ChangeUserPersonalDataViewController: UIViewController {
    
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
    
    @IBAction func changeButton(_ sender: Any) {
        guard isFormFilled() else { return self.showFillError() }
        
        let factory = requestFactory.makeChangeUserDataRequestFactory()
        let user = User(id: 123,
                        login: loginTextField.text,
                        password: passwordTextField.text,
                        email: emailTextField.text,
                        gender: genderTextField.text,
                        bio: bioTextField.text,
                        name: nameTextField.text,
                        lastname: lastNameTextField.text)
        factory.changeUserPersonalData(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let success): success.result == 1 ? self.moveToMainMenu() : self.showError(success.errorMessage ?? "Ошибка!")
                case .failure(let error): self.showError(error.localizedDescription)
                }
            }
        }

    }
    
    @IBAction func backToMainMenu(_ sender: Any) {
        guard let vc = R.Storyboard.MainMenu.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private func moveToMainMenu() {
        guard let vc = R.Storyboard.MainMenu.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private func showError(_ errorMessage: String) {
        AnalyticsLogger.logEvent(name: "Data change", key: "change_data", value: "Failture. Server error")
        let alert = UIAlertController(title: "Ошибка сервера", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFillError() {
        AnalyticsLogger.logEvent(name: "Data change", key: "change_data", value: "fillment error")
        let alert = UIAlertController(title: "Вы не заполнили поля", message: "Нужно заполнить все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isFormFilled() -> Bool {
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
