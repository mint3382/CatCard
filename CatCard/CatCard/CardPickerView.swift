//
//  CardPickerView.swift
//  CatCard
//
//  Created by TORI on 2023/10/06.
//

import UIKit

final class CardPickerView: UIView {
    
    private var onCardItems: (([CardItem]) -> Void)?
    
    private let firstActionButton: CardActionButton = {
        let button = CardActionButton()
        button.setTitle("FIRST", for: .normal)
        return button
    }()
    
    private let secondActionButton: CardActionButton = {
        let button = CardActionButton()
        button.setTitle("SECOND", for: .normal)
        return button
    }()
    
    private let thirdActionButton: CardActionButton = {
        let button = CardActionButton()
        button.setTitle("THIRD", for: .normal)
        return button
    }()
    
    private lazy var actionButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstActionButton,
                                                  secondActionButton,
                                                  thirdActionButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    private lazy var cardStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [actionButtonStack,
                                                  cardStack])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBindings()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBindings()
        setupLayout()
    }
    
    private func setupBindings() {
        onCardItems = { items in
            _ = items.map { CardView(item: $0) }
                .map { self.contentStack.addArrangedSubview($0) }
        }
    }
    
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
