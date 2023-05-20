//
//  SearchViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 20/05/23.
//

import UIKit

protocol SearchViewModelDelegate: AnyObject {
    func didLoadResults()
}

final class SearchViewModel: NSObject {
    weak var delegate: SearchViewModelDelegate?
    private var searchResult: CocktailModel?{
        didSet{
            self.delegate?.didLoadResults()
        }
    }
    var searchText: String?{
        didSet{
            getCocktails()
        }
    }
    private func getCocktails(){
        guard let text = searchText else{
            return
        }
        Requests.shared.searchCocktailsByName(with: text) { response in
            switch response.result{
            case.success(let cocktails):
                DispatchQueue.main.async {
                    self.searchResult = cocktails
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override init() {
        super.init()
    }
    
}
extension SearchViewModel:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let drinksCount = searchResult?.drinks{
            return drinksCount.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier) as? SearchResultTableViewCell else{
            return UITableViewCell()
        }
        let model = searchResult?.drinks
        if let results = model{
            cell.configure(with: results[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        2
    }
}
