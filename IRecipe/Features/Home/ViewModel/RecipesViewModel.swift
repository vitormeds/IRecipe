//
//  RecipesViewModel.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import Foundation

protocol RecipesViewModelProtocol {
    func getRecipes(sucess: @escaping ()-> Void, error: @escaping (Error)-> Void)
    var recipes: [Hit]? { get set }
}

class RecipeViewModel: RecipesViewModelProtocol {
    
    let recipesService: RecipeServiceProtocol
    var recipes: [Hit]?
    
    init(recipesService: RecipeServiceProtocol) {
        self.recipesService = recipesService
    }
    
    func getRecipes(sucess: @escaping ()-> Void, error: @escaping (Error)-> Void) {
        recipesService.getRecipes { result in
            self.recipes = result.hits
            sucess()
        } error: { e in
            error(e)
        }
    }
}
