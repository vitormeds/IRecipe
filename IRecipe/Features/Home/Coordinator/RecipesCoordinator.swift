//
//  RecipesCoordinator.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import UIKit

class RecipesCoordinator: Coordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = RecipeViewModel(recipesService: RecipeService())
        let vc = RecipesViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: false)
    }
}
