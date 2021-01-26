//
//  createProjectCell.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    // MARK:- View components
    private let createButton = UIImageView()
    
    // MARK:- Properties
//    weak var delegate: ProductCellDelegate?

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configure() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray2.cgColor
    }
    
    private func configureUI() {
        backgroundColor = .white

        addSubview(createButton)
        createButton.image = UIImage(named: "PlusCircle")
        createButton.snp.makeConstraints { make in
            make.width.height.equalTo(60 * ratio)
            make.center.equalToSuperview()
        }
    }
    
    // MARK:- Helpers
    
    
    // MARK:- Selectors
    
}
