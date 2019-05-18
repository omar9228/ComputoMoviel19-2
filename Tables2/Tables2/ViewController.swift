//
//  ViewController.swift
//  Tables2
//
//  Created by Omar P. Rojas on 5/6/19.
//  Copyright © 2019 Omar P. Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var descripcion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = animales[miIndex]
        
        descripcion.text = descripcion[ miIndex]
    }


}

