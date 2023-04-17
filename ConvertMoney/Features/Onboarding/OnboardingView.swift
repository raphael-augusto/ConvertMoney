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
    private lazy var stackTopContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageMoney,
            titleLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    
    private lazy var imageMoney: UIImageView = {
        let img = UIImageView(image: .onboardingImg)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    
    private lazy var titleLabel = DPTitleLabel(text: "Convert \nMoney",
                                               textAlignment: .center,
                                               color: .Neutral.color6,
                                               fontSize: 42,
                                               weight: .bold,
                                               numberOfLines: nil)
    
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .Neutral.color6
        
        view.roundCorners(cornerRadiuns: 40, typCorners: [.upperLeft, .upperRight])
        
        return view
    }()
    
    
    private lazy var stackContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleContainerLabel,
            descriptionLabel,
            buttonToStart
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 22

        stackView.setCustomSpacing(40, after: descriptionLabel)
        
        return stackView
    }()
    
    
    private lazy var titleContainerLabel = DPTitleLabel(text: "Olá,\nvamos economizar?",
                                                        textAlignment: .left,
                                                        color: .black,
                                                        fontSize: 32,
                                                        weight: .bold,
                                                        numberOfLines: nil)
    
    private lazy var descriptionLabel = DPTitleLabel(text: "Nunca foi tão fácil saber o seu saldo e se você consegue comprar aquele produto desejado",
                                                     textAlignment: .left,
                                                     color: .black,
                                                     fontSize: 16,
                                                     weight: .regular,
                                                     numberOfLines: nil)

    
    private lazy var buttonToStart = DPButton(colorBackground: .Brand.color1,
                                              title: "COMEÇAR",
                                              titleColor: nil,
                                              action: .init(handler:  { _ in self.didButtonToStart()}) )


    
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
        backgroundColor = .Brand.color3
    }
    
    func initSubviews() {
        addSubviews(stackTopContainer)
        addSubviews(container)
        
        container.addSubview(stackContainer)
    }
    
    func initConstraints() {
        
        //constraint device layout
        let topConstraintConstant:CGFloat                = DeviceTypes.isiPhone14Pro ? 60 : 20
        let distanceConstraintConstant:CGFloat           = DeviceTypes.isiPhone14Pro ? 90 : 20
        let topStackContainerConstraintConstant:CGFloat  = DeviceTypes.isiPhone14Pro ? 42 : 20
        
        
        NSLayoutConstraint.activate([
            stackTopContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant),
            stackTopContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackTopContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            container.topAnchor.constraint(equalTo: stackTopContainer.bottomAnchor, constant: distanceConstraintConstant),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: topStackContainerConstraintConstant),
            stackContainer.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 32),
            stackContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            
            buttonToStart.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    func setupAdditional() {}
}


//MARK: - Action
extension OnboardingView: OnboardingProtocol {
    
    func didButtonToStart() {
        self.delegate?.didButtonToStart()
    }
}

