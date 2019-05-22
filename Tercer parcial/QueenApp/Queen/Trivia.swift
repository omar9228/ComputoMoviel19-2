//
//  File.swift
//  Queen
//
//  Created by Omar P. Rojas on 5/18/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class Trivias: UIViewController {
    
    
    //MARK: Variables
    // IOUTLETS
    
    @IBOutlet weak var switchQuestion1: UISwitch!
    @IBOutlet weak var switchOutlets2: UISwitch!
    @IBOutlet weak var switchQuestion3: UISwitch!
    
    var arrayAnswers: [Bool] = [false,true,true]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
 
    
    //MARK: Acciones de los switches segun el estado en el que se encuentren
    
    @IBAction func pregunta1(_ sender: UISwitch) {
        if (sender.isOn == false){
            self.arrayAnswers[0] = false
        }else{
            self.arrayAnswers[0] = true
        }
    }
    
    @IBAction func pregunta2(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.arrayAnswers[1] = false
        }else{
            self.arrayAnswers[1] = true
        }
    }
    
    @IBAction func pregunta3(_ sender: UISwitch) {
        if (sender.isOn == true){
            self.arrayAnswers[2] = false
        }else{
            self.arrayAnswers[2] = true
        }
    }
    
    @IBAction func enviar(_ sender: Any) {
        
        let case1 = arrayAnswers[0]
        let case2 = arrayAnswers[1]
        let case3 = arrayAnswers[2]
        
        if case1 == false && case2 == true && case3 == true{
            //Respuestas Correctas
            print("😎yeeeeii   respuestas correctas")
            
            
            self.performSegue(withIdentifier: "segueCupon", sender: nil)
            
        }else {
            // ALerta
            
            Alerta(titulo: "Respuestas Incorrectas", mensaje: "La Reina esta decepcionada de ti 😩")
        }
        
    }
    
    
    
    //Función crear Alerta
    
    func Alerta (titulo: String, mensaje: String){
        
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)

    }
    
    


    
}

