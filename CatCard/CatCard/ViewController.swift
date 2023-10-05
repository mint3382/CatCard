//
//  ViewController.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel: CardPickerViewModelProtocol!
    
    init(viewModel: CardPickerViewModelProtocol = CardPickerViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = CardPickerViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

