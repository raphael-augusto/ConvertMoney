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
    private lazy var viewModel: OnboardingInput = {
        let viewModel = OnboardingViewModel()
        viewModel.output = self
        return viewModel
    }()
    
    
    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setFirstViewer()
    }
    
    
    override func loadView() {
        view = customView as? UIView
    }
}

extension OnboardingViewController: OnboardingOutput {}

extension OnboardingViewController:  OnboardingProtocol {

    func didButtonToStart() {
        print("Navigation home")
    }
}


