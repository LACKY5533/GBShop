//
//  ProductTableViewCell.swift
//  GBShop
//
//  Created by LACKY on 27.04.2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewLabel: UILabel!
    
    func configure(with item: ReviewResult) {
        self.reviewLabel.text = item.reviews?[0].reviewText
    }
    
}
