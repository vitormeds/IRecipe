//
//  Coordinator.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
