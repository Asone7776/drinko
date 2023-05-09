//
//  CategoriesCollectionViewCell.swift
//  Drinko
//
//  Created by Arthur Obichkin on 04/05/23.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoriesCollectionViewCell"
    let label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway SemiBold", size: 14)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        label.text = nil
    }
    public func configure(with text:String){
        label.text = text
    }
}
extension CategoriesCollectionViewCell{
    private func style(){
        backgroundColor = Constants.Colors.categoryColor
    }
    private func layout(){
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: label.bottomAnchor),
        ])
    }
}
