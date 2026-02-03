//
//  LoginController.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/30.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "app_icon")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white
        return iv
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecureField: true)
    private let authButton: AuthButton = {
        let button = AuthButton(title: "Log In", type: .system)
        return button
    }()
    private let goToRegistrationButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?", attributes: [.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 16)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()

    // MARK: - Lifecyele
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        authButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        goToRegistrationButton.addTarget(self, action: #selector(handleShowRegistration), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func handleLogin() {
        
    }
    
    @objc func handleShowRegistration() {
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayerAtLoginPage()
        
        view.addSubview(iconImageView)
        iconImageView.centerX(inView: view)
        iconImageView.setDimensions(height: 100, width: 100)
        iconImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,authButton
                                                  ])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(goToRegistrationButton)
        goToRegistrationButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    }
    
    func configureGradientLayerAtLoginPage() {
        let topColor = UIColor.orange
        let bottomColor = UIColor.systemPink
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0,1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.frame
    }

}
