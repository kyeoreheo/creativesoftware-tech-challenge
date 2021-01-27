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
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray2.cgColor
        return button
    }
    
    public func inputTextField(title: String, type: TextFieldType) -> UIView {
        let view = UIView()
        let titleLabel = UILabel()
        let textField = UITextField()
        
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
        
        view.addSubview(textField)
        textField.attributedPlaceholder = NSAttributedString(string: "Type here", attributes: [.foregroundColor: UIColor.gray3, .font: UIFont.notoReg(size: 14 * ratio)])
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.height.equalTo(type == .title ? 38 * ratio : 57 * ratio)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        return view
    }
}
