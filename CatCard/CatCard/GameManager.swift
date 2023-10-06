//
//  GameManager.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct GameManager {
    var cardDummy = CardDummy()
    var user: User = User()
    var computer: Computer = Computer()
    
    //게임 준비(카드 각각 12장씩 배부)
    mutating func prepareGame() {
        playerGetResourceCard(.user, count: 12)
        playerGetResourceCard(.computer, count: 12)
    }
    
    //자원 카드 교환하기(플레이어 -> 더미, 더미 -> 플레이어)
    mutating func mixResourceCards(_ playerType: PlayerType, cards: [ResourceType: Int]) {
        let count = cardDummy.exchangeResourceCard(cards: cards)
        playerGetResourceCard(playerType, count: count)
    }
    
    //자원 카드 전달하기(더미 -> 플레이어)
    mutating private func playerGetResourceCard(_ playerType: PlayerType, count: Int) {
        switch playerType {
        case .user:
            for _ in 1...count {
                let card = cardDummy.pickOneRandomResource()
                
                cardDummy.removeResourceCard(resourceType: card)
                user.addResourceCard(resourceType: card)
            }
        case .computer:
            for _ in 1...count {
                let card = cardDummy.pickOneRandomResource()
                
                cardDummy.removeResourceCard(resourceType: card)
                computer.addResourceCard(resourceType: card)
            }
        }
    }
    
    //고양이 카드 전달하기(더미 -> 플레이어)
    mutating private func playerGetCatCard(_ playerType: PlayerType) {
        let card = cardDummy.randomCatCard()
        guard let count = cardDummy.catDummy[card] else {
            return
        }
        
        cardDummy.catDummy[card] = count - 1
        
        switch playerType {
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
    mutating func changeCatCard(_ playerType: PlayerType) {
        switch playerType {
        case .user:
            if user.resourceCards.allSatisfy({ $0.value >= 1 }) {
                user.removeResourceCard(cards: [.love: 1, .food: 1, .toy: 1, .time: 1, .money: 1])
                playerGetResourceCard(playerType, count: 5)
            } else if let loveCards = user.resourceCards[.love], loveCards >= 10 {
                user.removeResourceCard(cards: [.love: 10])
                playerGetResourceCard(playerType, count: 10)
            }
        case .computer:
            if computer.resourceCards.allSatisfy({ $0.value >= 1 }) {
                computer.removeResourceCard(cards: [.love: 1, .food: 1, .toy: 1, .time: 1, .money: 1])
                playerGetResourceCard(playerType, count: 5)
            } else if let loveCards = computer.resourceCards[.love], loveCards >= 10 {
                computer.removeResourceCard(cards: [.love: 10])
                playerGetResourceCard(playerType, count: 10)
            }
        }
        
        playerGetCatCard(playerType)
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
    func countScore() -> PlayerType {
        if checkWinnerCount().userScore > checkWinnerCount().computerScore {
            return .user
        } else {
            return .computer
        }
    }
    
    mutating func resetGame() {
        cardDummy = CardDummy()
        user = User()
        computer = Computer()
        
        prepareGame()
    }
}
