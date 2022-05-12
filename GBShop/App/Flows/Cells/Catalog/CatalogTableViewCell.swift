//
//  CatalogTableViewCell.swift
//  GBShop
//
//  Created by LACKY on 24.04.2022.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfProductLabel: UILabel!
    
    func configure(with item: CatalogResponse) {
        self.nameOfProductLabel.text = item.productName
    }
    
}
