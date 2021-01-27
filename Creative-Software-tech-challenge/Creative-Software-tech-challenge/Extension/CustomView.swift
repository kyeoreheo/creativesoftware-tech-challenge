//
//  CustomView.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

enum TextFieldType {
    case title
    case description
}

class CustomView {
    public func dateButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Add date & time", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = .notoBold(size: 14 * ratio)
        button.imageView?.contentMode = .scaleAspectFill
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray2.cgColor
        return button
    }
    
    public func inputTextField(title: String, type: TextFieldType, textViewDelegate: UITextViewDelegate) -> UIView {
        let view = UIView()
        let titleLabel = UILabel()
        let textView = UITextView()
        
        view.addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.textColor = .black2
        titleLabel.font = .notoBold(size: 16 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(24 * ratio)
        }
        
        view.addSubview(textView)
        textView.tag = 1
        textView.delegate = textViewDelegate
        textView.font = .notoReg(size: 14 * ratio)
        textView.text = "Type here"
        textView.textColor = .gray3
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray2.cgColor
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.height.equalTo(type == .title ? 38 * ratio : 57 * ratio)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        return view
    }
    
    func navBar(title: String, action: Selector, target: Any) -> UIView {
        let view = UIView()
        let titleLabel = UILabel()
        let backButton = UIButton()
        
        view.addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.font = .notoBold(size: 24 * ratio)
        titleLabel.textColor = .black1
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(backButton)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(target, action: action, for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(25 * ratio)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.left.equalToSuperview()
        }
        
        return view
    }
}
