//
//  PlayerProtocol.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

protocol Player {
    var resourceCards: [ResourceType: Int] { get set }
    var catCards: [CatSpecies: Int] { get set }
}

extension Player {
    //자원 카드 추가
    mutating func addResourceCard(resourceType: ResourceType) {
        guard let card = resourceCards[resourceType] else {
            return
        }
        
        resourceCards[resourceType] = card + 1
    }
    
    //자원 카드 제거
    mutating func removeResourceCard(cards: [ResourceType: Int]) {
        for (resourceType, count) in cards {
            guard let pick = resourceCards[resourceType] else {
                return
            }
            resourceCards[resourceType] = pick - count
        }
    }
    
    //고양이 카드 추가
    mutating func addCatCard(catSpecies: CatSpecies) {
        guard let card = catCards[catSpecies] else {
            return
        }
        
        catCards[catSpecies] = card + 1
    }
    
    //고양이 입양이 가능한지 확인
    mutating func canChangeCatCards() -> Bool {
        if resourceCards.allSatisfy({ $0.value >= 1 }) {
            return true
        } else if let loveCards = resourceCards[.love], loveCards >= 10 {
            return true
        } else {
            return false
        }
    }
}
