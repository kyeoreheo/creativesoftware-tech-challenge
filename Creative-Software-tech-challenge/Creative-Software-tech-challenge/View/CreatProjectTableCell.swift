//
//  CreatProjectTableCell.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//
protocol CreateProjectTableCellDelegate: class {
//    func updateUserInfo(_ cell: SettingsCell, updateWith value: String, section: SettingsSections)
//
//    func updateUserInfo(_ cell: SettingsCell, updateRange sender: UISlider)
}

import UIKit

class CreateProjectTableCell: UITableViewCell {
    // MARK:- Properties
    weak var delegate: CreateProjectTableCellDelegate?
    var viewModel: ProjectVM? {
        didSet { configure() }
    }
//    lazy var inputField = UITextField()
//    let sliderStack = UIStackView()
//    let minAgeLabel = UILabel()
//    let maxAgeLabel = UILabel()
//    lazy var minAgeSlider = createAgeRangeSlider()
//    lazy var maxAgeSlider = createAgeRangeSlider()
    
    // MARK:- Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .blue
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let viewModel = viewModel else { return }
        
    }
    
    // MARK:- Selectors

    
    @objc func textDidChange(sender: UITextField) {
//        guard let value = sender.text,
//              let viewModel = viewModel
//        else { return }
//        delegate?.updateUserInfo(self, updateWith: value, section: viewModel.section)
    }
}
