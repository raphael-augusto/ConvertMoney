//
//  DPButton.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

final class DPButton: UIButton {
    
    private var tapAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(colorBackground: UIColor, title: String, titleColor: UIColor?) {
        self.init(frame: .zero)
        set(color: colorBackground, title: title, titleColor: titleColor)
    }
    
    
    private func configure(){
        configuration                             = .filled()
        configuration?.cornerStyle                = .capsule
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(color: UIColor, title: String, titleColor: UIColor?) {
        configuration?.baseBackgroundColor  = color
        configuration?.baseForegroundColor  = titleColor ?? .white
        configuration?.title                = title
    }
}
