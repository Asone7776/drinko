//
//  RegistrationUIView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 23/04/23.
//

import UIKit

protocol RegistrationUIViewDelegate: AnyObject{
    func didRegisterWithError(_ error: String)
    func didRegisterWithSuccess()
}

final class RegistrationUIView: UIView {
    
    let viewModel = RegistrationViewViewModel();
    weak var delegate: RegistrationUIViewDelegate?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Please enter your credentials"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.placeholder = "Your email"
        textField.delegate = viewModel
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.placeholder = "Your password"
        textField.delegate = viewModel
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var submitButton: DefaultUIButton = {
        let button = DefaultUIButton()
        button.setTitle("Register", for: .normal)
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.addTarget(self, action: #selector(didPressedRegister), for: .touchUpInside)
        button.setBackgroundColor(Constants.Colors.darkBlue, for: .normal)
        button.setBackgroundColor(Constants.Colors.gray, for: .disabled)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Actions
extension RegistrationUIView{
    @objc private func didPressedRegister(){
        viewModel.registerUser(email: emailTextField.text, password: passwordTextField.text){[weak self] result in
            guard let self = self else{
                return
            }
            switch result {
            case .success(_):
                self.delegate?.didRegisterWithSuccess()
            case .failure(let failure):
                self.delegate?.didRegisterWithError(failure.localizedDescription)
            }
        }
    }
}


extension RegistrationUIView{

    public func makeFocusOnEmail(){
        emailTextField.becomeFirstResponder()
    }
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(submitButton)
        addSubviews(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            submitButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
