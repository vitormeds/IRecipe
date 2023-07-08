//
//  RecipeDetailViewController.swift
//  IRecipe
//
//  Created by Vitor Mendes on 07/07/23.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    let viewModel: RecipeDetailViewModelDelegate
    
    init(viewModel: RecipeDetailViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
