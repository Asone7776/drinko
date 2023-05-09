//
//  MainViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit

final class MainViewController: UIViewController {
    let profileRightView = ProfileRightBarItemView()
    
    let mainUIView = MainUIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
        setupNavBar()
        profileRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedRightButton)))
        
    }
}

extension MainViewController{
    private func setupNavBar(){
        let imageView = UIImageView()
        let image = UIImage(named: "drinko-logo")
        imageView.image = image
        navigationController?.navigationBar.topItem?.titleView = imageView
        setupLeftBarButton()
        setupRightBarButton()
    }
    
    private func setupLeftBarButton(){
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "menu-icon"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(didTappedLeftButton))
        leftBarItem.tintColor = Constants.Colors.darkBlue
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    private func setupRightBarButton(){
        let rightBarItem = UIBarButtonItem(customView: profileRightView)
        navigationItem.rightBarButtonItem = rightBarItem
    }
    private func layout(){
        view.addSubview(mainUIView)
        NSLayoutConstraint.activate([
            mainUIView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainUIView.trailingAnchor, multiplier: 2),
            mainUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: Actions
extension MainViewController{
    
    @objc func didTappedLeftButton(){
        print("tapped left")
    }
    @objc func didTappedRightButton(){
        profileRightView.showAnimation {
            self.navigationController?.pushViewController(SettingsViewController(), animated: true);
        }
    }
}

