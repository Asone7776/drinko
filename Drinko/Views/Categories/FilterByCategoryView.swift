//
//  FilterByCategoryView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 21/05/23.
//

import UIKit

protocol FilterByCategoryViewDelegate: AnyObject{
    func didError(error:String)
}

final class FilterByCategoryView: UIView {
    
    var viewModel = FilterByCategoryViewViewModel()
    weak var delegate:FilterByCategoryViewDelegate?
    
    let loadingIndicator:UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = viewModel
        view.register(CocktailCollectionViewCell.self, forCellWithReuseIdentifier: CocktailCollectionViewCell.identifier)
        view.delegate = self
        view.alpha = 0
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.delegate = self
        loadingIndicator.startAnimating()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with categoryName: String,type: ItemType){
        viewModel.searchParams = (categoryName, type)
    }
}

extension FilterByCategoryView{
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubviews(collection,loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collection.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            collection.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: collection.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalTo: collection.bottomAnchor)
        ])
    }
}
extension FilterByCategoryView: FilterByCategoryViewViewModelDelegate, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func didLoadWithSuccess() {
        collection.reloadData()
        collection.isHidden = false
        loadingIndicator.stopAnimating()
        UIView.animate(withDuration: 0.3) {
            self.collection.alpha = 1
        }
    }
    
    func didLoadWithError(error: String) {
        loadingIndicator.stopAnimating()
        delegate?.didError(error: error)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isIphone = UIDevice.current.userInterfaceIdiom == .phone
        let bounds = collectionView.bounds;
        let width:CGFloat
        if isIphone{
            width = (bounds.width - 16) / 2;
        }else{
            width = (bounds.width - 16) / 5;
        }
        return CGSize(width: width, height: width * 1.5 );
    }
}
