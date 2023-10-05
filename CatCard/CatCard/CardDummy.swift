//
//  CardDummy.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct User: Player {
    var resourceCards: [ResourceType : Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0]
    var catCards: [CatSpecies : Int] = [.cat: 0, .tiger: 0]
}

struct Computer: Player {
    var resourceCards: [ResourceType : Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0]
    var catCards: [CatSpecies : Int] = [.cat: 0, .tiger: 0]
}


final class CardDummy {
    var catDummy: [CatSpecies: Int] = [.cat: 16, .tiger: 1]
    var resourceDummy: [ResourceType: Int] = [.love: 70, .food: 50, .toy: 40, .time: 30, .money: 10]
    
    func distributeStartCards(player: inout Player) {
        for _ in 1...12 {
            randomResource(player: &player)
        }
    }
    
    func randomResource(player: inout Player) {
        guard let pick = resourceDummy.randomElement() else {
            return
        }
        
        resourceDummy[pick.key] = pick.value - 1
        player.addResourceCard(resourceType: pick.key)
        
    }
    
    func changeResourceToCatCard(player: inout Player) {
        guard let pick = catDummy.randomElement() else {
            return
        }
        
        catDummy[pick.key] = pick.value - 1
        player.addRandomCatSpeciesCard(catSpecies: pick.key)
    }
    
    func exchangeResourceCard(player: inout Player, cards: [ResourceType: Int]) {
        var allCount: Int = 0
        for (resourceType, count) in cards {
            guard let pick = resourceDummy[resourceType] else {
                return
            }
            resourceDummy[resourceType] = pick + count
            allCount += count
        }
        
        for _ in 1...allCount {
            randomResource(player: &player)
        }
    }
}
