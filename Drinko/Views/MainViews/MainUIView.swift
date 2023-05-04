//
//  MainUIView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 24/04/23.
//

import UIKit

final class MainUIView: UIView {
    private let viewModel = MainUIViewViewModel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout {sectionIndex,_ in
            return self.viewModel.createSections(sectionIndex)
        }
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = viewModel
        view.delegate = viewModel
        view.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        view.register(MixesCollectionViewCell.self, forCellWithReuseIdentifier: MixesCollectionViewCell.identifier)
        view.register(MainCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainCollectionViewHeader.identifier)
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
        addSubview(collectionView);
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
}
