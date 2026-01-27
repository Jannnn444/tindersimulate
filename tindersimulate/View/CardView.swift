//
//  CardView.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/27.
//

import UIKit

class CardView: UIView {
    // MARK: - Properties
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "jane1")
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
        layer.cornerRadius = 12
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
