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
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.text = "빡빡이"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let turnStateLabel: UILabel = {
        let label = UILabel()
        label.text = "차례"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isEnabled = false
        return label
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [charaterImageView,
                                                  characterNameLabel,
                                                  turnStateLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
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
        
    }
}

