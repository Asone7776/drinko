//
//  SettingsView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 09/05/23.
//

import UIKit

protocol SettingsViewDelegate:AnyObject {
    func didSelectUrl(url:URL)
    func didSelectRate()
}


final class SettingsView: UIView {
    let viewModel:SettingsViewViewModel
    weak var delegate:SettingsViewDelegate?
    override init(frame: CGRect) {
        viewModel = SettingsViewViewModel(cells: SettingsOptions.allCases.map({ option in
            return .init(type: option)
        }))
        super.init(frame: frame)
        style()
        layout()
    }
    
    lazy var table:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain);
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = viewModel
        tableView.rowHeight = SettingsTableViewCell.rowHeight
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView{
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
        addSubview(table)
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: leadingAnchor),
            table.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalTo: table.trailingAnchor),
            bottomAnchor.constraint(equalTo: table.bottomAnchor)
        ])
    }
}
extension SettingsView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = viewModel.cells[indexPath.row]
        if selectedItem.type == .rateApp{
            delegate?.didSelectRate()
        }else{
            guard let url = selectedItem.url else {
                return
            }
            delegate?.didSelectUrl(url: url)
        }
    }
}
