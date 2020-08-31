//
//  ItemCell.swift
//  CustomCollection
//
//  Created by Hoang Tung Lam on 8/31/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import UIKit

//class InsetLabel: UILabel {
//    override func drawText(in rect: CGRect) {
//        let insets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
//        super.drawText(in: rect.inset(by: insets))
//    }
//}

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblDes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.awakeFromNib()
//        layer.cornerRadius = 20
//        layer.borderWidth = 3
//        label.textColor = UIColor.black
//        label.backgroundColor = UIColor.white
    }

}
