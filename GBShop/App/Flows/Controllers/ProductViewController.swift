//
//  ProductViewController.swift
//  GBShop
//
//  Created by LACKY on 27.04.2022.
//

import UIKit
import FirebaseCrashlytics

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    let requestFactory = RequestFactory()
    var reviewItem: [ReviewResult] = []
    var product: ProductResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.Nib.product, forCellReuseIdentifier: R.Cell.product)
        AnalyticsLogger.logEvent(name: "catalogView", key: "result", value: "success")
    }
    
    @IBAction func backToCatalogButton(_ sender: Any) {
        guard let vc = R.Storyboard.Catalog.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @IBAction func CartButoon(_ sender: Any) {
        guard let vc = R.Storyboard.Cart.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func moveProductToCartButton(_ sender: Any) {
        guard let product = product else {
                   Crashlytics.crashlytics().log("Error. Product is nil!")
                   return
               }
               print("Added to cart \(ProductSinglton.productName ?? "Error")")
               let cartFactory = requestFactory.makeCartRequestFactory()
               let request = CartRequest(productId: product.productId, quantity: 1)
               cartFactory.addToCart(cart: request) { response in
                   switch response.result {
                   case .success:
                       DispatchQueue.main.async {
                           let item = CartContents(productId: product.productId, productName: product.productName, productPrice: product.price, quantity: product.quantity)
                           CartSinglton.shared.cartItems.append(item)
                       }
                   case .failure(let error): print(error.localizedDescription)
                   }
               }
    }
    
    @IBAction func writeReviewButton(_ sender: Any) {
        
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.Cell.product, for: indexPath)
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? ProductTableViewCell)?.configure(with: self.reviewItem[indexPath.row])
    }
}
