//
//  CardView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CardView: UIView {
    
    // MARK: - Properties
    
    private var isSelected: Bool = false {
        didSet {
            isSelected ? zoomInCard() : zoomOutCard()
        }
    }
    
    // MARK: - Views
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
        configureGesture()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureStyle()
        configureGesture()
        setupLayout()
    }
    
    convenience init(item: CardItem) {
        self.init(frame: .zero)
        guard let image = item.resourceType.image else {
            return
        }
        iconImageView.image = image

    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureGesture() {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(tapAnimation))
        addGestureRecognizer(gesture)
    }
    
    // MARK: - Constraints
    
    private func setupLayout() {
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
    }
}

extension CardView {
    
    // MARK: - Actions
    
    @objc private func tapAnimation() {
        isSelected.toggle()
    }
    
    private func zoomInCard() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .init(translationX: 0, y: -40)
        }
    }
    
    private func zoomOutCard() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
}
