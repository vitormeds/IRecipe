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
        XCUIApplication().searchFields["Receita"].tap()

        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells.containing(.staticText, identifier:"Chicken Vesuvio").element.swipeLeft()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"Calorias: 4.228,04").element.swipeUp()
                            
    }
}
