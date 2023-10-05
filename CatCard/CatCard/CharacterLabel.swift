//
//  CharacterLabel.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CharacterLabel: UILabel {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureStyle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureRoundedCorner()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: .init(top: 8, left: 8, bottom: 8, right: 8)))
    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        
    }
    
    private func configureRoundedCorner() {
        
    }
}
