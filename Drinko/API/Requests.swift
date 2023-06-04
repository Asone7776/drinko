//
//  Requests.swift
//  Drinko
//
//  Created by Arthur Obichkin on 06/05/23.
//

import Foundation
import Alamofire
final class Requests {
    private let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1"
    static let imagesUrl = "https://www.thecocktaildb.com/images/ingredients"
    static let shared = Requests()
    private func getRequestParameterByType(type:ItemType) -> String {
        type == .category ? "c" : "i";
    }
    
    public func getCategories(_ completion:@escaping (DataResponse<CategoryModel,AFError>)->Void){
        AF.request("\(baseUrl)/list.php?c=list").validate().responseDecodable(of: CategoryModel.self, completionHandler: completion)
    }
    
    public func getGlasses(_ completion:@escaping (DataResponse<GlassModel,AFError>)->Void){
        AF.request("\(baseUrl)/list.php?g=list").validate().responseDecodable(of: GlassModel.self, completionHandler: completion)
    }
    public func getIngredients(_ completion:@escaping (DataResponse<IngredientsModel,AFError>)->Void){
        AF.request("\(baseUrl)/list.php?i=list").validate().responseDecodable(of: IngredientsModel.self, completionHandler: completion)
    }
    
    public func searchCocktailsByName(with searchItem: String,_ completion:@escaping (DataResponse<CocktailModel,AFError>)->Void){
        AF.request("\(baseUrl)/search.php?s=\(searchItem)").validate().responseDecodable(of: CocktailModel.self, completionHandler: completion)
    }
    
    public func getCocktailsByCategoryName(with categoryName: String,type:ItemType,_ completion:@escaping (DataResponse<ShortCocktailModel,AFError>)->Void){
        AF.request("\(baseUrl)/filter.php?\(getRequestParameterByType(type: type))=\(categoryName)").validate().responseDecodable(of: ShortCocktailModel.self, completionHandler: completion)
    }
}
