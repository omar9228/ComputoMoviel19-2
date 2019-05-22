//
//  CuponViewController.swift
//  Queen
//
//  Created by Carlos Ramirez on 5/19/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import Foundation
import UIKit

class CuponViewController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UserDefaults.standard.set(true, forKey: "flagDescuento")
        
    }
    
    
    
    @IBAction func CerrarCupon(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
}



