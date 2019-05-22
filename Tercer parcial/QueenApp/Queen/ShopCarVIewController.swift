//
//  ShopCarVIewController.swift
//  Queen
//
//  Created by Omar P. Rojas on 20/05/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import Foundation
import UIKit

protocol RemoveAmount {
    func removeAmount(amount: String)
}



class ShopCarViewController: UIViewController  {

    
    
    
    @IBOutlet weak var tableViewShopCar: UITableView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblDescuento: UILabel!
    
    var products: [Product] = []
    
    var delegate: RemoveAmount!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewShopCar.delegate = self
        tableViewShopCar.dataSource = self
        
        lblAmount.text = String( UserDefaults.standard.integer(forKey: "amountTotal") )
        lblDescuento.text = "N/A"
        
        if let data = UserDefaults.standard.data(forKey: "productCar"), let productsArray = try? JSONDecoder().decode([Product].self, from: data){
            print("Array: ", productsArray)
            products = productsArray
        }
    }
    
    @IBAction func btnActionPay(_ sender: Any) {
        
                let respuestaTrivia = UserDefaults.standard.bool(forKey: "flagDescuento")
        
                if respuestaTrivia == true {
        
                    Alerta(titulo: "🏆Felicidades🏆", mensaje: "Felicidades, obtuviste un 20% en tu compra por contestar bien la Trivia.")
                    
                    lblDescuento.text = "20 %"
                    
                    var amount = Double(lblAmount.text!)
                    let finalAmount = ((amount! * 0.20) - amount!) * -1
                    lblAmount.text = "\(finalAmount)"
                    
        
                }else{
                    AlertaCompraRealizada(titulo: "Compra Realizada", mensaje: "Su Compra fue realizada con éxito")
        }
        
    }
    
    @IBAction func btnActionContinueShop(_ sender: Any) {
        
       self.dismiss(animated: true, completion: nil)
        
    }
    
    func AlertaCompraRealizada (titulo: String, mensaje: String){
        
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            self.dismiss(animated: true, completion: nil)
            UserDefaults.standard.removeObject(forKey: "productCar")
            UserDefaults.standard.removeObject(forKey: "amountTotal")
            self.products = []
            self.tableViewShopCar.reloadData()
            self.delegate.removeAmount(amount: "0")
            self.lblAmount.text = "0"
            
        }
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
        
        UserDefaults.standard.removeObject(forKey: "flagDescuento")
        
    }
    
    
    func Alerta (titulo: String, mensaje: String){
        
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
        
        UserDefaults.standard.removeObject(forKey: "flagDescuento")
        
    }
    
}

extension ShopCarViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "productsCell") as! ShopCarTableViewCell
        
        cell.productImageView.image = UIImage(named: products[indexPath.row].imagenNombre)
        cell.lblPrice.text = "$ " + products[indexPath.row].precio
        cell.lblProduct.text =  products[indexPath.row].product
        
        return cell
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            
            var productDetails = products[indexPath.row]
            print("ProductRemovedPrice: ", productDetails.precio)
            
            let amount = Int(lblAmount.text!)!
            let amountDeleted = Int(productDetails.precio)!
            lblAmount.text = "\(amount - amountDeleted)"
            self.delegate.removeAmount(amount: lblAmount.text!)
            self.products.remove(at: indexPath.row)
            if let encoded = try? JSONEncoder().encode(products){
                UserDefaults.standard.set(encoded, forKey: "productCar")
            }
            UserDefaults.standard.set(amount - amountDeleted, forKey: "amountTotal")
            
            
            self.tableViewShopCar.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
