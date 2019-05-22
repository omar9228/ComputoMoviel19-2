//
//  cupon.swift
//  Queen
//
//  Created by Omar P. Rojas on 5/21/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import Foundation
import UIKit

class cuponF: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper.jpg")
        self.view.insertSubview(backgroundImage, at: 0)

}
}
