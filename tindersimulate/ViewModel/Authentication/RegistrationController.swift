//
//  RegistrationController.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/30.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    private let selectPhotoButton: UIButton = {
    let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(named: "plus_photo")?.withRenderingMode(.alwaysTemplate), for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        selectPhotoButton.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func handleSelectPhoto() {
        print("DEBUG: Handle select photo here...")
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .systemPurple
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.setDimensions(height: 275, width: 275)
        selectPhotoButton.centerX(inView: view)
        selectPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
    }
}
