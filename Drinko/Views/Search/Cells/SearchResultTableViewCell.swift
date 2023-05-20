//
//  SearchResultTableViewCell.swift
//  Drinko
//
//  Created by Arthur Obichkin on 20/05/23.
//

import UIKit
import Kingfisher
final class SearchResultTableViewCell: UITableViewCell {
    
    var model:SingleCocktailModel?{
        didSet{
            guard let model = model else{
                return
            }
            label.text = model.strDrink
            imgView.kf.indicatorType = .activity
            imgView.kf.setImage(with: model.thumbnailUrl)
        }
    }
    static let identifier = "SearchResultTableViewCell"
    static let rowHeight: CGFloat = 80.0
    
    let stack: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
        self.layout()
        self.style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
        label.text = nil
    }
    
    public func configure(with model: SingleCocktailModel){
        self.model = model
    }
}

extension SearchResultTableViewCell{
    private func style(){
//        backgroundColor = .systemCyan
    }
    
    private func layout(){
        stack.addArrangedSubview(imgView)
        stack.addArrangedSubview(label)
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stack.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalTo: stack.bottomAnchor),
//            imgView.heightAnchor.constraint(equalToConstant: 50),
            imgView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
