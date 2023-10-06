//
//  Computer.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct Computer: Player {
    var playerType: PlayerType = .computer
    var resourceCards: [ResourceType : Int]
    var catCards: [CatSpecies : Int]
    
    init(resourceCards: [ResourceType : Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0], catCards: [CatSpecies : Int] = [.cat: 0, .tiger: 0]) {
        self.resourceCards = resourceCards
        self.catCards = catCards
    }
    
    //고양이 입양이 불가능하면 랜덤으로 5장 교환
    func randomCardsForChange() -> [ResourceType: Int] {
        var pickCards: [ResourceType: Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0]
        for _ in 1...5 {
            guard let pick = resourceCards.randomElement(),
                  let oldValue = pickCards[pick.key] else {
                return pickCards
            }
            
            pickCards[pick.key] = pick.value + oldValue
        }
        
        return pickCards
    }
}
