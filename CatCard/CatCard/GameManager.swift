//
//  GameManager.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct GameManager {
    let cardDummy = CardDummy()
    var user: Player = User()
    var computer: Player = Computer()
    
    //게임 준비(카드 각각 12장씩 배부)
    mutating func prepareGame() {
        cardDummy.distributeStartCards(player: &user)
        cardDummy.distributeStartCards(player: &computer)
    }
    
    //카드 개수 확인
    func checkResourceCardDummy() -> Int {
        var allCount: Int = 0
        
        for (_, count) in cardDummy.resourceDummy {
            allCount += count
        }
        
        return allCount
    }
    
    //점수 계산
    func checkWinnerCount() -> (userScore: Int, computerScore: Int) {
        var userScore: Int = 0
        var computerScore: Int = 0
        if let userCatCount = user.catCards[.cat],
              let userLoveCount = user.resourceCards[.love],
              let computerCatCount = computer.catCards[.cat],
              let computerLoveCount = computer.resourceCards[.love] {
            userScore = userCatCount + userLoveCount
            computerScore = computerCatCount + computerLoveCount
        }
        
        return (userScore, computerScore)
    }
    
    //고양이 입양 방법
    mutating func changeCatCard(player: inout Player) {
        if player.resourceCards.allSatisfy({ $0.value >= 1 }) {
            player.removeResourceCard(cards: [.love: 1, .food: 1, .toy: 1, .time: 1, .money: 1])
            cardDummy.randomResource(player: &player)
        } else if let loveCards = player.resourceCards[.love], loveCards >= 10 {
            player.removeResourceCard(cards: [.love: 10])
            
        }
    }
    
    //호랑이인지 확인
    func isBiteByTiger() -> Bool {
        if cardDummy.CountingTigerCard() < 2 {
            return true
        } else {
            return false
        }
    }
    
    //승리자 확인
    func countScore() -> Player {
        if checkWinnerCount().userScore > checkWinnerCount().computerScore {
            return user
        } else {
            return computer
        }
    }
}
