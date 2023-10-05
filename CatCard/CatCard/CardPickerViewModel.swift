//
//  CardPickerViewModel.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

protocol CardPickerViewModelProtocol {
    var onCardItems: (([CardItem]) -> Void)? { get }
}

final class CardPickerViewModel: CardPickerViewModelProtocol {
    
    var onCardItems: (([CardItem]) -> Void)?
}
