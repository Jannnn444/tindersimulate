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
    private let bottomStack = BottomControlStackView()
    
    private let deckView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: - Top Stack
        view.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topStack.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // MARK: - Bottom
        view.addSubview(bottomStack)
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStack.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        // MARK: - Deck View
        view.addSubview(deckView)
        deckView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            deckView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 10),
            deckView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            deckView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            deckView.bottomAnchor.constraint(equalTo: bottomStack.topAnchor, constant: -10)
        ])
    }
}
