//
//  MixesCollectionViewCell.swift
//  Drinko
//
//  Created by Arthur Obichkin on 05/05/23.
//

import UIKit
import Kingfisher

final class IngredientsCollectionViewCell: UICollectionViewCell {
    private var model: SingleIngredient?{
        didSet{
            label.text = model?.strIngredient1
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: model?.bigImageUrl)
        }
    }
    static let identifier = "IngredientsCollectionViewCell"
    let stack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        return stack
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
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
        super.prepareForReuse()
        label.text = nil
        imageView.image = nil
    }
    public func configure(with viewModel: SingleIngredient){
        model = viewModel
    }
}
extension IngredientsCollectionViewCell{
    private func style(){
        backgroundColor = Constants.Colors.secondaryColor
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    private func layout(){
        addSubview(stack)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1)
        ])
    }
}
