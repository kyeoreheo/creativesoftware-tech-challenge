//
//  CreatingProjectVC.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class CreatProjectVC: UIViewController {
    // MARK:- Properties
    private let viewModel: ProjectVM
    private let imagePicker = UIImagePickerController()
    
    // MARK:- View components
    private lazy var navBar = CustomView().navBar(title: "Create Project", action: #selector(handleBack), target: self)
    private let stackView = UIStackView()
    private lazy var imageView = ImagePicker()
    private let dateButton = CustomView().dateButton()
    private lazy var titleTextView = CustomView().inputTextField(title: "Title", type: .title, textViewDelegate: self)
    private lazy var descriptionTextView = CustomView().inputTextField(title: "Description", type: .description, textViewDelegate: self)
    private let emptyView = UIView()

//    private let 
//    weak var delegate: ?
    
    init(viewModel: ProjectVM) {
        self.viewModel = viewModel
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
        
        view.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(34)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(42)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        stackView.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.height.equalTo(163 * ratio)
        }
        
        stackView.addArrangedSubview(dateButton)
        dateButton.snp.makeConstraints { make in
            make.height.equalTo(43 * ratio)
        }
        
        stackView.addArrangedSubview(titleTextView)
        stackView.addArrangedSubview(descriptionTextView)
        stackView.addArrangedSubview(emptyView)
//        imageView.
    }
    
    // MARK:- Selectors
    @objc func handleBack() {
        popVC()
//        dismiss(animated: true)
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

extension CreatProjectVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard let titleTextView = titleTextView.viewWithTag(1) as? UITextView,
              let descriptionTextView = descriptionTextView.viewWithTag(1) as? UITextView
        else { return }
        if textView.text == "Type here" {
            if textView == titleTextView {
                titleTextView.text = ""
            } else {
                descriptionTextView.text = ""
            }
        }

    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let titleTextView = titleTextView.viewWithTag(1) as? UITextView,
              let descriptionTextView = descriptionTextView.viewWithTag(1) as? UITextView
        else { return }
        if textView.text == "" {
            if textView == titleTextView {
                titleTextView.text = "Type here"
            } else {
                descriptionTextView.text = "Type here"
            }
        }
    }
}
