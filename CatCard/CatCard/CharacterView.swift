//
//  CharacterView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CharacterView: UIView {
    
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

