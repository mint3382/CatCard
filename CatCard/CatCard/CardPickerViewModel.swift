//
//  CardPickerViewModel.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

protocol CardPickerViewModelProtocol {
    var onUserCardItems: (([CardItem]) -> Void)? { get }
    var onAICardItems: (([CardItem]) -> Void)? { get }
}

final class CardPickerViewModel: CardPickerViewModelProtocol {
    
    var onUserCardItems: (([CardItem]) -> Void)?
    var onAICardItems: (([CardItem]) -> Void)?
}
