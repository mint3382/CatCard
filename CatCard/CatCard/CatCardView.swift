//
//  CatCardView.swift
//  CatCard
//
//  Created by TORI on 2023/10/06.
//

import UIKit

final class CatCardView: UIView {
    
    private let hiddenCardView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let openCardView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout() {
        addSubview(hiddenCardView)
        addSubview(openCardView)
        
        NSLayoutConstraint.activate([
            hiddenCardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            hiddenCardView.heightAnchor.constraint(equalTo: heightAnchor),
            hiddenCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hiddenCardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            openCardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            openCardView.heightAnchor.constraint(equalTo: heightAnchor),
            openCardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            openCardView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
