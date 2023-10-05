//
//  CardActionButton.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CardActionButton: UIButton {
    
    // MARK: - Properties
    
    override var isHighlighted: Bool {
        didSet {
            isHighlighted ? pushState() : pullState()
        }
    }
    
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
    
    // MARK: - Actions
    
    private func pushState() {
        UIView.animate(withDuration: 0.04) {
            self.transform = CGAffineTransform(translationX: 2.0, y: 2.0)
            self.layer.shadowOffset = .init(width: 1.0, height: 0.75)
        }
    }
    private func pullState() {
        UIView.animate(withDuration: 0.04) {
            self.transform = CGAffineTransform.identity
            self.layer.shadowOffset = .init(width: 4.0, height: 4.0)
        }
    }
}
