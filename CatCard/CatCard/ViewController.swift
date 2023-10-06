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

}

// MARK: - Life Cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupLayout()
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
        view.addSubview(aiCharacterView)
        view.addSubview(cardPickerView)
        
        NSLayoutConstraint.activate([
            aiCharacterView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.3),
            aiCharacterView.heightAnchor.constraint(equalToConstant: view.bounds.width / 2),
            aiCharacterView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            aiCharacterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            cardPickerView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            cardPickerView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.3),
            cardPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8)
        ])
    }
}
