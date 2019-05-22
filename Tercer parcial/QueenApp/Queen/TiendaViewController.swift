//
//  TiendaViewController.swift
//  Queen
//
//  Created by Omar P. Rojas on 5/19/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import Foundation
import UIKit

struct DataCell {
    
    let mensaje: String?
    let imagenNombre: String?
    let precio: String?
    let descriptionProduct: String?
    
}

class TiendaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    
    var data: [DataCell] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotalAmount: UILabel!
//    let selectionVC = ProductDescriptionViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let amountTotal = UserDefaults.standard.integer(forKey: "amountTotal")

        lblTotalAmount.text = "Total: $\(amountTotal)"
        
        
//        selectionVC.selectionDelegate = self
        
        
        data.append(DataCell.init(mensaje: "Funko Freddie Mercury", imagenNombre: "funko", precio: "$299", descriptionProduct: "Funko en forma del mejor cantante de todos los tiempos."))
        data.append(DataCell.init(mensaje: "Playera, Freddie Mercury", imagenNombre: "playera", precio: "$199", descriptionProduct: "Playera del mejor cantante de todos los tiempos."))
        data.append(DataCell.init(mensaje: "Taza, Freddie Mercury", imagenNombre: "taza", precio: "$99", descriptionProduct: "Taza del mejor cantante de todos los tiempos."))
        data.append(DataCell.init(mensaje: "Monopoly Freddie Mercury", imagenNombre: "Monopoly", precio: "$349", descriptionProduct: "Monopoly del mejor cantante de todos los tiempos."))
        data.append(DataCell.init(mensaje: "Disco Queen", imagenNombre: "disco", precio: "$200", descriptionProduct: "Disco de la mejor banda de todos los tiempos."))
        data.append(DataCell.init(mensaje: "Case Freddie Mercury", imagenNombre: "caseCell", precio: "$190", descriptionProduct: "Case para celular del mejor cantante de todos los tiempos."))
    
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.imageView!.image = UIImage(named: data[indexPath.row].imagenNombre!)
        cell.lblMensaje.text = data[indexPath.row].mensaje
        cell.lblPrice.text = data[indexPath.row].precio
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDetails"{
            
            let detailsViewController = segue.destination as! ProductDescriptionViewController
            
            detailsViewController.selectionDelegate = self
            
            detailsViewController.imageName = data[(tableView.indexPathsForSelectedRows?.first!.item)!].imagenNombre
            detailsViewController.precio = data[(tableView.indexPathsForSelectedRows?.first!.item)!].precio
            detailsViewController.product = data[(tableView.indexPathsForSelectedRows?.first!.item)!].mensaje
            detailsViewController.descriptionProduct = data[(tableView.indexPathsForSelectedRows?.first!.item)!].descriptionProduct
            
            
        }
        if segue.identifier == "segueCarrito"{
            let shopCarViewController = segue.destination as! ShopCarViewController
            
            shopCarViewController.delegate = self
            
        }
        
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        

        performSegue(withIdentifier: "segueCarrito", sender: nil)
        
    }
    
    
    func Alerta (titulo: String, mensaje: String){
        
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
        
        UserDefaults.standard.removeObject(forKey: "flagDescuento")
        
    }
    
}
extension TiendaViewController: AmountDelegate {
    
    func passAmount(amount: Int) {
        var amountTotal = UserDefaults.standard.integer(forKey: "amountTotal")
        if amountTotal == 0 {
            lblTotalAmount.text = "Total: $\(amount)"
            UserDefaults.standard.set(amount, forKey: "amountTotal")
        }else{
            amountTotal = amountTotal + amount
            lblTotalAmount.text = "Total: $\(amountTotal)"
            UserDefaults.standard.set(amountTotal, forKey: "amountTotal")
        }

    }

}

extension TiendaViewController: RemoveAmount {
    func removeAmount(amount: String) {
        lblTotalAmount.text = "Total: $\(amount)"
    }
    

}
