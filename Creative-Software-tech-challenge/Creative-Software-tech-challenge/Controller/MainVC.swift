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
    private let titleLabel = UILabel()
    private let projectCVC = ProjectCVC()

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
        projectCVC.delegate = self
    }
    
    private func configureUI() {
        view.backgroundColor = .gray

        view.addSubview(titleLabel)
        titleLabel.text = "Projects"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = .notoBold(size: 24 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(34)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(projectCVC.view)
        projectCVC.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(42)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }

}

extension MainVC: ProjectCVCDelegate {
    func cellTapped(index: Int) {
        print("DEBUG:- tapped \(index)")
        pushVC(CreatProjectVC(project: nil))
    }
    
}
