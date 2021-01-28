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
    private var projects = [Project]() {
        didSet {
            projectCVC.projects = projects
        }
    }
    
    // MARK:- View components
    private let titleLabel = UILabel()
    private let projectCVC = ProjectCVC()

    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
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
        titleLabel.textColor = .black1
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

// MARK:- ProjectCVCDelegate
extension MainVC: ProjectCVCDelegate {
    func cellTapped(index: Int, viewModel: ProjectVM) {
        let viewController = CreatProjectVC(viewModel: viewModel)
        viewController.delegate = self
        pushVC(viewController)
    }
}

// MARK:- CreatProjectVCDelegate
extension MainVC: CreatProjectVCDelegate {
    func updateProject(project: Project?) {
        guard let project = project else { return }
        if project.color != nil || project.date != nil || project.title != nil || project.description != nil || project.thumbNail != UIImage(named: "placeholder") {
            projects.append(project)
        }
    }
}
