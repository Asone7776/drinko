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
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        onboardingVC.delegate = self
        window = UIWindow(windowScene: scene)
        window?.rootViewController = selectInitialViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        registerForNotification()
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
    
    func registerForNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(didGoToMain), name: .goToMain, object: nil);
    }
    
    func selectInitialViewController() -> UIViewController{
        let user = Auth.auth().currentUser
        if user != nil {
            return UINavigationController(rootViewController: MainViewController());
        } else {
            return LocalState.hasOnboarded ? rootViewController : onboardingVC
        }
    }
}
extension SceneDelegate:OnboardingViewControllerDelegate {
    func proceedFromOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(rootViewController);
    }
}
//MARK: Actions for notifications
extension SceneDelegate {
    @objc func didLogout() {
//        let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//
//        } catch let signOutError as NSError {
//          print("Error signing out: %@", signOutError)
//        }
        setRootViewController(rootViewController);
    }
    @objc func didGoToMain() {
        setRootViewController(UINavigationController(rootViewController: MainViewController()));
    }
}
