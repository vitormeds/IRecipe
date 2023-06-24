//
//  RecipesViewModel.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import Foundation

protocol RecipesViewModelProtocol {
    func getRecipes()
}

class RecipeViewModel: RecipesViewModelProtocol {
    
    let recipesService: RecipeServiceProtocol
    
    init(recipesService: RecipeServiceProtocol) {
        self.recipesService = recipesService
    }
    
    func getRecipes() {
        recipesService.getRecipes { result in
            print("Ok")
        } error: { e in
            print("Falhou")
        }

    }
}
