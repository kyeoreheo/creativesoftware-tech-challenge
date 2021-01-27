//
//  ImagePicker.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class ImagePicker: UIView {
    private let backgroundImageButton = UIButton()
    private let blackCover = UIView()
    private let uploadImage = UIImageView()
    private lazy var colorPickerCVC = ColorPickerCVC(colors: project.posibleColors)
    private let project: Project
    
    init(project: Project) {
        self.project = project
        super.init(frame: .zero)
        configure()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        colorPickerCVC.delegate = self
    }
    
    private func configureUI() {
        addSubview(backgroundImageButton)
        backgroundImageButton.backgroundColor = .red
        backgroundImageButton.setImage(UIImage(named: "placeholder"), for: .normal)
        backgroundImageButton.imageView?.contentMode = .scaleAspectFill
        backgroundImageButton.imageView?.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        backgroundImageButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        backgroundImageButton.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        backgroundImageButton.addSubview(blackCover)
        blackCover.backgroundColor = .black
        blackCover.alpha = 0.3
        blackCover.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        addSubview(uploadImage)
        uploadImage.image = UIImage(named: "uploadImage")
        uploadImage.isUserInteractionEnabled = false
        uploadImage.contentMode = .scaleAspectFit
        uploadImage.snp.makeConstraints { make in
            make.width.equalTo(33 * ratio)
            make.height.equalTo(30 * ratio)
            make.centerX.equalToSuperview()
            make.top.equalTo(39 * ratio)
        }
        
        addSubview(colorPickerCVC.view)
        colorPickerCVC.view.snp.makeConstraints { make in
            make.height.equalTo(30 * ratio)
            make.left.equalToSuperview().offset(26 * ratio)
            make.right.equalToSuperview().offset(-26 * ratio)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    @objc func handleButtonTapped() {
        print("DEBUG:- image picker button tapped")
    }
}

extension ImagePicker: ColorPickerCVCDelegate {
    func cellTapped(index: Int) {
        backgroundImageButton.setImage(nil, for: .normal)
        backgroundImageButton.backgroundColor = project.posibleColors[index]
    }
}
