//
//  SingleCocktailModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 03/06/23.
//

import Foundation

struct ShortCocktailModel:Codable{
    let drinks: [ShortCocktail]?
}

struct ShortCocktail:Codable{
    let strDrink:String
    let strDrinkThumb:String?
    let idDrink:String
    var drinkUrl:URL?{
        guard let strDrinkThumb = strDrinkThumb else{
            return nil
        }
        return URL(string: strDrinkThumb)
    }
}
