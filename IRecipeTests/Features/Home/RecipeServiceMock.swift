//
//  RecipeServiceMock.swift
//  IRecipeTests
//
//  Created by Vitor Mendes on 27/06/23.
//

import Foundation
@testable import IRecipe

class RecipeServiceMock: RecipeServiceDelegate {
    
    var resultSucess = true
    
    func getRecipes(sucess: @escaping (IRecipe.RecipesModel) -> Void, error: @escaping (Error) -> Void) {
        if resultSucess {
            sucess(RecipesModel(
                from: 0,
                to: 0,
                count: 0,
                links: RecipesLinks(next: Next(href: "",
                                               title: Title.nextPage)
                ),
                hits: []
            ))
        } else {
            error(CustomError(title: "", description: "", code: 0))
        }
    }
}

protocol OurErrorProtocol: LocalizedError {

    var title: String? { get }
    var code: Int { get }
}

struct CustomError: OurErrorProtocol {

    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }

    private var _description: String

    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}
