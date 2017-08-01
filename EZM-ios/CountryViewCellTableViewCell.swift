//
//  CountryViewCellTableViewCell.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 18/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit

class CountryViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
