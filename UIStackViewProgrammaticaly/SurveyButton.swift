//
//  SurveyButton.swift
//  UIStackViewProgrammaticaly
//
//  Created by Felipe Vieira Lima on 01/12/22.
//

import UIKit

class SurveyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemPink
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 28)
        layer.cornerRadius = 10
    }
    
}
