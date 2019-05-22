//
//  CustomTable.swift
//  Queen
//
//  Created by Omar P. Rojas on 5/19/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var message1 : String?
    var mainImage1 : UIImage?
    
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

