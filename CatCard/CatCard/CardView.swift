//
//  CardView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CardView: UIView {
    
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
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
