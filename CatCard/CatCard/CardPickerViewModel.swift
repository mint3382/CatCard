//
//  CardPickerViewModel.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

protocol CardPickerViewModelProtocol {
    var didTapFirstActionButton: (() -> Void)? { get }
    var didTapSecondActionButton: (() -> Void)? { get }
    var didTapThirdActionButton: (() -> Void)? { get }
    var onUserCardItems: (([CardItem]) -> Void)? { get set }
    var onAICardItems: (([CardItem]) -> Void)? { get set }
}

final class CardPickerViewModel: CardPickerViewModelProtocol {
    
    var didTapFirstActionButton: (() -> Void)?
    var didTapSecondActionButton: (() -> Void)?
    var didTapThirdActionButton: (() -> Void)?
    
    var onUserCardItems: (([CardItem]) -> Void)?
    var onAICardItems: (([CardItem]) -> Void)?
    
    init() {
        didTapFirstActionButton = {}
        didTapSecondActionButton = {}
        didTapThirdActionButton = {}
    }
}
