//
//  HomeController.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/23.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - Properties
    
    private let topStack = HomeNavigationStackView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .blue
        view.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topStack.heightAnchor.constraint(equalToConstant: 80)
            // Dont anchor the bottom when we want the view at the top
        ])
    }
}
