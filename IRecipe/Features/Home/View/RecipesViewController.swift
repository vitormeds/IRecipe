//
//  ViewController.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import UIKit

class RecipesViewController: UIViewController {

    let viewModel: RecipesViewModelProtocol
    
    let recipesView: RecipesView = {
        let recipesView = RecipesView()
        recipesView.translatesAutoresizingMaskIntoConstraints = false
        return recipesView
    }()
    
    init(viewModel: RecipesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
        setupCollection()
        getRecipes()
    }
    
    func getRecipes() {
        viewModel.getRecipes {
            print("Sucesso")
            self.recipesView.recipesCollection.delegate = self
            self.recipesView.recipesCollection.dataSource = self
            self.recipesView.recipesCollection.reloadData()
        } error: { error in
            print(error.asAFError?.responseCode ?? 0)
        }

    }
    
    func setupViews() {
        view.addSubview(recipesView)
        
        NSLayoutConstraint.activate([
            recipesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recipesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recipesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            recipesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupCollection() {
        recipesView.recipesCollection.register(FeaturedRecipeCollectionViewCell.self,forCellWithReuseIdentifier: FeaturedRecipeCollectionViewCell.description())
        recipesView.recipesCollection.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RecipesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedRecipeCollectionViewCell.description(), for: indexPath) as! FeaturedRecipeCollectionViewCell
        guard let recipe = viewModel.recipes?[indexPath.item].recipe else {
            return UICollectionViewCell()
        }
        cell.setupCell(title: recipe.label, image: recipe.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.window?.bounds.width ?? 0) - 32, height: 180)
    }
}
