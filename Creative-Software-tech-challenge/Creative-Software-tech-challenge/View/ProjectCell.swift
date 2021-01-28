//
//  createProjectCell.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    // MARK:- Properties
    public var viewModel: ProjectVM? {
        didSet {
            configure()
        }
    }
    
    // MARK:- View components
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    public let cover = UIView()
    private let createButton = UIImageView()
    
    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray2.cgColor
        cover.isHidden = true
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        cover.isHidden = false
        imageView.image = nil
        imageView.backgroundColor = .white
        titleLabel.text = ""
        dateLabel.text = ""
    }
    
    // MARK:- Configures
    private func configure() {
        imageView.image = viewModel?.project?.thumbNail
        imageView.backgroundColor = viewModel?.project?.color
        titleLabel.text = viewModel?.project?.title == nil ? "Untitled" : viewModel?.project?.title
        dateLabel.text = viewModel?.dateText(of: viewModel?.project?.date)
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(117 * ratio)
        }
        
        addSubview(titleLabel)
        titleLabel.font = .notoReg(size: 14 * ratio)
        titleLabel.textColor = .black2
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        addSubview(dateLabel)
        dateLabel.textAlignment = .right
        dateLabel.font = .notoBold(size: 14 * ratio)
        dateLabel.textColor = .orange
        dateLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        addSubview(cover)
        cover.backgroundColor = .white
        cover.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

        cover.addSubview(createButton)
        createButton.image = UIImage(named: "plusCircle")
        createButton.snp.makeConstraints { make in
            make.width.height.equalTo(60 * ratio)
            make.center.equalToSuperview()
        }
    }
}
