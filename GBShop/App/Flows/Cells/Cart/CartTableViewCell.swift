//
//  CartTableViewCell.swift
//  GBShop
//
//  Created by LACKY on 05.05.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func configure(with item: CartContents) {
        self.productName.text = item.productName
        self.productPrice.text = String(item.productPrice ?? 0)
    }
}
