//
//  MainSearchView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 20/05/23.
//

import UIKit

final class MainSearchView: UIView {
    let viewModel = SearchViewModel()
    var timer:Timer?
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = viewModel
        table.dataSource = viewModel
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        table.rowHeight = SearchResultTableViewCell.rowHeight
        return table
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = .large
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        activityIndicator.startAnimating()
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with searchText:String){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            self.viewModel.searchText = searchText
        }
    }
}
extension MainSearchView{
    private func layout(){
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView,activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
extension MainSearchView:SearchViewModelDelegate{
    func didLoadResults() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
}
