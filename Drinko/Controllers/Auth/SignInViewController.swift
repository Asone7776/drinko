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
        view.backgroundColor = .systemBackground
        title = "Sign in"
        layout()
    }
}

extension SignInViewController{
    private func layout(){
        
    }
}
