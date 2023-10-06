//
//  ViewController.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private var viewModel: CardPickerViewModelProtocol!
    
    // MARK: - Initialization
    
    init(viewModel: CardPickerViewModelProtocol = CardPickerViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = CardPickerViewModel()
        super.init(coder: coder)
    }
    
    // MARK: - Views
    
    private let catCardView: CatCardView = {
        let view = CatCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let aiCharacterView: CharacterView = {
        let view = CharacterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cardPickerView: CardPickerView = {
        let view = CardPickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var gameManager = GameManager()
    private var selectedCards: [ResourceType: Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //게임 준비
    func prepareGame() {
        gameManager.prepareGame()
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

// MARK: - Life Cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupLayout()
        
        let items = (1...10).map { CardItem(imageString: nil, number: $0, backgroundColor: .systemPink, borderColor: .black) }
        viewModel.onUserCardItems?(items)
    }
}

// MARK: - Private Methods

extension ViewController {
    
    private func setupBindings() {
        viewModel.onUserCardItems = {
            self.cardPickerView.onCardItems?($0)
        }
        
        cardPickerView.firstActionButtonTapped = {
            self.viewModel.didTapFirstActionButton?()
        }
        
        cardPickerView.secondActionButtonTapped = {
            self.viewModel.didTapSecondActionButton?()
        }
        
        cardPickerView.thirdActionButtonTapped = {
            self.viewModel.didTapThirdActionButton?()
        }
    }
    
    private func setupLayout() {
        view.addSubview(catCardView)
        view.addSubview(aiCharacterView)
        view.addSubview(cardPickerView)
        
        NSLayoutConstraint.activate([
            catCardView.widthAnchor.constraint(equalToConstant: 150),
            catCardView.heightAnchor.constraint(equalToConstant: 150),
            catCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catCardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            aiCharacterView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.3),
            aiCharacterView.heightAnchor.constraint(equalToConstant: view.bounds.width / 2),
            aiCharacterView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            aiCharacterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            cardPickerView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            cardPickerView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.3),
            cardPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
