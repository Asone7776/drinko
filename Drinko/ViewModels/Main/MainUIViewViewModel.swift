//
//  MainUIViewViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 04/05/23.
//

import UIKit


protocol MainUIViewViewModelDelegate: AnyObject{
        func didLoadInitialData()
}

final class MainUIViewViewModel:NSObject {
    weak var delegate: MainUIViewViewModelDelegate?
    override init() {
        super.init()
    }
    
    enum SectionType {
        case categories(viewModel:CategoryModel)
        case ingredients(viewModel:IngredientsModel)
    }
    
    public func getSectionsData(){
        let group = DispatchGroup();
        var categories:CategoryModel?
        var ingredients:IngredientsModel?
        group.enter()
        Requests.shared.getCategories { response in
            defer{
                group.leave()
            }
            switch response.result{
            case .success(let categoriesData):
                categories = categoriesData
            case .failure(let error):
                print(error)
            }
        }
        group.enter()
        Requests.shared.getIngredients { response in
            defer{
                group.leave()
            }
            switch response.result{
            case .success(let ingredientsData):
                ingredients = ingredientsData
            case .failure(let error):
                print(error)
            }
        }
        group.notify(queue: .main){
            guard let categories = categories,let ingredients = ingredients else{
                return
            }

            self.sections = [
                .categories(viewModel: categories),
                .ingredients(viewModel: ingredients)
            ]
            self.delegate?.didLoadInitialData()
        }
    }
    
    public var sections = [SectionType]()
    
    public func createSections(_ sectionIndex: Int) -> NSCollectionLayoutSection{
        switch sections[sectionIndex]{
        case .categories:
            return createCategoriesSection()
        case .ingredients:
            return createIngredientsSection()
        }
    }
    
    private func createCategoriesSection() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(1.0))
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 8);
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(40.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func createIngredientsSection() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(1.0))
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 8);
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.8)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(40.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
}
extension MainUIViewViewModel:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainCollectionViewHeader.identifier, for: indexPath) as! MainCollectionViewHeader
            switch sections[indexPath.section]{
            case .categories:
                sectionHeader.headerTitle.text = "Categories"
            case .ingredients:
                sectionHeader.headerTitle.text = "Ingredients"
            }
            return sectionHeader
        } else {
            return UICollectionReusableView()
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .categories(let categories):
            return categories.drinks.count
        case .ingredients(let ingredients):
            return ingredients.drinks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section{
        case .categories(let categories):
            let category = categories.drinks[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else{
                fatalError("No CategoriesCollectionViewCell cell")
            }
            cell.configure(with: category.strCategory)
            return cell
        case .ingredients(let ingredients):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.identifier, for: indexPath) as? IngredientsCollectionViewCell else{
                fatalError("No IngredientsCollectionViewCell cell")
            }
            let ingredient = ingredients.drinks[indexPath.row]
            cell.configure(with: ingredient)
            return cell
        }
    }
}
