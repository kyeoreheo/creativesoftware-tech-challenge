//
//  ViewController.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    // MARK:- Properties
    
    // MARK:- View components
    let projectCVC = ProjectCVC()

    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    // MARK:- Configures
    private func configure() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureUI() {
        view.backgroundColor = .orange

    }

}

