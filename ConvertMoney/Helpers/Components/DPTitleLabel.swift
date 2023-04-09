//
//  DPTitleLabel.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 08/04/23.
//

import UIKit

class DPTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(text: String?,
                     textAlignment: NSTextAlignment,
                     color: UIColor,
                     fontSize: CGFloat,
                     weight: UIFont.Weight,
                     numberOfLines: Int?) {
        self.init(frame: .zero)
        
        self.text = text
        self.textAlignment = textAlignment
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.numberOfLines = numberOfLines ?? 0
    }
    
    func configure () {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
