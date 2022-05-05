//
//  CatalogViewController.swift
//  GBShop
//
//  Created by LACKY on 24.04.2022.
//

import UIKit

class CatalogViewController: UITableViewController {
    
    @IBOutlet var tableVIew: UITableView!
    
    let requestFactory = RequestFactory()
    var CatalogItem: [CatalogResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.Nib.catalog, forCellReuseIdentifier: R.Cell.catalog)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.Cell.catalog, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? CatalogTableViewCell)?.configure(with: self.CatalogItem[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = R.Storyboard.Product.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func backToMainMenuButton(_ sender: Any) {
        guard let vc = R.Storyboard.MainMenu.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func CartButton(_ sender: Any) {
        guard let vc = R.Storyboard.Cart.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
