//
//  InitialAuthViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 15/04/23.
//

import UIKit

final class InitialAuthViewController: UIViewController {
    private let initialView = InitialAuthView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        initialView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = Constants.Colors.darkBlue
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

extension InitialAuthViewController{
    private func layout(){
        view.addSubview(initialView)
        NSLayoutConstraint.activate([
            initialView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            initialView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: initialView.bottomAnchor, multiplier: 1),
            initialView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension InitialAuthViewController:InitialAuthViewDelegate{
    func didSelectSignIn() {
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    func didSelectRegistration() {
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
}
