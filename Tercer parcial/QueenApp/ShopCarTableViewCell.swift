//
//  ShopCarTableViewCell.swift
//  Queen
//
//  Created by Kaleido 08 on 20/05/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class ShopCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
