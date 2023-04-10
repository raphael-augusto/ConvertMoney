//
//  HomeViewController.swift
//  ConvertMoney
//
//  Created by Raphael Augusto on 09/04/23.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties

    private lazy var customView: HomeView = {
        let view = HomeView()
        return view
    }()

    // MARK: - Dependencies

    
    // MARK: - Layout

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        view = customView
    }
}
