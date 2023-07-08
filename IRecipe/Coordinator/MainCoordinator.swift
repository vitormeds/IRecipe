//
//  MainCoordinator.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import UIKit

protocol MainCoordinatorDelegate {
    func openRecipe(recipe: Recipe)
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = RecipeViewModel(recipesService: RecipeService(), coordinatorDelegate: self)
        let vc = RecipesViewController(viewModel: viewModel)
        viewModel.recipesViewDelegate = vc
        navigationController.pushViewController(vc, animated: true)
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    
    func openRecipe(recipe: Recipe) {
        let viewModel = RecipeDetailViewModel(recipe: recipe)
        let vc = RecipeDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
