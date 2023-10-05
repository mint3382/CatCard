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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let turnStateLabel: UILabel = {
        let label = UILabel()
        label.text = "Turn"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.text = "빡빡이"
        label.font = .systemFont(ofSize: 16, weight: .bold)
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
            
            characterNameLabel.centerXAnchor.constraint(equalTo: charaterImageView.centerXAnchor),
            characterNameLabel.topAnchor.constraint(equalTo: charaterImageView.bottomAnchor, constant: -8)
        ])
    }
}

