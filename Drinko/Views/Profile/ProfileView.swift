//
//  ProfileView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 03/06/23.
//

import UIKit

final class ProfileView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProfileView{
    private func style(){
        backgroundColor = Constants.Colors.categoryColor
    }
    private func layout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
}
