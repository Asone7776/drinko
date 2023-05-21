//
//  UIView+Ext.swift
//  Drinko
//
//  Created by Arthur Obichkin on 14/04/23.
//

import UIKit


extension UIViewController{
    func setTabBarImage(imageName:String,title:String,tag:Int){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    }
    func setupTitleAndBackground(title:String){
        self.title = title;
        self.view.backgroundColor = .systemBackground;
    }
}

extension UIView{
    public func addSubviews(_ views:UIView...){
        views.forEach { addSubview($0) }
    }

    public func showAnimation(_ completionBlock: @escaping () -> Void) {
      isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}
