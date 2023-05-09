//
//  SettingsOptions.swift
//  Drinko
//
//  Created by Arthur Obichkin on 09/05/23.
//

import UIKit

enum SettingsOptions: CaseIterable{
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewCode
    var title:String{
        switch self {
        case .rateApp:
            return "Rate us"
        case .contactUs:
            return "Contact us"
        case .terms:
            return "Terms of use"
        case .privacy:
            return "Privacy policy"
        case .apiReference:
            return "Api reference"
        case .viewCode:
            return"Github"
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane.fill")
        case .terms:
            return UIImage(systemName: "doc.fill")
        case .privacy:
            return UIImage(systemName: "lock.fill")
        case .apiReference:
            return UIImage(systemName: "list.clipboard.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
    var iconContainerColor:UIColor{
        switch self {
        case .rateApp:
            return .systemBlue
        case .contactUs:
            return .systemRed
        case .terms:
            return .systemYellow
        case .privacy:
            return .systemPink
        case .apiReference:
            return .systemPurple
        case .viewCode:
            return .systemCyan
        }
    }
    var url: URL?{
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://iosacademy.io/contact/")
        case .terms:
            return URL(string: "https://iosacademy.io/terms/")
        case .privacy:
            return URL(string: "https://iosacademy.io/privacy/")
        case .apiReference:
            return URL(string: "https://www.thecocktaildb.com/")
        case .viewCode:
            return URL(string: "https://github.com/Asone7776/drinko")
        }
    }
}
