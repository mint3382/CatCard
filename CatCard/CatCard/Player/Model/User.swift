//
//  User.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct User: Player {
    var playerType: PlayerType = .user
    var resourceCards: [ResourceType : Int]
    var catCards: [CatSpecies : Int]
    
    init(resourceCards: [ResourceType : Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0], catCards: [CatSpecies : Int] = [.cat: 0, .tiger: 0]) {
        self.resourceCards = resourceCards
        self.catCards = catCards
    }
    
    func toCardItems() -> [CardItem] {
        let resourcePack = resourceCards.filter { $0.value != 0 }
        var cardPack: [CardItem] = []
        
        let _: [()] = resourcePack.map { (resource, count) in
            for _ in 1...count {
                let card = CardItem(resourceType: resource)
                
                cardPack.append(card)
            }
        }
        
        print(resourceCards)
        return cardPack
    }
}
