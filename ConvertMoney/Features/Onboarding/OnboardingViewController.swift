//
//  OnboardingViewController.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 09/04/23.
//

import UIKit

final class OnboardingViewController: UIViewController {

    
    // MARK: - Properties
    
    private lazy var customView: OnboardingProtocol = {
        let view = OnboardingView()
        view.delegate = self
        
        return view
    }()

    
    // MARK: - Dependencies
    
    
    
    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = customView as? UIView
    }
}

extension OnboardingViewController:  OnboardingProtocol {

    func didButtonToStart() {
        print("Navigation home")
    }
}
