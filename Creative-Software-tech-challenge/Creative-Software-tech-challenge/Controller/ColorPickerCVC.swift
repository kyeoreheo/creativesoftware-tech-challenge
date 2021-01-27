//
//  ColorPickerCVC.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

protocol ColorPickerCVCDelegate: class {
    func cellTapped(index: Int)
}

class ColorPickerCVC: UICollectionViewController {
    private let reuseIdentifier = "colorCell"
    private let colors: [UIColor]
    public weak var delegate: ColorPickerCVCDelegate?
        
    init(colors: [UIColor]) {
        self.colors = colors
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .horizontal
        myLayout.minimumLineSpacing = 22 * ratio
        super.init(collectionViewLayout: myLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func deselectAll() {
        collectionView.indexPathsForSelectedItems?.forEach {
            if let cell = collectionView.cellForItem(at: $0) as? ColorCell {
                cell.isSelected(false)
            }
        }
    }
}

extension ColorPickerCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30 * ratio, height: 30 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ColorCell
        else { return UICollectionViewCell() }
        cell.setCircle(color: colors[indexPath.row], size: 30 * ratio)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorCell {
            cell.isSelected(true)
        }
        delegate.cellTapped(index: indexPath.row)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorCell {
            cell.isSelected(false)
        }
    }
}
