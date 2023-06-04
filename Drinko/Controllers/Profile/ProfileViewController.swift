//
//  ProfileViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 03/06/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    let profileView = ProfileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        style()
    }
    
}
extension ProfileViewController{
    private func style(){
        view.backgroundColor = .systemBackground
    }
    private func layout(){
        view.addSubview(profileView)
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
