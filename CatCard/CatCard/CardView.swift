//
//  CardView.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

final class CardView: UIView {
    
    // MARK: - Views
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "cloud.fill")
        view.image?.withRenderingMode(.alwaysOriginal)
        return view
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView,
                                                  numberLabel])
        stack.axis = .vertical
        stack.alignment = .fill
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
    
    func configureCard(with item: CardItem) {
        iconImageView.image = UIImage(named: item.imageString)
        iconImageView.tintColor = item.color
        numberLabel.textColor = item.color
        layer.borderColor = item.color.cgColor
    }
    
    // MARK: - Configure View
    
    private func configureStyle() {
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    // MARK: - Constraints
    
    private func setupLayout() {
        addSubview(contentStack)
    }
}
