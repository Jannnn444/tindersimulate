//
//  CardViewModel.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/30.
//

import UIKit

struct CardViewModel {
    
    let user: User
    let userInfoText: NSAttributedString
    
    init(user: User) {
        self.user = user
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: " \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .heavy), .foregroundColor: UIColor.white]))
                              
        self.userInfoText = attributedText
    }
    
    func showNextPhoto() {
        print("TBD - show next photo")
    }
    
    func showPreviousPhoto() {
        print("TBD - show previous photo")
    }
}
