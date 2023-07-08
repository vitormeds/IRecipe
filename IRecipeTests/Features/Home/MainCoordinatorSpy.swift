//
//  MainCoordinatorSpy.swift
//  IRecipeTests
//
//  Created by Vitor Mendes on 07/07/23.
//

import Foundation
@testable import IRecipe

class MainCoordinatorSpy: MainCoordinatorDelegate {
    
    var openRecipeCount = 0
    
    func openRecipe(recipe: IRecipe.Recipe) {
        openRecipeCount += 1
    }
}
