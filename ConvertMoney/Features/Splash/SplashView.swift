//
//  SplashView.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

protocol SplashLogic: AnyObject {

}

final class SplashView: UIView, SplashLogic {

    // MARK: - Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
         initLayout()
     }
}


extension SplashView: ConfigurableView {
    
    func initView() {
        backgroundColor = .red
    }
    
    func initSubviews() {}
    
    func initConstraints() {}
    
    func setupAdditional() {}
    

}
