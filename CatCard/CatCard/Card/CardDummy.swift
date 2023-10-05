//
//  CardDummy.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

final class CardDummy {
    var catDummy: [CatSpecies: Int] = [.cat: 16, .tiger: 2]
    var resourceDummy: [ResourceType: Int] = [.love: 70, .food: 50, .toy: 40, .time: 30, .money: 10]
    
    //시작할때 12장 랜덤 카드 배부
    func distributeStartCards(player: inout Player) {
        for _ in 1...12 {
            randomResource(player: &player)
        }
    }
    
    //랜덤한 카드 뽑기
    func randomResource(player: inout Player) {
        guard let pick = resourceDummy.randomElement() else {
            return
        }
        
        if pick.value != 0 {
            resourceDummy[pick.key] = pick.value - 1
            player.addResourceCard(resourceType: pick.key)
        } else {
            randomResource(player: &player)
        }
    }
    
    //랜덤한 고양이 카드 1장 뽑기
    func randomCatCard(player: inout Player) {
        guard let pick = catDummy.randomElement() else {
            return
        }
        
        if pick.value != 0 {
            catDummy[pick.key] = pick.value - 1
            player.addCatCard(catSpecies: pick.key)
        } else {
            randomCatCard(player: &player)
        }
    }
    
    //자원카드 교환하기
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
    
    //호랑이 카드 개수 확인
    func CountingTigerCard() -> Int {
        guard let tigerCard = catDummy[.tiger] else {
            return 0
        }
        
        return tigerCard
    }
}
