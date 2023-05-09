//
//  SettingsCellViewViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 09/05/23.
//

import UIKit

struct SettingsCellViewViewModel{
    let type: SettingsOptions
    
    init(type:SettingsOptions){
        self.type = type
    }
    
    var title:String{
        type.title
    }
    
    var icon:UIImage?{
        type.iconImage
    }
    
    var color:UIColor{
        type.iconContainerColor
    }
    var url:URL?{
        type.url
    }
}
