//
//  CardPickerViewModel.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

protocol CardPickerViewModelProtocol {
    var onUserCardItems: (([CardItem]) -> Void)? { get set }
    var onAICardItems: (([CardItem]) -> Void)? { get set }
}

final class CardPickerViewModel: CardPickerViewModelProtocol {
    
    var onUserCardItems: (([CardItem]) -> Void)?
    var onAICardItems: (([CardItem]) -> Void)?
}
