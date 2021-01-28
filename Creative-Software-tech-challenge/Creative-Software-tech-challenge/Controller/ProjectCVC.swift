//
//  ProjectCVC.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

protocol ProjectCVCDelegate: class {
    func cellTapped(index: Int, viewModel: ProjectVM)
}

class ProjectCVC: UICollectionViewController {
    // MARK:- Properties
    private let reuseIdentifier = "projectCell"
    public weak var delegate: ProjectCVCDelegate?
    public var projects = [Project]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK:- Lifecycles
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .vertical
        myLayout.minimumLineSpacing = 24
        super.init(collectionViewLayout: myLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK:- Configures
    private func configure() {
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(ProjectCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK:- UICollectionViewDelegate
extension ProjectCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 163 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProjectCell
        else { return UICollectionViewCell() }

        if indexPath.row == projects.count {
            let viewModel = ProjectVM(project: nil)
            cell.viewModel = viewModel
            cell.cover.isHidden = false
        } else {
            let viewModel = ProjectVM(project: projects[indexPath.row])
            cell.viewModel = viewModel
            cell.cover.isHidden = true
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = delegate,
              let cell = collectionView.cellForItem(at: indexPath) as? ProjectCell,
              var viewModel = cell.viewModel
        else { return }
        if indexPath.row != projects.count {
            viewModel.project = projects[indexPath.row]
        }
        delegate.cellTapped(index: indexPath.row, viewModel: viewModel)
    }
}
