//
//  Ext+UIView.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 09/04/23.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(cornerRadiuns: CGFloat, typCorners: CACornerMask) {
        self.layer.cornerRadius = cornerRadiuns
        self.layer.maskedCorners = typCorners
        self.clipsToBounds = true
    }
}

extension CACornerMask {
    
    static public let lowerRight:  CACornerMask = .layerMaxXMaxYCorner
    static public let lowerLeft:   CACornerMask = .layerMinXMaxYCorner
    static public let upperRight:  CACornerMask = .layerMaxXMinYCorner
    static public let upperLeft:   CACornerMask = .layerMinXMinYCorner
}
