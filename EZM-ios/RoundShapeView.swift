//
//  RoundShapeView.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 21/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit

extension CALayer {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.CGPath
        mask = shape
    }
}
