//
//  CharacterImageView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CharacterImageView: UIImageView {
    
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
        configureRoundedImage()
    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        image = UIImage(systemName: "person.fill")
    }
    
    private func configureRoundedImage() {
        clipsToBounds = true
        layer.cornerRadius = bounds.width / 2
        layer.borderWidth = 4
        layer.borderColor = UIColor.systemYellow.cgColor
    }
}
