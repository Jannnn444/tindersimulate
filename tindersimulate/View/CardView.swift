//
//  CardView.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/1/27.
//

import UIKit

enum SwipeDirection: Int {
    case left = -1
    case right = 1
}

class CardView: UIView {
    // MARK: - Properties
    private let gradientLayer = CAGradientLayer()
    
    private let viewModel: CardViewModel
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "jane1")
        return iv
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.attributedText = viewModel.userInfoText
        return label
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "info_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        configureGestureRecognizers()
        
        imageView.image = viewModel.user.images.compactMap { $0 }.first
        print("DEBUG: Did init...")
        
        backgroundColor = .systemPurple
        layer.cornerRadius = 12
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        configureGradientLayer()
        
        addSubview(infoLabel)
        infoLabel.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
        addSubview(infoButton)
        infoButton.setDimensions(height: 40, width: 40)
        infoButton.centerY(inView: infoLabel)
        infoButton.anchor(right: rightAnchor, paddingRight: 16)
        
    }
    
    override func layoutSubviews() {
        print("DEBUG: Did layout subview")
        gradientLayer.frame = self.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        
        switch sender.state {
        case .possible:
            print("DEBUG: Pan did possible")
        case .began:
            print("DEBUG: Pan did begin")
            superview?.subviews.forEach({ $0.layer.removeAllAnimations() })
        case .changed:
            print("DEBUG: Pan did changed")
            panCard(sender: sender)
            
            print("DEBUG: Translate X is \(translation.x)")
            print("DEBUG: Translate Y is \(translation.y)")
        case .ended:
            print("DEBUG: Pan did ended")
            resetCardPosition(sender: sender)
        case .cancelled:
            print("DEBUG: Pan did cancelled")
        case .failed:
            print("DEBUG: Pan did failed")
        case .recognized:
            print("DEBUG: Pan did recognized")
        @unknown default:
            print("DEBUG: Pan unknow default")
        }
    }
    
    @objc func handleChangePhoto(sender: UITapGestureRecognizer) {
        print("DEBUG: Did tap on photo")
        let location = sender.location(in: nil).x
        let shouldShowNextPhoto = location > self.frame.width / 2
        
        if shouldShowNextPhoto {
            viewModel.showNextPhoto()
        } else {
            viewModel.showPreviousPhoto()
        }
        
        imageView.image = viewModel.imageToShow 
        
        print("DEBUG: Location is \(location)")
        print("DEBUG: Threshold value is \(self.frame.width / 2)")
        print("DEBUG: Should show next photo is \(shouldShowNextPhoto)")
    }
    
    // MARK: - Helpers
    func panCard(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let rotationalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    func resetCardPosition(sender: UIPanGestureRecognizer) {
        let direction: SwipeDirection = sender.translation(in: nil).x > 100 ? .right : .left
        let shouldDismissCard = abs(sender.translation(in: nil).x) > 100
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut,animations: {
            
            if shouldDismissCard {
                let xTranslation = CGFloat(direction.rawValue) * 1000
                let offScreenTransform = self.transform.translatedBy(x: xTranslation, y: 0)
                self.transform = offScreenTransform
            } else {
                self.transform = .identity
            }
        }) { _ in
            if shouldDismissCard {
                self.removeFromSuperview()
            }
        }
    }
    
    func completeSwipe(direction: SwipeDirection) {
        let translationX: CGFloat = CGFloat(direction.rawValue) * 700
        
        UIView.animate(withDuration: 0.5) {
            self.transform = self.transform.translatedBy(x: translationX, y: 0)
        } completion: { _ in
            self.removeFromSuperview()
            print("DEBUG: Card dismissed - \(direction == .right ? "LIKE" : "NOPE")")
        }
    }
    
    func configureGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = self.frame
    }
    
    func configureGestureRecognizers() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleChangePhoto))
        addGestureRecognizer(tap)
    }
}


