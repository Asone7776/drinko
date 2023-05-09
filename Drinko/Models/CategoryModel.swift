//
//  CategoryModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 05/05/23.
//

import Foundation


struct CategoryModel:Codable {
    let drinks: [CategorySingle]
}


struct CategorySingle:Codable{
    let strCategory:String
}
