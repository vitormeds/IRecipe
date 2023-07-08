//
//  RecipesSnapshotTests.swift
//  IRecipeTests
//
//  Created by Vitor Mendes on 27/06/23.
//

import XCTest
import FBSnapshotTestCase
@testable import IRecipe

final class RecipeTestsSnapshotTests: FBSnapshotTestCase {

    var viewModel: RecipeViewModel!
    var service = RecipeServiceMock()
    var controllerSpy = RecipesViewControllerSpy()
    var coordinatorSpy = MainCoordinatorSpy()
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
        viewModel = RecipeViewModel(recipesService: service, coordinatorDelegate: coordinatorSpy)
        viewModel.recipesViewDelegate = controllerSpy
    }
    
    func testRecipes() {
        let vc = RecipesViewController(viewModel: viewModel)
        vc.view.frame = UIScreen.main.bounds
        FBSnapshotVerifyViewController(vc)
    }
}

