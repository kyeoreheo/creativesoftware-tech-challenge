//
//  CustomView.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class CustomView {
    public func dateButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Add date & time", for: <#T##UIControl.State#>)
        return button
    }
    
    public func inputTextField(title: String) -> UIView {
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
            make.height.equalTo(38 * ratio)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        return view
    }
}
