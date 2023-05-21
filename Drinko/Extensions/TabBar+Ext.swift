//
//  TabBar+Ext.swift
//  Drinko
//
//  Created by Arthur Obichkin on 21/05/23.
//

import UIKit

extension UITabBarController{
    func setupTabBarAppearance(){
        let appearance = UITabBarAppearance();
        appearance.shadowColor = .clear
        tabBar.standardAppearance = appearance;
        tabBar.scrollEdgeAppearance = appearance
        tabBar.isTranslucent = false;
        tabBar.backgroundColor = Constants.Colors.mainColor
        tabBar.tintColor = Constants.Colors.secondaryColor
    }
}
