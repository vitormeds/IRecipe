//
//  RecipeDetailViewModel.swift
//  IRecipe
//
//  Created by Vitor Mendes on 07/07/23.
//

import Foundation

protocol RecipeDetailViewModelDelegate {
}

class RecipeDetailViewModel: RecipeDetailViewModelDelegate {

    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
