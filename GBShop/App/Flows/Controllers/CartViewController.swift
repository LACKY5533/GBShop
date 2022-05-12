//
//  CartViewController.swift
//  GBShop
//
//  Created by LACKY on 05.05.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var cartItem: [CartContents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableVIew.register(R.Nib.cart, forCellReuseIdentifier: R.Cell.cart)
    }
    
    @IBAction func backToMainMenuButton(_ sender: Any) {
        guard let vc = R.Storyboard.MainMenu.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func placeTheOrderButton(_ sender: Any) {
        
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.Cell.cart, for: indexPath)
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? CartTableViewCell)?.configure(with: self.cartItem[indexPath.row])
    }
}
