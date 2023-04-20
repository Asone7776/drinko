//
//  SceneDelegate.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let rootViewController = UINavigationController(rootViewController: InitialAuthViewController())
    var onboardingVC = OnboardingViewController()
    var signInVC = SignInViewController()
    
//    onboardingVC
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        onboardingVC.delegate = self
        window = UIWindow(windowScene: scene)
        window?.rootViewController = rootViewController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
    
}


extension SceneDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
extension SceneDelegate:OnboardingViewControllerDelegate {
    func proceedFromOnboarding() {
        setRootViewController(rootViewController);
    }
}

