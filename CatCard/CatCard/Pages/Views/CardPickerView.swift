//
//  CardPickerView.swift
//  CatCard
//
//  Created by TORI on 2023/10/06.
//

import UIKit

final class CardPickerView: UIView {
    
    var onCardItems: (([CardItem]) -> Void)?
    
    var firstActionButtonTapped: (() -> Void)?
    var secondActionButtonTapped: (() -> Void)?
    var thirdActionButtonTapped: (() -> Void)?
    
    private lazy var firstActionButton: CardActionButton = {
        let button = CardActionButton()
        button.setTitle("FIRST", for: .normal)
        button.addAction(UIAction { _ in
            self.firstActionButtonTapped?()
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var secondActionButton: CardActionButton = {
        let button = CardActionButton()
        button.setTitle("SECOND", for: .normal)
        button.addAction(UIAction { _ in
            self.secondActionButtonTapped?()
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdActionButton: CardActionButton = {
        let button = CardActionButton()
        button.setTitle("THIRD", for: .normal)
        button.addAction(UIAction { _ in
            self.thirdActionButtonTapped?()
        }, for: .touchUpInside)
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
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var cardStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = -16
        stack.translatesAutoresizingMaskIntoConstraints = false
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
                .map { self.cardStack.addArrangedSubview($0) }
        }
    }
    
    private func setupLayout() {
//        addSubview(contentStack)
        addSubview(actionButtonStack)
        addSubview(cardStack)
        
        NSLayoutConstraint.activate([
            actionButtonStack.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            actionButtonStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButtonStack.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            
            cardStack.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            cardStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardStack.topAnchor.constraint(equalTo: actionButtonStack.layoutMarginsGuide.bottomAnchor, constant: 50),
        ])
    }
}
