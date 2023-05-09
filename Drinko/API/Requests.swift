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
    static let shared = Requests()
    
    public func getCategories(_ completion:@escaping (DataResponse<CategoryModel,AFError>)->Void){
        AF.request("\(baseUrl)/list.php?c=list").validate().responseDecodable(of: CategoryModel.self, completionHandler: completion)
    }
    
    public func getGlasses(_ completion:@escaping (DataResponse<GlassModel,AFError>)->Void){
        AF.request("\(baseUrl)/list.php?g=list").validate().responseDecodable(of: GlassModel.self, completionHandler: completion)
    }
}
