//
//  CardActionButton.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CardActionButton: UIButton {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    // MARK: - Configure View
    
    private func configureButton() {
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        backgroundColor = .systemGreen
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 0.1
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .init(width: 4.0, height: 4.0)
    }
}
