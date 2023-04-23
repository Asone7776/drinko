//
//  SignInViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 15/04/23.
//

import UIKit


final class SignInViewController: UIViewController {
    
    let signInView = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.mainColor
        title = "Sign in"
        signInView.delegate = self
        layout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signInView.makeFocusOnEmail()
    }
}

extension SignInViewController{
    private func layout(){
        view.addSubview(signInView)
        NSLayoutConstraint.activate([
            signInView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            signInView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            signInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension SignInViewController:SignInViewDelegate{
    func didSignInWithError(_ error: String) {
        AlertManager.createErrorAlert(title: "Error", message: error) {[weak self] alert in
            guard let self = self else{
                return
            }
            DispatchQueue.main.async {
                self.present(alert,animated: true);
            }
        }
    }
    
    func didSignInWithSuccess() {
        NotificationCenter.default.post(name: .goToMain, object: nil);
    }
}
