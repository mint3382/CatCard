//
//  GameManager.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct GameManager {
    let cardDummy = CardDummy()
    var user: User = User()
    var computer: Computer = Computer()
    
    //게임 준비(카드 각각 12장씩 배부)
    mutating func prepareGame() {
        playerGetResourceCard(player: .user, count: 12)
        playerGetResourceCard(player: .computer, count: 12)
    }
    
    //자원 카드 교환하기(플레이어 -> 더미, 더미 -> 플레이어)
    mutating func mixResourceCards(player: PlayerType, cards: [ResourceType: Int]) {
        let count = cardDummy.exchangeResourceCard(cards: cards)
        playerGetResourceCard(player: player, count: count)
    }
    
    //자원 카드 전달하기(더미 -> 플레이어)
    mutating private func playerGetResourceCard(player: PlayerType, count: Int) {
        for _ in 1...count {
            let card = cardDummy.pickOneRandomResource()
            
            switch player {
            case .user:
                user.addResourceCard(resourceType: card)
            case .computer:
                computer.addResourceCard(resourceType: card)
            }
        }
    }
    
    //고양이 카드 전달하기(더미 -> 플레이어)
    mutating private func playerGetCatCard(player: PlayerType) {
        let card = cardDummy.randomCatCard()
        
        switch player {
        case .user:
            user.addCatCard(catSpecies: card)
        case .computer:
            computer.addCatCard(catSpecies: card)
        }
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
    private func checkWinnerCount() -> (userScore: Int, computerScore: Int) {
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
    
    //고양이 입양 방법 (자원 카드 내고, 자원 카드 받고)
    mutating func changeCatCard(player: PlayerType) {
        switch player {
        case .user:
            if user.resourceCards.allSatisfy({ $0.value >= 1 }) {
                user.removeResourceCard(cards: [.love: 1, .food: 1, .toy: 1, .time: 1, .money: 1])
                playerGetResourceCard(player: player, count: 5)
            } else if let loveCards = user.resourceCards[.love], loveCards >= 10 {
                user.removeResourceCard(cards: [.love: 10])
                playerGetResourceCard(player: player, count: 10)
            }
            
            playerGetCatCard(player: .user)
        case .computer:
            if computer.resourceCards.allSatisfy({ $0.value >= 1 }) {
                computer.removeResourceCard(cards: [.love: 1, .food: 1, .toy: 1, .time: 1, .money: 1])
                playerGetResourceCard(player: player, count: 5)
            } else if let loveCards = computer.resourceCards[.love], loveCards >= 10 {
                computer.removeResourceCard(cards: [.love: 10])
                playerGetResourceCard(player: player, count: 10)
            }
            
            playerGetCatCard(player: .computer)
        }
    }
    
    //호랑이인지 확인
    func isBiteByTiger() -> Bool {
        if let tiger = user.catCards[.tiger], tiger > 0 {
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
