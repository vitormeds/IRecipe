//
//  RecipesViewModel.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import Foundation

protocol RecipesViewModelDelegate {
    func getRecipes()
    var recipes: [Hit]? { get set }
    func openRecipe(recipe: Recipe)
}

protocol RecipesViewModelToViewDelegate {
    func loadSucess()
    func loadError(error: Error)
}

class RecipeViewModel: RecipesViewModelDelegate {

    let recipesService: RecipeServiceDelegate
    var recipesViewDelegate: RecipesViewModelToViewDelegate?
    var coordinatorDelegate: MainCoordinatorDelegate?
    var recipes: [Hit]?
    
    init(recipesService: RecipeServiceDelegate, coordinatorDelegate: MainCoordinatorDelegate) {
        self.recipesService = recipesService
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func getRecipes() {
        recipesService.getRecipes { result in
            self.recipes = result.hits
            self.recipesViewDelegate?.loadSucess()
        } error: { e in
            self.recipesViewDelegate?.loadError(error: e)
        }
    }
    
    func openRecipe(recipe: Recipe) {
        coordinatorDelegate?.openRecipe(recipe: recipe)
    }
}
