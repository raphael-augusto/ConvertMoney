//
//  OnboardingView.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 09/04/23.
//

import UIKit

protocol OnboardingProtocol: AnyObject {
    func didButtonToStart ()
}


final class OnboardingView: UIView {
    
    //MARK: - Delegate
    weak var delegate: OnboardingProtocol?
    
    
    //MARK: - Properts
    private lazy var imageMoney: UIImageView = {
        let image = UIImage(named: "money")
        let img = UIImageView(image: image)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    
    private lazy var titleLabel = DPTitleLabel(text: "Convert Money",
                                               textAlignment: .center,
                                               color: .white,
                                               fontSize: 42,
                                               weight: .bold,
                                               numberOfLines: 2)
    
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        view.roundCorners(cornerRadiuns: 40, typCorners: [.upperLeft, .upperRight])
        
        return view
    }()
    
    private lazy var titleContainerLabel = DPTitleLabel(text: "Olá,\nvamos economizar?",
                                                        textAlignment: .left,
                                                        color: .black,
                                                        fontSize: 32,
                                                        weight: .bold,
                                                        numberOfLines: 2)
    
    private lazy var descriptionLabel = DPTitleLabel(text: "Nunca foi tão fácil saber o seu saldo e se você consegue comprar aquele produto desejado",
                                                        textAlignment: .left,
                                                        color: .black,
                                                        fontSize: 16,
                                                        weight: .regular,
                                                        numberOfLines: 2)

    
    private lazy var buttonToStart = DPButton(colorBackground: UIColor(named: "orageDefault")!,
                                              title: "COMEÇAR",
                                              titleColor: nil)


    
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
extension OnboardingView : ConfigurableView {
    func initView() {
        backgroundColor = UIColor(named: "darkGreen")
    }
    
    func initSubviews() {
        addSubviews(imageMoney)
        addSubviews(titleLabel)
        addSubviews(container)
        
        container.addSubview(titleContainerLabel)
        container.addSubview(descriptionLabel)
        container.addSubview(buttonToStart)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageMoney.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            imageMoney.heightAnchor.constraint(equalToConstant: 228),
            imageMoney.widthAnchor.constraint(equalToConstant: 365),
            
            titleLabel.topAnchor.constraint(equalTo: imageMoney.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            
            container.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 90),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleContainerLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 42),
            titleContainerLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 32),
            titleContainerLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),

            descriptionLabel.topAnchor.constraint(equalTo: titleContainerLabel.bottomAnchor, constant: 22),
            descriptionLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            
            buttonToStart.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 42),
            buttonToStart.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 32),
            buttonToStart.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            buttonToStart.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    func setupAdditional() {
        buttonToStart.addAction(
            UIAction { _ in
                self.didButtonToStart()
            }, for: .touchUpInside
          )
    }
}


//MARK: - Action
extension OnboardingView: OnboardingProtocol {
    
    func didButtonToStart() {
        self.delegate?.didButtonToStart()
    }
}

