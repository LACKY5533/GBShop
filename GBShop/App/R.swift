//
//  R.swift
//  GBShop
//
//  Created by LACKY on 16.04.2022.
//

import UIKit

enum R {
    
    enum Storyboard {
        static let MainMenu: UIStoryboard = .init(name: "MainMenu", bundle: nil)
        static let ChangeUserPersonalData: UIStoryboard = .init(name: "ChangeUserPersonalData", bundle: nil)
        static let SignUp: UIStoryboard = .init(name: "SignUp", bundle: nil)
        static let Auth: UIStoryboard = .init(name: "Main", bundle: nil)
        static let Catalog: UIStoryboard = .init(name: "Catalog", bundle: nil)
        static let Product: UIStoryboard = .init(name: "Product", bundle: nil)
        static let Cart: UIStoryboard = .init(name: "Cart", bundle: nil)
    }
    
    enum Nib {
        static let catalog:UINib = .init(nibName: "CatalogTableViewCell", bundle: nil)
        static let product:UINib = .init(nibName: "ProductTableViewCell", bundle: nil)
        static let cart:UINib = .init(nibName: "CartTableViewCell", bundle: nil)
    }
    
    enum Cell {
        static let catalog: String = "CatalogCell"
        static let product: String = "ProductCell"
        static let cart: String = "CartCell"
    }
}
