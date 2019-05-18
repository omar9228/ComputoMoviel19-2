//
//  ViewController.swift
//  TabController2
//
//  Created by Omar P. Rojas on 4/24/19.
//  Copyright © 2019 Omar P. Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func ingresar(_ sender: Any) {
    navigationBar.title = textField.text
    }
    
    @IBOutlet weak var navigationBar: UINavigationItem!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

