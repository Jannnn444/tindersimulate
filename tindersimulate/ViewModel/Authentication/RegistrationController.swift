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
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let fullNameTextField = CustomTextField(placeholder: "Fullname")
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecureField: true)
    
    private let authButton: AuthButton = {
        let button = AuthButton(title: "Sign Up", type: .system)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        selectPhotoButton.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        authButton.addTarget(self, action: #selector(handleRegisterUser), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func handleSelectPhoto() {
        print("DEBUG: Handle select photo here...")
    }
    
    @objc func handleRegisterUser() {
        print("DEBUG: Handle select register here")
    }
    
    // MARK: - Helpers
    func configureUI() {
        configureGradientLayerRed()
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.setDimensions(height: 275, width: 275)
        selectPhotoButton.centerX(inView: view)
        selectPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, fullNameTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: selectPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(authButton)
        authButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    }
}
