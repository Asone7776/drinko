//
//  GlassModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 07/05/23.
//

import Foundation

struct GlassModel: Codable{
    let drinks:[GlassSingle]
}

struct GlassSingle:Codable{
    let strGlass:String
}
