//
//  MainMenuViewController.swift
//  GBShop
//
//  Created by LACKY on 16.04.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeUserPersonalDataButton(_ sender: Any) {
        let vc = R.Storyboard.ChangeUserPersonalDataButton.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
    
    @IBAction func backToAuthButton(_ sender: Any) {
        let vc = R.Storyboard.Auth.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
}
