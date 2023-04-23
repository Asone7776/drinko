//
//  RegistrationViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 16/04/23.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    private let registrationView = RegistrationUIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.mainColor
        title = "Registration"
        registrationView.delegate = self
        layout()
    }
    override func viewDidAppear(_ animated: Bool) {
        registrationView.makeFocusOnEmail()
    }
}
extension RegistrationViewController{
    private func layout(){
        view.addSubview(registrationView)
        NSLayoutConstraint.activate([
            registrationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registrationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            registrationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registrationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension RegistrationViewController:RegistrationUIViewDelegate{
    func didRegisterWithError(_ error: String) {
        AlertManager.createErrorAlert(title: "Error", message: error) {[weak self] alert in
            guard let self = self else{
                return
            }
            DispatchQueue.main.async {
                self.present(alert,animated: true);
            }
        }
    }
    
    func didRegisterWithSuccess() {
        NotificationCenter.default.post(name: .goToMain, object: nil);
    }
}
