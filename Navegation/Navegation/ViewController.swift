//
//  ViewController.swift
//  Navegation
//
//  Created by Omar P. Rojas on 4/1/19.
//  Copyright © 2019 Omar P. Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {segue.destination.navigationItem.title = textField.text
        
    }
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func unwindToRed( unwindSegue: UIStoryboardSegue){
        
        
    }


}

