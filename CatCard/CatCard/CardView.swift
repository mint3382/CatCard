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
        view.image = UIImage(systemName: "cluod.fill")
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
        guard let named = item.imageString else {
            iconImageView.image = UIImage(systemName: "cloud.fill")?
                .withTintColor(item.borderColor, renderingMode: .alwaysOriginal)
            return
        }
        iconImageView.image = UIImage(named: named)
        layer.borderColor = item.borderColor.cgColor
        backgroundColor = item.backgroundColor
    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        backgroundColor = .systemPink
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
            iconImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
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
            self.transform = .init(translationX: 0, y: -10)
        }
    }
    
    private func zoomOutCard() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
}
