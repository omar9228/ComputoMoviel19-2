//
//  FirstViewController.swift
//  Queen
//
//  Created by Macbook on 4/29/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.jpg")!)
        
    }


}

