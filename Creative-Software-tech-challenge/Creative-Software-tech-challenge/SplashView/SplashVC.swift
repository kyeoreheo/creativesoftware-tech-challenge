//
//  SplashView.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit
import SnapKit

class SplashVC: UIViewController {
    // MARK:- Properties
    private let label = UILabel()
    private let infoLabel = UILabel()
    private let button = ProjectButton(title: "Start")
    
    // MARK:- View components
    let projectCVC = ProjectCVC()

    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobalVariables()
        configureUI()
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let navigation = UINavigationController(rootViewController: MainVC())
            navigation.modalPresentationStyle = .fullScreen
            navigation.navigationBar.isHidden = true
            strongSelf.present(navigation, animated: false, completion: nil)
        }
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.text = "Creative Softwares\nTech challenge"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .notoBold(size: 30 * ratio)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.snp.centerY).offset(-16)
            //            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        }
        
        view.addSubview(infoLabel)
        infoLabel.text = "Kyeore Heo\n91kyoheo@gmail.com"
        infoLabel.textAlignment = .left
        infoLabel.numberOfLines = 2
        infoLabel.font = .notoReg(size: 20 * ratio)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(presentMainVC), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.height.equalTo(43 * ratio)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
    }
    
    // MARK:- Helpers
    private func applyGlobalVariables() {
        let heightRatio: CGFloat = view.frame.height / 812.0
        ratio = heightRatio < 1 ? 1:heightRatio
        viewHeight = view.frame.height
        topSafeMargin = ( UIApplication.shared.windows.first{$0.isKeyWindow}?.safeAreaInsets.top ?? 0) as CGFloat
    }
    
    @objc func presentMainVC() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let navigation = UINavigationController(rootViewController: MainVC())
            navigation.modalPresentationStyle = .fullScreen
            navigation.navigationBar.isHidden = true
            strongSelf.present(navigation, animated: false, completion: nil)
        }
    }

}
