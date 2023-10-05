//
//  CharacterView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CharacterView: UIView {
    
    // MARK: - Views
    
    private let charaterImageView: CharacterImageView = {
        let view = CharacterImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let turnStateLabel: CharacterLabel = {
        let label = CharacterLabel()
        label.text = "Turn"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterNameLabel: CharacterLabel = {
        let label = CharacterLabel()
        label.text = "빡빡빡빡빡이"
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // MARK: - Constraints
    
    private func setupLayout() {
        _ = [charaterImageView, turnStateLabel, characterNameLabel].map {
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            charaterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            charaterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            charaterImageView.widthAnchor.constraint(equalTo: widthAnchor),
            charaterImageView.heightAnchor.constraint(equalTo: charaterImageView.widthAnchor),
            
            turnStateLabel.centerXAnchor.constraint(equalTo: charaterImageView.centerXAnchor),
            turnStateLabel.bottomAnchor.constraint(equalTo: charaterImageView.topAnchor, constant: 8),
            turnStateLabel.widthAnchor.constraint(equalTo: charaterImageView.widthAnchor, multiplier: 0.6),
            turnStateLabel.heightAnchor.constraint(equalTo: turnStateLabel.widthAnchor, multiplier: 0.4),
            
            characterNameLabel.centerXAnchor.constraint(equalTo: charaterImageView.centerXAnchor),
            characterNameLabel.topAnchor.constraint(equalTo: charaterImageView.bottomAnchor, constant: -16),
            characterNameLabel.widthAnchor.constraint(equalTo: charaterImageView.widthAnchor, multiplier: 0.8),
            characterNameLabel.heightAnchor.constraint(equalTo: characterNameLabel.widthAnchor, multiplier: 0.3),
        ])
    }
}

