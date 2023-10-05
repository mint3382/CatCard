//
//  CardPickerView.swift
//  CatCard
//
//  Created by TORI on 2023/10/06.
//

import UIKit

final class CardPickerView: UIView {
    
    private lazy var actionButtonStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private lazy var cardStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
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
