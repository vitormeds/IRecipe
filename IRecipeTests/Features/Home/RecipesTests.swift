//
//  RecipesTests.swift
//  IRecipeTests
//
//  Created by Vitor Mendes on 27/06/23.
//

import XCTest
@testable import IRecipe

final class RecipeTests: XCTestCase {

    var viewModel: RecipeViewModel!
    var service = RecipeServiceMock()
    var controllerSpy = RecipesViewControllerSpy()
    var coordinatorSpy = MainCoordinatorSpy()
    
    override func setUp() {
        viewModel = RecipeViewModel(recipesService: service, coordinatorDelegate: coordinatorSpy)
        viewModel.recipesViewDelegate = controllerSpy
    }
    
    func testLoadData() {
        viewModel.getRecipes()
        XCTAssertEqual(controllerSpy.loadSucessCount, 1)
        XCTAssertEqual(controllerSpy.loadErrorCount, 0)
    }
    
    func testLoadDataError() {
        service.resultSucess = false
        viewModel.getRecipes()
        XCTAssertEqual(controllerSpy.loadErrorCount, 1)
        XCTAssertEqual(controllerSpy.loadSucessCount, 0)
    }
}

