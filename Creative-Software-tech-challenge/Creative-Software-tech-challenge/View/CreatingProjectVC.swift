//
//  CreatingProjectVC.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class CreatProjectVC: UIViewController {
    // MARK:- Properties
    private let project: Project?
    private let imagePicker = UIImagePickerController()
    
    // MARK:- View components
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let dateButton = CustomView().dateButton()
    private let titleTextField = CustomView().inputTextField(title: "Title", type: .title)
    private let descriptionTextField = CustomView().inputTextField(title: "Description", type: .description)
    private let emptyView = UIView()

//    private let 

//    weak var delegate: ?
    
    init(project: Project?) {
        self.project = project
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    
    // MARK:- Configures
    private func configure() {
        imagePicker.delegate = self
    }
    
    private func configureUI() {
        view.backgroundColor = .gray
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        
        stackView.addArrangedSubview(dateButton)
        dateButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20) // should be changed
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview()s.offset(-16)
            make.height.equalTo(43 * ratio)
            
        }
        
        stackView.addArrangedSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
//            make.top.equalTo(dateButton.snp.bottom).offset(24) // should be changed
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
        }
        
        stackView.addArrangedSubview(descriptionTextField)
        descriptionTextField.snp.makeConstraints { make in
//            make.top.equalTo(titleTextField.snp.bottom).offset(24) // should be changed
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
        }
        stackView.addArrangedSubview(emptyView)
//        imageView.
    }
    
    // MARK:- Selectors
    @objc func handleBack() {
        //dismiss(animated: true)
    }
    
    @objc func handleImagePicker() {
        present(imagePicker, animated: true)
    }
}

// MARK:- UIImagePickerControllerDelegate
extension CreatProjectVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        
//        headerView.buttons[imageIndex].setImage(selectedImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true)
    }
}
