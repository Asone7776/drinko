//
//  HeaderView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 05/05/23.
//

import UIKit
final class MainCollectionViewHeader: UICollectionReusableView {
    static let identifier = "MainCollectionViewHeader";
    
    public var headerTitle = {
        let label = UILabel()
        label.font = UIFont(name: "Raleway SemiBold", size: 18)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        headerTitle.text = nil
    }
}
extension MainCollectionViewHeader{
    private func layout(){
        addSubview(headerTitle)
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
