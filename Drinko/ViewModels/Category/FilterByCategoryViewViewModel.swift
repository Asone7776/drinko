//
//  FilterByCategoryViewViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 22/05/23.
//

import UIKit

protocol FilterByCategoryViewViewModelDelegate: AnyObject{
    func didLoadWithSuccess()
    func didLoadWithError(error:String)
}


final class FilterByCategoryViewViewModel: NSObject {
    var cocktails:ShortCocktailModel?{
        didSet{
            self.delegate?.didLoadWithSuccess()
        }
    }
    weak var delegate:FilterByCategoryViewViewModelDelegate?
    var searchParams:(categoryName:String,type:ItemType)?{
        didSet{
            guard var categoryName = searchParams?.0,let type = searchParams?.1 else{
             return
            }
            categoryName = categoryName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            getCocktailsByCategoryName(name: categoryName, type: type)
        }
    }
    
    private func getCocktailsByCategoryName(name:String,type:ItemType){
        Requests.shared.getCocktailsByCategoryName(with: name,type: type) { response in
            switch response.result{
            case .success(let cocktailsModel):
                DispatchQueue.main.async {
                    self.cocktails = cocktailsModel
                }
            case .failure(let error):
                self.delegate?.didLoadWithError(error: error.localizedDescription)
            }
        }
    }
}

extension FilterByCategoryViewViewModel:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cocktails = cocktails?.drinks else{
            return 0
        }
        return cocktails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCollectionViewCell.identifier, for: indexPath) as? CocktailCollectionViewCell else{
            return UICollectionViewCell()
        }
        if let cocktail = cocktails?.drinks{
            cell.configure(with: cocktail[indexPath.row])
        }
        return cell
    }
}
