//
//  ResourceCard.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import UIKit

enum ResourceType: CaseIterable {
    case love
    case food
    case toy
    case time
    case money
    
    var image: UIImage? {
        switch self {
        case .love: return UIImage(named: "love")
        case .food: return UIImage(named: "food")
        case .toy: return UIImage(named: "toy")
        case .time: return UIImage(named: "time")
        case .money: return UIImage(named: "money")
        }
    }
}
