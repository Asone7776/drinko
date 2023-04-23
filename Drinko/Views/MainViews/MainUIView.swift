//
//  MainUIView.swift
//  Drinko
//
//  Created by Arthur Obichkin on 24/04/23.
//

import UIKit

final class MainUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MainUIView{
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
}
