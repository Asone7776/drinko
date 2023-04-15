//
//  SignInView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 15/04/23.
//

import UIKit

final class SignInView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SignInView{
    private func style(){
        backgroundColor = .red
    }
    private func layout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
}
