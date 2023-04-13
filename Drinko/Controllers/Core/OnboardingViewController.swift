//
//  OnboardingViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit

final class OnboardingViewController: UIViewController {
    private let onboardingView = OnboardingView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        style()
    }
    
}

extension OnboardingViewController{
    private func layout(){
        view.addSubview(onboardingView)
        NSLayoutConstraint.activate([
            onboardingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            onboardingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onboardingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            onboardingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func style(){
        view.backgroundColor = Constants.Colors.mainColor
    }
}
 
