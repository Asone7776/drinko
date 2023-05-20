//
//  SearchResultViewController.swift
//  Drinko
//
//  Created by Arthur Obichkin on 20/05/23.
//

import UIKit

final class SearchResultViewController: UIViewController {
    
    public var searchResultText: String?{
        didSet{
            guard let text = searchResultText else{
                return
            }
            searchView.configure(with: text)
        }
    }
    private let searchView = MainSearchView()
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
extension SearchResultViewController{
    private func style(){
        view.backgroundColor = .systemBackground
    }
    private func layout(){
        view.addSubview(searchView)
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
