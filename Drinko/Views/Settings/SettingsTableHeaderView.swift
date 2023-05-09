//
//  SettingsTableHeaderView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 09/05/23.
//

import UIKit

final class SettingsTableHeaderView: UIView {
    
    static let heightForHeader: CGFloat = 150
    private var logOutHandler:(()->Void)?
    let emailLabel:UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins", size: 16)
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setImage(UIImage(systemName: "iphone.and.arrow.forward"), for: .normal)
        button.addTarget(self, action: #selector(didPressedLogout), for: .touchUpInside)
//        button.setBackgroundColor(Constants.Colors.darkBlue, for: .normal)
//        button.setBackgroundColor(Constants.Colors.gray, for: .disabled)
        return button
        
    }()
    
    
    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(systemName: "person.circle")
        imageView.image = image
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.backgroundColor = .systemBackground
        stack.distribution = .fillEqually
        return stack
    }()
    
    init(email: String) {
        super.init(frame: .zero)
        emailLabel.text = email
        style()
        layout()
    }
    
    public func registerForLogout(_ block: @escaping () -> Void){
        self.logOutHandler = block
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: Actions
extension SettingsTableHeaderView{
    @objc private func didPressedLogout(){
        logOutHandler?();
    }
}

extension SettingsTableHeaderView{
    private func style(){
        
    }
    private func layout(){
        stackView.addArrangedSubview(avatar)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(logoutButton)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
        ])
    }
}
