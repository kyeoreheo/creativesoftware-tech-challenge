//
//  ImagePicker.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

protocol ImagePickerDelegate: class {
    func uploadImage()
    func updateInfo(color: UIColor)
}

class ImagePicker: UIView {
    // MARK:- Properties
    private let posibleColors: [UIColor] = [.picker1, .picker2, .picker3, .picker4, .picker5, .picker6]
    public weak var delegate: ImagePickerDelegate?
    
    // MARK:- View components
    private let backgroundImageButton = UIButton()
    private let blackCover = UIView()
    private let guideLabel = UILabel()
    private let uploadImage = UIImageView()
    private lazy var colorPickerCVC = ColorPickerCVC(colors: posibleColors)

    // MARK:- Lifecycles
    init() {
        super.init(frame: .zero)
        configure()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configure() {
        colorPickerCVC.delegate = self
    }
    
    private func configureUI() {
        addSubview(backgroundImageButton)
        backgroundImageButton.layer.cornerRadius = 10
        backgroundImageButton.clipsToBounds = true
        backgroundImageButton.setImage(UIImage(named: "placeholder"), for: .normal)
        backgroundImageButton.imageView?.contentMode = .scaleAspectFill
        backgroundImageButton.imageView?.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        backgroundImageButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        backgroundImageButton.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        backgroundImageButton.imageView?.addSubview(blackCover)
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
        
        addSubview(guideLabel)
        guideLabel.text = "Upload header image or choose color"
        guideLabel.textAlignment = .center
        guideLabel.font = .notoReg(size: 12 * ratio)
        guideLabel.textColor = .gray4
        guideLabel.snp.makeConstraints { make in
            make.top.equalTo(uploadImage.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        addSubview(colorPickerCVC.view)
        colorPickerCVC.view.snp.makeConstraints { make in
            make.height.equalTo(30 * ratio)
            make.left.equalToSuperview().offset(26 * ratio)
            make.right.equalToSuperview().offset(-26 * ratio)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    // MARK:- Helpers
    public func hideColorPicker() {
        colorPickerCVC.collectionView.isHidden = true
        uploadImage.isHidden = true
        guideLabel.isHidden = true
    }
    
    public func applyImage(image: UIImage) {
        backgroundImageButton.setImage(image, for: .normal)
        backgroundImageButton.backgroundColor = .white
        colorPickerCVC.deselectAll()
    }
    
    public func applyColor(color: UIColor) {
        backgroundImageButton.setImage(nil, for: .normal)
        backgroundImageButton.backgroundColor = color
    }
    
    // MARK:- Selectors
    @objc func handleButtonTapped() {
        delegate?.uploadImage()
    }
}

// MARK:- ColorPickerCVCDelegate
extension ImagePicker: ColorPickerCVCDelegate {
    func cellTapped(index: Int) {
        applyColor(color: posibleColors[index])
        delegate?.updateInfo(color: posibleColors[index])
    }
}
