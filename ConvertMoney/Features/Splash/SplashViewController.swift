//
//  SplashViewController.swift
//  ConvertMoney
//
//  Created by Rodrigo Policante Martins on 05/04/23.
//

import UIKit

final class SplashViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: SplashView = {
        let view = SplashView()
        return view
    }()

    // MARK: - Dependencies

    private lazy var viewModel: SplashInput = {
        let viewModel = SplashViewModel()
        viewModel.output = self
        return viewModel
    }()

    
    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkData()
    }

    override func loadView() {
        view = customView
    }

}

extension SplashViewController: SplashOutput {



}
