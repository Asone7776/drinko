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
        title = "Sign in or Register"
        setup()
        layout()
    }
}

extension InitialAuthViewController{
    private func setup(){
        view.backgroundColor = Constants.Colors.mainColor
        navigationController?.navigationBar.isHidden = true
    }
    private func layout(){
        view.addSubview(initialView)
        NSLayoutConstraint.activate([
            initialView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            initialView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            initialView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 1),
            initialView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
