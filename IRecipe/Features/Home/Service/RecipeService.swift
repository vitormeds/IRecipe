//
//  RecipeService.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import Foundation

protocol RecipeServiceProtocol {
    func getRecipes(sucess: @escaping (RecipesModel)-> Void, error: @escaping (Error)-> Void)
}

class RecipeService: RecipeServiceProtocol {
    
    func getRecipes(sucess: @escaping (RecipesModel)-> Void, error: @escaping (Error)-> Void) {
        NetworkService.request(url: "https://api.edamam.com/api/recipes/v2/", method: .get, obj: RecipesModel.self) { result in
            sucess(result)
        } error: { e in
            error(e)
        }
    }
}
