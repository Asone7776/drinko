//
//  MainViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 21/05/23.
//

import UIKit

final class TabsViewController: UITabBarController {
    let mainVC = MainPageViewController()
    let settingsVC = SettingsViewController()
    let favoritesVC = FavoritesViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setupViewControllers()
        setupTabBarAppearance()
    }
    
    private func setupViewControllers(){
        viewControllers = [
            UINavigationController(rootViewController: mainVC),
            UINavigationController(rootViewController: favoritesVC),
            UINavigationController(rootViewController: settingsVC),
        ]
    }
    
    private func style(){
        mainVC.setTabBarImage(imageName: "house", title: "Home", tag: 0)
        favoritesVC.setTabBarImage(imageName: "heart", title: "Favorites", tag: 1)
        settingsVC.setTabBarImage(imageName: "gear", title: "Settings", tag: 2)
    }
}
