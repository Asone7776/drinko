//
//  DefaultUIButton.swift
//  Drinko
//
//  Created by Arthur Obichkin on 21/04/23.
//

import UIKit

final class DefaultUIButton: UIButton {
    
    enum ButtonState{
        case normal
        case disabled
    }
    
    private var disabledBackgroundColor: UIColor?
    private var defaultBackgroundColor: UIColor? {
        didSet {
            backgroundColor = defaultBackgroundColor
        }
    }
    
    override var isEnabled: Bool{
        didSet{
            if isEnabled{
                if let color = defaultBackgroundColor{
                    backgroundColor = color
                }
            }else{
                if let color = disabledBackgroundColor{
                    backgroundColor = color
                }
            }
        }
    }
    
 
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DefaultUIButton{
    
    private func style(){
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont(name: "Poppins", size: 16)
        layer.cornerRadius = 25
        
        if #available(iOS 15, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.baseForegroundColor = .white
            configuration.imagePadding = 15
            configuration.imagePlacement = .trailing
            self.configuration = configuration
        } else {
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        }
    }
    
    func setBackgroundColor(_ color: UIColor?, for state: ButtonState) {
        switch state {
        case .disabled:
            disabledBackgroundColor = color
        case .normal:
            defaultBackgroundColor = color
        }
    }
}
