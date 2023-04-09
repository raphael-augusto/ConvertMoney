//
//  SplashView.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

protocol SplashLogic: AnyObject {}

final class SplashView: UIView {

    // MARK: - Layout
    private lazy var loadingIndicator = DPLoading(color: .white, style: .medium, size: 3)
    
    private lazy var loadingLabel = DPTitleLabel(text: "Carregando...",
                                                 textAlignment: .center,
                                                 color: .white,
                                                 fontSize: 22,
                                                 weight: .regular,
                                                 numberOfLines: nil)
    
    
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
        backgroundColor = UIColor(named: "darkGreen")
    }
    
    func initSubviews() {
        addSubviews(loadingIndicator)
        addSubviews(loadingLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 63),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 63),
            
            loadingLabel.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 14.5),
            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setupAdditional() {}
}
