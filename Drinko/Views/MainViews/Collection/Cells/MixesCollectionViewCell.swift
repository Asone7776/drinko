//
//  MixesCollectionViewCell.swift
//  Drinko
//
//  Created by Arthur Obichkin on 05/05/23.
//

import UIKit

final class MixesCollectionViewCell: UICollectionViewCell {
    static let identifier = "MixessCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MixesCollectionViewCell{
    private func style(){
        backgroundColor = Constants.Colors.greenColor
    }
    private func layout(){
        
    }
}
