//
//  HomeView.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 09/04/23.
//

import UIKit

import UIKit

protocol HomeViewProtocol {
    func setupCoinLabel (_ coin: Coin)
    func setupWalletLabel (_ wallet: Wallet)
}


final class HomeView: UIView {
    
    //MARK: - Delegate
    
    //MARK: - Properts
    
    private lazy var titleLabel = DPTitleLabel(text: "HOME", textAlignment: .center, color: .black, fontSize: 72, weight: .bold, numberOfLines: nil)
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            coinLabel,
            walletLabel
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = 5
        stack.distribution = .equalCentering
        stack.axis = .vertical
        
        return stack
    }()
    
    private lazy var coinLabel = DPTitleLabel(text: "MOEDA: USD", textAlignment: .center, color: .black, fontSize: 15, weight: .semibold, numberOfLines: nil)
    
    private lazy var walletLabel = DPTitleLabel(text: "SALDO: R$ 0,00", textAlignment: .center, color: .black, fontSize: 15, weight: .semibold, numberOfLines: nil)
    
    
    //MARK: - Inits
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

//MARK: - Components and Constraints
extension HomeView : ConfigurableView {
    
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubviews(titleLabel)
        addSubviews(stack)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 61),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setupAdditional() {}
    
}


//MARK: - Action
extension HomeView: HomeViewProtocol {
    
    func setupCoinLabel(_ coin: Coin) {
        coinLabel.text = "MOEDA: \(coin.description)"
    }
    
    func setupWalletLabel(_ wallet: Wallet) {
        walletLabel.text = "SALDO: R$ \(wallet.cash)"
    }
}

