//
//  OnboardingViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit
protocol OnboardingViewControllerDelegate:AnyObject{
    func proceedFromOnboarding()
}
final class OnboardingViewController: UIViewController {
    private let onboardingView = OnboardingView();
    
    weak var delegate:OnboardingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        style()
        onboardingView.delegate = self
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

extension OnboardingViewController: OnboardingViewDelegate{
    func didTappedGetStarted() {
        delegate?.proceedFromOnboarding()
    }
}
 
