//
//  ProfileRightBarItemView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 23/04/23.
//

import UIKit
import FirebaseAuth

final class ProfileRightBarItemView: UIView {
    
    private let user = Auth.auth().currentUser
    
    init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ProfileRightBarItemView{
    
    private func style() {
        layer.cornerRadius = self.frame.height / 2
        backgroundColor = .systemRed
    }
}
