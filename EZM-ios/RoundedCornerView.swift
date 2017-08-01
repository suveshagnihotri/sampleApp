//
//  RoundedCornerView.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 21/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit

class RoundedCornerView: UIView {

    override func drawRect(rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()
        CGContextAddRect(c, CGRectMake(10, 10, frame.maxX, 80))
        CGContextSetStrokeColorWithColor(c , UIColor.redColor().CGColor)
        CGContextStrokePath(c)
    }

}
