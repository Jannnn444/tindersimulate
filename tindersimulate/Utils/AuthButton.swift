//
//  AuthButton.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/2/2.
//

import UIKit

class AuthButton: UIButton {
    
    init(title: String, type: ButtonType) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        backgroundColor = .systemPink
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


