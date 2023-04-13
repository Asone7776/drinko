//
//  OnboardingView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit

final class OnboardingView: UIView {
    
    
    private let imageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let commonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillProportionally
        return stack
    }()
    
    
    private let stackViewForLabels: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
//        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let taglineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "It’s time for a"
        label.font = UIFont(name: "Poppins", size: 34)
        label.textColor = Constants.Colors.darkBlue
        return label
    }()
    
    private let drinkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Drink"
        label.font = UIFont(name: "Freestyle Script", size: 70)
        label.textColor = Constants.Colors.secondaryColor
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The one-stop to find amazing drink mixes for any occassion."
        label.font = UIFont(name: "Raleway", size: 16)
        label.textColor = Constants.Colors.gray
        label.numberOfLines = 0
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Get Started", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.darkBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "arrow-right"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        return button
    }()
    
    private let splashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "splash")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let drinkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "drink")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingView{
    private func layout(){
        stackViewForLabels.addArrangedSubview(taglineLabel)
        stackViewForLabels.addArrangedSubview(drinkLabel)
        stackViewForLabels.addArrangedSubview(descriptionLabel)
        
        imageView.addSubview(startButton)
        
        commonStack.addArrangedSubview(stackViewForLabels)
        commonStack.addArrangedSubview(imageView)
        commonStack.addArrangedSubview(drinkImage)
        
        addSubviews(splashImage,commonStack)
        NSLayoutConstraint.activate([
            commonStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: commonStack.trailingAnchor, multiplier: 3),
            commonStack.topAnchor.constraint(equalTo: topAnchor),
            commonStack.bottomAnchor.constraint(equalTo: bottomAnchor),

            startButton.heightAnchor.constraint(equalToConstant: 56),
            startButton.widthAnchor.constraint(equalToConstant: 180),

            splashImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            splashImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            splashImage.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
    }
}
 
