//
//  CharacterView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CharacterView: UIView {
    
    // MARK: - Views
    
    private let charaterImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.fill")
        return view
    }()
    
    private let turnStateLabel: UILabel = {
        let label = UILabel()
        label.text = "차례"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isEnabled = false
        return label
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.text = "빡빡이"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [turnStateLabel,
                                                   charaterImageView,
                                                   characterNameLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = -8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureStyle()
    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            contentStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
}

