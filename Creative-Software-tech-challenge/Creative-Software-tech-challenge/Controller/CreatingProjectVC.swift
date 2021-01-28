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
    private var saveButtonY: CGFloat = 0.0
    public weak var delegate: CreatProjectVCDelegate?

    // MARK:- View components
    private let imagePickerController = UIImagePickerController()
    private lazy var navBar = CustomView().navBar(title: "Create Project", action: #selector(handleBack), target: self)
    private let stackView = UIStackView()
    private let dateButton = CustomView().dateButton()
    private lazy var imagePicker = ImagePicker()
    private lazy var titleTextView = CustomView().inputTextField(title: "Title", type: .title, textViewDelegate: self)
    private lazy var descriptionTextView = CustomView().inputTextField(title: "Description", type: .description, textViewDelegate: self)
    private let emptyView = UIView()
    private let datePicker = UIDatePicker()
    private let saveButton = CustomView().projectButton(title: "Save")
    
    // MARK:- Lifecycle
    init(viewModel: ProjectVM) {
        self.viewModel = viewModel
        self.project = viewModel.project
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
        if viewModel.project != nil {
            displayExistingProject()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewDidLayoutSubviews() {
        saveButtonY = saveButton.frame.origin.y
    }
    
    // MARK:- Configures
    private func configure() {
        imagePickerController.delegate = self
        imagePicker.delegate = self
    }
    
    private func configureUI() {
        view.backgroundColor = .gray
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
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
        
        stackView.addArrangedSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(43 * ratio)
        }
        datePicker.addSubview(dateButton)
        datePicker.addTarget(self, action: #selector(dateDidChange), for: .editingDidEnd)
        dateButton.isUserInteractionEnabled = false
        dateButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(stackView.snp.left)
            make.right.equalTo(stackView.snp.right)
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
    }
    
    // MARK:- Helpers
    private func displayExistingProject() {
        guard let project = viewModel.project,
              let titleTextView = titleTextView.viewWithTag(1) as? UITextView,
              let descriptionTextView = descriptionTextView.viewWithTag(1) as? UITextView
        else { return }
        
        if let color = project.color {
            imagePicker.applyColor(color: color)
            imagePicker.hideColorPicker()
        } else if let image = project.thumbNail {
            imagePicker.applyImage(image: image)
        }
        
        titleTextView.text = project.title == nil ? "Untitled" : project.title
        titleTextView.backgroundColor = .clear
        titleTextView.isUserInteractionEnabled = false
        titleTextView.layer.borderWidth = 0
        titleTextView.textColor = .black2
        titleTextView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        descriptionTextView.text = project.description == nil ? "N/A" : project.description
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.isUserInteractionEnabled = false
        descriptionTextView.layer.borderWidth = 0
        descriptionTextView.textColor = .black2
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        dateButton.setTitle(viewModel.dateText(of: project.date), for: .normal)
        saveButton.isHidden = true
    }
    
    private func createProjectIfNeeded() {
        if project == nil {
            project = Project()
        }
    }
    
    // MARK:- Selectors
    @objc func dateDidChange() {
        let now = datePicker.date
        dateButton.setTitle(viewModel.dateText(of: now), for: .normal)
        createProjectIfNeeded()
        project?.date = now
    }
    
    @objc func handleBack() {
        popVC()
    }
    
    @objc func handleSaveButton() {
        guard let titleTextView = titleTextView.viewWithTag(1) as? UITextView,
              let descriptionTextView = descriptionTextView.viewWithTag(1) as? UITextView
        else { return }
        createProjectIfNeeded()
        project?.title = titleTextView.text != "Type here" && titleTextView.text != ""
                         ? titleTextView.text : nil
        project?.description = descriptionTextView.text != "Type here" && descriptionTextView.text != ""
                         ? descriptionTextView.text : nil

        delegate?.updateProject(project: project)
        popVC()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let descriptionTextView = descriptionTextView.viewWithTag(1) as? UITextView
        else { return }
        let gap: CGFloat = 30.0
        let saveButtonHeight: CGFloat = 43.0 * ratio
        let bottomY = descriptionTextView.convert(descriptionTextView.bounds, to: self.view).maxY
        let moveY = (view.frame.height - bottomY) - keyboardSize.height - (gap * 2) - saveButtonHeight
        saveButton.frame.origin.y =  saveButtonY - (keyboardSize.height + moveY - view.safeAreaInsets.bottom)
        view.frame.origin.y = moveY
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        saveButton.frame.origin.y = saveButtonY
        view.frame.origin.y = 0
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK:- UIImagePickerControllerDelegate
extension CreatProjectVC: ImagePickerDelegate {
    func updateInfo(color: UIColor) {
        createProjectIfNeeded()
        project?.color = color
        project?.thumbNail = nil
    }
    
    func uploadImage() {
        present(imagePickerController, animated: true)
    }
}

extension CreatProjectVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        imagePicker.applyImage(image: selectedImage)
        createProjectIfNeeded()
        project?.thumbNail = selectedImage
        project?.color = nil
        imagePickerController.dismiss(animated: true)
    }
}

// MARK:- UITextViewDelegate
extension CreatProjectVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard let titleTextView = titleTextView.viewWithTag(1) as? UITextView,
              let descriptionTextView = descriptionTextView.viewWithTag(1) as? UITextView
        else { return }
        if textView.text == "Type here" {
            if textView == titleTextView {
                titleTextView.text = ""
                titleTextView.textColor = .black2
            } else {
                descriptionTextView.text = ""
                descriptionTextView.textColor = .black2
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
                titleTextView.textColor = .gray3
            } else {
                descriptionTextView.text = "Type here"
                descriptionTextView.textColor = .gray3
            }
        }
    }
}
