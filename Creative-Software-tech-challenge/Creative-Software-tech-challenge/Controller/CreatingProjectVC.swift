//
//  CreatingProjectVC.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

protocol CreatProjectVCDelegate: class {
    func updateProject(project: Project?)
}

class CreatProjectVC: UIViewController {
    // MARK:- Properties
    private let viewModel: ProjectVM
    private var project: Project?
    private let imagePickerController = UIImagePickerController()
    
    // MARK:- View components
    private lazy var navBar = CustomView().navBar(title: "Create Project", action: #selector(handleBack), target: self)
    private let stackView = UIStackView()
    private lazy var imagePicker = ImagePicker()
    private let dateButton = CustomView().dateButton()
    private lazy var titleTextView = CustomView().inputTextField(title: "Title", type: .title, textViewDelegate: self)
    private lazy var descriptionTextView = CustomView().inputTextField(title: "Description", type: .description, textViewDelegate: self)
    private let emptyView = UIView()
    private let saveButton = CustomView().projectButton(title: "Save")

//    private let 
    weak var delegate: CreatProjectVCDelegate?
    
    init(viewModel: ProjectVM) {
        self.viewModel = viewModel
        self.project = viewModel.project
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
        imagePickerController.delegate = self
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
        
        stackView.addArrangedSubview(imagePicker)
        imagePicker.snp.makeConstraints { make in
            make.height.equalTo(163 * ratio)
        }
        
        stackView.addArrangedSubview(dateButton)
        dateButton.snp.makeConstraints { make in
            make.height.equalTo(43 * ratio)
        }
        
        stackView.addArrangedSubview(titleTextView)
        stackView.addArrangedSubview(descriptionTextView)
        stackView.addArrangedSubview(emptyView)
        
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        saveButton.snp.makeConstraints { make in
            make.height.equalTo(43 * ratio)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
//        imageView.
    }
    
    // MARK:- Selectors
    @objc func handleBack() {
        popVC()
    }
    
    @objc func handleSaveButton() {
        delegate?.updateProject(project: project)
    }

}

//extension CreatProjectVC: CreatProjectVCDelegate {
//    func updateProject(project: Project?) {
//        print("\(project)")
//    }
//}

// MARK:- UIImagePickerControllerDelegate
extension CreatProjectVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        imagePicker.applyImage(image: selectedImage)
        if project == nil {
            project = Project()
        }
        project?.thumbNail = selectedImage
        dismiss(animated: true)
    }
}

extension CreatProjectVC: ImagePickerDelegate {
    func updateInfo(color: UIColor) {
        if project == nil {
            project = Project()
        }
        project?.color = color
    }
    
    func uploadImage() {
        present(imagePickerController, animated: true)
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
