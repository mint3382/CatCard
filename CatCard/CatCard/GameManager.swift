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
        var player = checkPlayerType(playerType)
        
        for _ in 1...count {
            let card = cardDummy.pickOneRandomResource()
            guard let count = cardDummy.resourceDummy[card] else {
                return
            }
            
            cardDummy.resourceDummy[card] = count - 1
            player.addResourceCard(resourceType: card)
        }
    }
    
    //고양이 카드 전달하기(더미 -> 플레이어)
    mutating private func playerGetCatCard(_ playerType: PlayerType) {
        var player = checkPlayerType(playerType)
        let card = cardDummy.randomCatCard()
        guard let count = cardDummy.catDummy[card] else {
            return
        }
        
        cardDummy.catDummy[card] = count - 1
        
        player.addCatCard(catSpecies: card)
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
        var player = checkPlayerType(playerType)
        
        if player.resourceCards.allSatisfy({ $0.value >= 1 }) {
            player.removeResourceCard(cards: [.love: 1, .food: 1, .toy: 1, .time: 1, .money: 1])
            playerGetResourceCard(playerType, count: 5)
        } else if let loveCards = player.resourceCards[.love], loveCards >= 10 {
            player.removeResourceCard(cards: [.love: 10])
            playerGetResourceCard(playerType, count: 10)
        }
        
        playerGetCatCard(playerType)
    }
    
    //플레이어 타입에 따라 전환하기
    func checkPlayerType(_ playerType: PlayerType) -> Player {
        switch playerType {
        case .user:
            return user
        case .computer:
            return computer
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
