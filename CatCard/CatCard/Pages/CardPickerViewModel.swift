//
//  CardPickerViewModel.swift
//  CatCard
//
//  Created by TORI on 2023/10/05.
//

import UIKit

protocol CardPickerViewModelProtocol {
    var didTapFirstActionButton: (() -> Void)? { get }
    var didTapSecondActionButton: (() -> Void)? { get }
    var didTapThirdActionButton: (() -> Void)? { get }
    var onUserCardItems: (([CardItem]) -> Void)? { get set }
    var onAICardItems: (([CardItem]) -> Void)? { get set }
    
    func prepareGame()
}

final class CardPickerViewModel: CardPickerViewModelProtocol {
    private var gameManager = GameManager()
    private var selectedCards: [ResourceType: Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0]
    
    var didTapFirstActionButton: (() -> Void)?
    var didTapSecondActionButton: (() -> Void)?
    var didTapThirdActionButton: (() -> Void)?
    
    var onUserCardItems: (([CardItem]) -> Void)?
    var onAICardItems: (([CardItem]) -> Void)?
    
    init() {
        didTapFirstActionButton = {}
        didTapSecondActionButton = {}
        didTapThirdActionButton = {}
    }
    
    //게임 준비
    func prepareGame() {
        gameManager.prepareGame()
        print(gameManager.user.resourceCards)
        let items = gameManager.user.toCardItems()
        
        onUserCardItems?(items)
    }
    
    //섞기 버튼
    func tappedMixButton() {
        gameManager.mixResourceCards(.user, cards: selectedCards)
        reactComputer()
    }
    
    //제출 버튼
    func tappedAdoptCatButton() {
        if selectedCards.allSatisfy({ $0.value >= 1 }) {
            //5장으로 고양이를 입양하시겠습니까?
        } else if let loveCard = selectedCards[.love], loveCard >= 10 {
            //10장으로 고양이를 입양하시겠습니까?
        } else {
            //잘못된 선택입니다 알럿
        }
    }
    
    func userAdoptCat() {
        gameManager.changeCatCard(.user)
        
        if gameManager.isBiteByTiger() {
            //게임 오버 알럿
        } else {
            //고양이 입양 완료 알럿
            checkTimingForFinish()
            reactComputer()
        }
    }
    
    //컴퓨터 기본 로직
    func reactComputer() {
        if gameManager.computer.canChangeCatCards() {
            gameManager.changeCatCard(.computer)
            checkTimingForFinish()
        } else {
            gameManager.mixResourceCards(.computer, cards: gameManager.computer.randomCardsForChange())
        }
    }
    
    //남은 카드 확인 후 게임 종료 로직
    func checkTimingForFinish() {
        let lastCards = gameManager.checkResourceCardDummy()
        if lastCards <= 10 {
            let winner = gameManager.countScore()
            //우승자 선언 알럿
        }
    }
    
    //게임 다시 시작
    func resetCardGame() {
        gameManager.resetGame()
    }
}
