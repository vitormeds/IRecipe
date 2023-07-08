//
//  RecipesCoordinator.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import UIKit

protocol RecipesCoordinatorDelegate {
    func openRecipe(recipe: Recipe)
}

class RecipesCoordinator: Coordinator {
    
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

extension RecipesCoordinator: RecipesCoordinatorDelegate {
    
    func openRecipe(recipe: Recipe) {
        let recipeDetailCoordinator = RecipeDetailCoordinator(navigationController: navigationController, recipe: recipe)
        recipeDetailCoordinator.start()
    }
}
