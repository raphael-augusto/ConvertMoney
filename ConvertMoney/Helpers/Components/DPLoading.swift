//
//  DPLoading.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 08/04/23.
//

import UIKit


final class DPLoading: UIActivityIndicatorView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(color: UIColor? , style: Style, size: Int) {
        self.init(frame: .zero)
        self.style = style
        self.color = color
        self.transform = CGAffineTransform(scaleX: CGFloat(size), y: CGFloat(size))
    }

    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        startAnimating()
    }
}
