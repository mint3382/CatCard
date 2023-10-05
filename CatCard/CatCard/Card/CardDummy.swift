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
    
//    //랜덤 카드 여러장 뽑기
//    func pickRandomResources(count: Int) {
//        for _ in 1...count {
//            pickOneRandomResource()
//        }
//    }
    
    //랜덤한 카드 1장 뽑기
    func pickOneRandomResource() -> ResourceType {
        if let pick = resourceDummy.randomElement(),
           pick.value != 0 {
            return pick.key
        } else {
            return pickOneRandomResource()
        }
    }
    
    //랜덤한 고양이 카드 1장 뽑기
    func randomCatCard() -> CatSpecies {
        if let pick = catDummy.randomElement(),
           pick.value != 0 {
            return pick.key
        } else {
            return randomCatCard()
        }
    }
    
    //자원카드 교환하기
    func exchangeResourceCard(cards: [ResourceType: Int]) -> Int {
        var allCount: Int = 0
        for (resourceType, count) in cards {
            if let pick = resourceDummy[resourceType] {
                resourceDummy[resourceType] = pick + count
                allCount += count
            }
        }
        
        return allCount
    }
    
    //호랑이 카드 개수 확인
    func CountingTigerCard() -> Int {
        guard let tigerCard = catDummy[.tiger] else {
            return 0
        }
        
        return tigerCard
    }
}
