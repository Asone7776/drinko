//
//  UIView+Ext.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit

extension UIView{
    public func addSubviews(_ views:UIView...){
        views.forEach { addSubview($0) }
    }
}
