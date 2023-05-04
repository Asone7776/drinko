//
//  CategoriesCollectionViewCell.swift
//  Drinko
//
//  Created by Arthur Obichkin on 04/05/23.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoriesCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CategoriesCollectionViewCell{
    private func style(){
        backgroundColor = Constants.Colors.categoryColor
    }
    private func layout(){
        
    }
}
