//
//  ViewController.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import UIKit

class RecipesViewController: UIViewController {

    let viewModel: RecipesViewModelProtocol
    
    init(viewModel: RecipesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        viewModel.getRecipes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

