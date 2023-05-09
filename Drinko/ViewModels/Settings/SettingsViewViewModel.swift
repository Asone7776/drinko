//
//  SettingsViewViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 09/05/23.
//

import UIKit

class SettingsViewViewModel:NSObject{
    let cells:[SettingsCellViewViewModel]
    init(cells: [SettingsCellViewViewModel]) {
        self.cells = cells
    }
}
extension SettingsViewViewModel: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else{
            fatalError("No such cell")
        }
        let item = cells[indexPath.row]
        cell.configure(title: item.title, image: item.icon, color: item.color)
        return cell
    }
}
