//
//  FilterByCategoryViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 21/05/23.
//

import UIKit

final class FilterByCategoryViewController: UIViewController {
    let filterView = FilterByCategoryView()
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    init(with categoryName:String,type: ItemType){
        super.init(nibName: nil, bundle: nil)
        filterView.configure(with: categoryName,type: type)
        filterView.delegate = self
        title = categoryName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterByCategoryViewController{
    private func style(){
        view.backgroundColor = .systemBackground
    }
    private func layout(){
        view.addSubview(filterView)
        NSLayoutConstraint.activate([
            filterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            filterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FilterByCategoryViewController:FilterByCategoryViewDelegate{
    func didError(error: String) {
        AlertManager.createErrorAlert(title: "Error", message: error) { [weak self] alert in
            guard let self = self else{
                return
            }
            self.present(alert,animated: true)
        }
    }
}
