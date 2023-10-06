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
