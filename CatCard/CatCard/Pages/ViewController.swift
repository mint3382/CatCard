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
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
    
    
}

// MARK: - Life Cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupLayout()
        viewModel.prepareGame()
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

//MARK: - Alert Handler
extension ViewController {
    //호랑이 게임 종료 알럿
    private func biteByTigerGameOver() {
        let adoptAlert = UIAlertController(title: "이런... 호랑이에게 잡아먹혔습니다.", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        let randomCatImageNumber = Int.random(in: 1...2)
        
        imageView.image = UIImage(named: "tiger\(randomCatImageNumber)")
        adoptAlert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: adoptAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: adoptAlert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        adoptAlert.view.addConstraint(height)
        adoptAlert.view.addConstraint(width)
        
        let okButtonAction = UIAlertAction(title: "다시하기", style: .default, handler: viewModel.resetGame)
        
        adoptAlert.addAction(okButtonAction)
        present(adoptAlert, animated: false)
    }
    
    //고양이 입양 완료 알럿
    private func notifyAdoptComplete() {
        let adoptAlert = UIAlertController(title: "입양 완료!", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        let randomCatImageNumber = Int.random(in: 1...16)
        
        imageView.image = UIImage(named: "cat\(randomCatImageNumber)")
        adoptAlert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: adoptAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: adoptAlert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        adoptAlert.view.addConstraint(height)
        adoptAlert.view.addConstraint(width)
        
        let okButtonAction = UIAlertAction(title: "확인", style: .default)
        
        adoptAlert.addAction(okButtonAction)
        present(adoptAlert, animated: false)
    }
    
    //승리 알럿
    private func winTheGame() {
        let winnerAlert = UIAlertController(title: "성공! 당신은 자격이 있다!", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        let randomCatImageNumber = Int.random(in: 1...16)
        
        imageView.image = UIImage(named: "cat\(randomCatImageNumber)")
        winnerAlert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: winnerAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: winnerAlert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        winnerAlert.view.addConstraint(height)
        winnerAlert.view.addConstraint(width)
        
        let okButtonAction = UIAlertAction(title: "다시하기", style: .default, handler: viewModel.resetGame)
        
        winnerAlert.addAction(okButtonAction)
        present(winnerAlert, animated: false)
        
    }
    
    //패배 알럿
    private func loseTheGame() {
        let loserAlert = UIAlertController(title: "실패! 당신은 자격이 없다!", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        let randomCatImageNumber = Int.random(in: 1...2)
        
        imageView.image = UIImage(named: "tiger\(randomCatImageNumber)")
        loserAlert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: loserAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: loserAlert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        loserAlert.view.addConstraint(height)
        loserAlert.view.addConstraint(width)
        
        let okButtonAction = UIAlertAction(title: "다시하기", style: .default, handler: viewModel.resetGame)
        
        loserAlert.addAction(okButtonAction)
        present(loserAlert, animated: false)
    }
    
    
    //게임 설명 알럿
    private func discussionGameRule() {
        let gameRuleAlert = UIAlertController(title: "게임 규칙",
                                              message: 
            """
            과연 당신은 고양이 마스터로부터 허락을 받아낼 수 있을지?
            사랑, 밥, 캣타워, 시간, 돈 1장을 지불하거나
            사랑 10장을 지불하여
            고양이를 향한 당신의 사랑을 증명하세요!
            입양하실 때는 호랑이일지 아닐지 신중하게 확인하세요.
            잡아 먹힐 수도 있으니까요!
            """,
                                              preferredStyle: .alert)
        let okButtonAction = UIAlertAction(title: "확인", style: .default)
        
        gameRuleAlert.addAction(okButtonAction)
        present(gameRuleAlert, animated: false)
    }
}
