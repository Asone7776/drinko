//
//  IngredientsModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/05/23.
//

import Foundation


struct IngredientsModel: Codable{
    let drinks: [SingleIngredient]
}

struct SingleIngredient:Codable{
    let strIngredient1:String
    
    var smallImageUrl:URL?{
        guard let str = "\(Requests.imagesUrl)/\(strIngredient1)-Small.png".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return nil
        }
        return URL(string: str)
    }
    
    var mediumImageUrl:URL?{
        guard let str = "\(Requests.imagesUrl)/\(strIngredient1)-Medium.png".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return nil
        }
        return URL(string:str)
    }
    
    var bigImageUrl:URL?{
        guard let str = "\(Requests.imagesUrl)/\(strIngredient1).png".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return nil
        }
        return URL(string: str)
    }
}
