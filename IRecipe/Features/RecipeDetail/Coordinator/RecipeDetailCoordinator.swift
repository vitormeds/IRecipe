//
//  RecipeDetailCoordinator.swift
//  IRecipe
//
//  Created by Vitor Mendes on 07/07/23.
//

import UIKit

class RecipeDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let recipe: Recipe

    init(navigationController: UINavigationController, recipe: Recipe) {
        self.navigationController = navigationController
        self.recipe = recipe
    }

    func start() {
        let viewModel = RecipeDetailViewModel(recipe: recipe)
        let vc = RecipeDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
