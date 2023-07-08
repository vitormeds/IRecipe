//
//  RecipesUITests.swift
//  IRecipeUITests
//
//  Created by Vitor Mendes on 27/06/23.
//

import XCTest

final class RecipesUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells.containing(.staticText, identifier:"Chicken Vesuvio").element.swipeLeft()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"Calorias: 1.149,31").element.swipeUp()
                            
    }
}
