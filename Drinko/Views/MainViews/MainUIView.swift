//
//  MainUIView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 24/04/23.
//

import UIKit
protocol MainUIViewDelegate: AnyObject{
    func didSelectItem(name:String,type:ItemType)
}

final class MainUIView: UIView {
    weak var delegate:MainUIViewDelegate?
    private let viewModel = MainUIViewViewModel()
    let activityIndicator:UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.delegate = self
        activityIndicator.startAnimating()
        viewModel.getSectionsData()
        style()
        layout()
    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout {sectionIndex,_ in
            return self.viewModel.createSections(sectionIndex)
        }
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.dataSource = viewModel
        view.delegate = viewModel
        view.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        view.register(IngredientsCollectionViewCell.self, forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifier)
        view.register(MainCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainCollectionViewHeader.identifier)
        view.isHidden = true
        view.alpha = 0
        return view
    }();
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MainUIView{
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubviews(collectionView,activityIndicator);
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension MainUIView:MainUIViewViewModelDelegate{
    func didSelectItem(with name: String,type:ItemType) {
        delegate?.didSelectItem(name: name,type: type)
    }
    
    func didLoadInitialData() {
        collectionView.reloadData()
        activityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.3) {
            self.collectionView.isHidden = false
            self.collectionView.alpha = 1.0
        }
    }
}
