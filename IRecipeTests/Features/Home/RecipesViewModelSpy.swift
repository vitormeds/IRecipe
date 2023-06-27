//
//  RecipesViewModelSpy.swift
//  IRecipeTests
//
//  Created by Vitor Mendes on 27/06/23.
//

import Foundation
@testable import IRecipe

class RecipesViewControllerSpy: RecipesViewModelToViewDelegate {
    
    var loadSucessCount = 0
    var loadErrorCount = 0
    
    func loadSucess() {
        loadSucessCount += 1
    }
    
    func loadError(error: Error) {
        loadErrorCount += 1
    }
}
