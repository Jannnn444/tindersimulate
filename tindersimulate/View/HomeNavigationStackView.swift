//
//  HomeNavigationStackView.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/23.
//

import UIKit

class HomeNavigationStackView:UIStackView {
    // MARK: - Properties
    
    let settingsButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let tinderIcon = UIImageView(image: UIImage(named: "app_icon"))
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [settingsButton, UIView(),tinderIcon, UIView(),messageButton].forEach { view in
            addArrangedSubview(view)
        }
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        tinderIcon.contentMode = .scaleAspectFit
        tinderIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tinderIcon.heightAnchor.constraint(equalToConstant: 40),
            tinderIcon.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
