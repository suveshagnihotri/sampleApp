//
//  CollectionViewCell.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 15/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mypagerImage: UIImageView!
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var lebel2: UILabel!
    @IBOutlet weak var skiplabel: UILabel!
    
    override var bounds: CGRect {
        didSet {
            contentView.frame = bounds
        }
    }
    
}
