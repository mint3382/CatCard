//
//  GameManager.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct GameManager {
    private let cardDummy = CardDummy()
    private var user: Player = User()
    private var computer: Player = Computer()
    
    mutating func prepareGame() {
        cardDummy.distributeStartCards(player: &user)
        cardDummy.distributeStartCards(player: &computer)
    }
    
    func notifyNoDummy() {
        var allCount: Int = 0
        
        for (_, count) in cardDummy.resourceDummy {
            allCount += count
        }
        
        if allCount == 0 {
            countScore()
        }
    }
    
    func countScore() {
        //알럿 띄우기 (승, 패)
    }
}
