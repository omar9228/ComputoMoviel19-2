//
//  ProductDescriptionViewController.swift
//  Queen
//
//  Created by  on 5/19/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit


protocol AmountDelegate {
    func passAmount(amount: Int)
}

struct Product: Codable {
    let product: String
    let imagenNombre: String
    let precio: String
}

class ProductDescriptionViewController: UIViewController {
    
    var selectionDelegate: AmountDelegate!
    
    var quantity: Int = 1
    var imageName: String?
    var precio: String?
    var descriptionProduct: String?
    var product: String?
    var intPrecio: Int = 0
    var priceTotal: Int = 0
    
    var productCar: [Product] = []
    var productTotalCar: [Product] = []
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var textViewProductDescription: UITextView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = product
        lblQuantity.text = "1"
        quantity = Int(lblQuantity.text!)!

        imageViewProduct.image = UIImage(named: imageName ?? "")
        
        precio?.removeFirst()
        lblPrice.text = "Costo Total: $ \(precio ?? "")"
        intPrecio = Int(precio!)!
        priceTotal = intPrecio
        
        
        textViewProductDescription.text = descriptionProduct! + " Costo: $ \(precio ?? "") C/U "
        textViewProductDescription.isEditable = false
        
        if let data = UserDefaults.standard.data(forKey: "productCar"), let productsArray = try? JSONDecoder().decode([Product].self, from: data){
            print("ArrayProducts: ", productsArray)
            productTotalCar = productsArray
        }
        
        productCar.append(Product.init(product: product!, imagenNombre: imageName!, precio: String(intPrecio)))
       
    }
    
    
    @IBAction func btnMinus(_ sender: Any) {
        if quantity == 1 {
            quantity = 1
            lblQuantity.text = "\(quantity)"
            
        }else {
            quantity = quantity - 1
            lblQuantity.text = "\(quantity)"
            let precio = quantity * intPrecio
            lblPrice.text = "Costo Total: $ \(precio)"
            priceTotal = precio
            productCar.removeLast()
        }
        
        
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        
        quantity = quantity + 1
        lblQuantity.text = "\(quantity)"
        let precio = quantity * intPrecio
        
        
        lblPrice.text = "Costo Total: $ \(precio)"
        priceTotal = precio
        
        productCar.append(Product.init(product: product!, imagenNombre: imageName!, precio: String(intPrecio)))

        
    }
    
    @IBAction func btnActionAddProduct(_ sender: Any) {
        
//        if quantity == 1 {
//                    productCar.append(Product.init(product: product!, imagenNombre: imageName!, precio: String(intPrecio)))
//        }
        
        
        productTotalCar.append(contentsOf: productCar)
        print(productTotalCar)
        
        if let encoded = try? JSONEncoder().encode(productTotalCar){
            UserDefaults.standard.set(encoded, forKey: "productCar")
        }
        
        selectionDelegate.passAmount(amount: priceTotal)
        self.dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func btnActionCancel(_ sender: Any) {
    
    self.dismiss(animated: true, completion: nil)
        
    }
    

}
