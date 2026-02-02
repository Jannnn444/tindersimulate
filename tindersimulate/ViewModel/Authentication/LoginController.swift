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
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.layer.cornerRadius = 5
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.layer.cornerRadius = 5
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        return tf
    }()
    
    
    // MARK: - Lifecyele
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
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
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingRight: 32)
        UIStackView(backgroundColor: UIColor.blue) // color automatically add new stack?
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
