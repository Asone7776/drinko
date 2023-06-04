//
//  SettingsViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 09/05/23.
//

import UIKit
import StoreKit
import SafariServices
import FirebaseAuth

final class SettingsViewController: UIViewController {
    let settingsView = SettingsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        settingsView.delegate = self
        style()
        layout()
    }
}
extension SettingsViewController{
    private func style(){
        view.backgroundColor = .systemBackground
        navigationController?.styleAppearance()
    }

    private func layout(){
        view.addSubview(settingsView)
        NSLayoutConstraint.activate([
            settingsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            settingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            settingsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension SettingsViewController:SettingsViewDelegate{
    func didSelectLogout() {
        AlertManager.createConfirmAlert(title: "Exit", message: "Are you sure for logout?") {
            NotificationCenter.default.post(name: .logout, object: nil);
        } _: { alert in
            self.present(alert,animated: true)
        }
    }
    
    func didSelectUrl(url: URL) {
        let vc = SFSafariViewController(url: url);
        present(vc,animated: true);
    }
    
    func didSelectRate() {
        if let windowScene = view.window?.windowScene{
            SKStoreReviewController.requestReview(in: windowScene);
        }
    }
}
