//
//  CardView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CardView: UIView {
    
    // MARK: - Views
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "cloud.fill")
        view.image?.withRenderingMode(.alwaysOriginal)
        return view
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView,
                                                  numberLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureStyle()
        setupLayout()
    }
    
    func configureCard(with item: CardItem) {
        iconImageView.image = UIImage(named: item.imageString)
        iconImageView.tintColor = item.color
        numberLabel.textColor = item.color
        layer.borderColor = item.color.cgColor
        backgroundColor = item.color.withAlphaComponent(0.5)
    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        backgroundColor = .systemPink.withAlphaComponent(0.5)
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemPink.cgColor
    }
    
    // MARK: - Constraints
    
    private func setupLayout() {
        addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            contentStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
}
