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
        
        viewModel.showAlert = {
            self.showAlert(imageName: $0, title: $1, message: $2)
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
            cardPickerView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.2),
            cardPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

//MARK: - Alert Handler
extension ViewController {
    
    private func showAlert(imageName: String, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: imageName)
        alert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: alert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
