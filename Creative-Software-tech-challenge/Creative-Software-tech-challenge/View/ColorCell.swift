//
//  ColorCell.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class ColorCell: UICollectionViewCell {
    private let checkImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(checkImage)
        checkImage.isHidden = true
        checkImage.contentMode = .scaleToFill
        checkImage.image = UIImage(named: "selected")
        checkImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(15.7 * ratio)
            make.height.equalTo(12 * ratio)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        isSelected(false)
    }
    
    public func setCircle(color: UIColor, size: CGFloat) {
        layer.cornerRadius = size / 2
        backgroundColor = color
    }
    
    public func isSelected(_ isSelected: Bool = false) {
        layer.borderWidth = 1
        layer.borderColor = isSelected ? UIColor.black.cgColor : UIColor.clear.cgColor
        checkImage.isHidden = !isSelected
    }
}

