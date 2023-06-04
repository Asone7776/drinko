//
//  FavoritesViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 21/05/23.
//

import UIKit

final class FavoritesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        style()
    }
}

extension FavoritesViewController {
    private func style(){
        view.backgroundColor = .systemBackground
        navigationController?.styleAppearance()
    }
}
