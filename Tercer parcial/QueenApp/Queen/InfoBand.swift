//
//  InfoBand.swift
//  Queen
//
//  Created by Omar P. Rojas on 5/18/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class sobreLaBanda: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.jpg")!)
        
    }
    
    
}
