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
    
    @IBAction func CatalogButton(_ sender: Any) {
        guard let vc = R.Storyboard.Catalog.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func changeUserPersonalDataButton(_ sender: Any) {
        guard let vc = R.Storyboard.ChangeUserPersonalData.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func backToAuthButton(_ sender: Any) {
        guard let vc = R.Storyboard.Auth.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)    }
}
