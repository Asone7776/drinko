//
//  InitialAuthView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 15/04/23.
//

import UIKit
import Lottie

protocol InitialAuthViewDelegate: AnyObject{
    func didSelectSignIn()
    func didSelectRegistration()
}

final class InitialAuthView: UIView {
    weak var delegate: InitialAuthViewDelegate?
    private let animationView = LottieAnimationView(name: "drink")
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "default-bg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let drinkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Become an expert in Drinks!"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Freestyle Script", size: 70)
        label.textColor = Constants.Colors.secondaryColor
        return label
    }()

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var loginButton: DefaultUIButton = {
        let button = DefaultUIButton()
        button.setTitle("Sign in", for: .normal)
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        button.setBackgroundColor(Constants.Colors.darkBlue, for: .normal)
        button.addTarget(self, action: #selector(didPressedSignIn), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var registerButton: DefaultUIButton = {
        let button = DefaultUIButton()
        button.setTitle("Register", for: .normal)
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.setBackgroundColor(Constants.Colors.darkBlue, for: .normal)
        button.addTarget(self, action: #selector(didPressedRegistration), for: .touchUpInside)
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

//MARK: Actions

extension InitialAuthView{
    @objc private func didPressedSignIn(){
        delegate?.didSelectSignIn()
    }
    @objc private func didPressedRegistration(){
        delegate?.didSelectRegistration()
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
        addSubviews(backgroundImageView,animationView,drinkLabel,stack)
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            animationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: animationView.trailingAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 300),
            drinkLabel.topAnchor.constraint(equalToSystemSpacingBelow: animationView.bottomAnchor, multiplier: 1),
            
            drinkLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: drinkLabel.trailingAnchor, multiplier: 1),
            stack.topAnchor.constraint(equalToSystemSpacingBelow: drinkLabel.bottomAnchor, multiplier: 2),
            
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalTo: stack.bottomAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 56),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
