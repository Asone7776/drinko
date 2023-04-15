//
//  InitialAuthView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 15/04/23.
//

import UIKit
import Lottie

final class InitialAuthView: UIView {
    
    private let animationView = LottieAnimationView(name: "drink")

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.darkBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        if #available(iOS 15, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.baseForegroundColor = .white
            configuration.imagePadding = 15
            configuration.imagePlacement = .trailing
            button.configuration = configuration
        } else {
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        }
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.darkBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        if #available(iOS 15, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.baseForegroundColor = .white
            configuration.imagePadding = 15
            configuration.imagePlacement = .trailing
            button.configuration = configuration
        } else {
            button.semanticContentAttribute = .forceRightToLeft
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        }
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnimation()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InitialAuthView{
    private func setupAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        stack.addArrangedSubview(loginButton)
        stack.addArrangedSubview(registerButton)
        addSubviews(animationView,stack)
        NSLayoutConstraint.activate([
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: animationView.trailingAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 300),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1),
            registerButton.heightAnchor.constraint(equalToConstant: 56),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
