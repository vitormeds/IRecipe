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
        setupTableViewAndCollection()
        getRecipes()
    }
    
    func getRecipes() {
        viewModel.getRecipes {
            print("Sucesso")
            self.recipesView.recipesCollection.delegate = self
            self.recipesView.recipesCollection.dataSource = self
            self.recipesView.recipesCollection.reloadData()
            self.recipesView.recipesTableView.delegate = self
            self.recipesView.recipesTableView.dataSource = self
            self.recipesView.recipesTableView.reloadData()
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
    
    func setupTableViewAndCollection() {
        recipesView.recipesCollection.register(FeaturedRecipeCollectionViewCell.self,forCellWithReuseIdentifier: FeaturedRecipeCollectionViewCell.description())
        recipesView.recipesTableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.description())
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
        return CGSize(width: (view.window?.bounds.width ?? 0) - Spacing.bigSpacing, height: Size.collectionSize)
    }
}

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.description()) as! RecipeTableViewCell
        guard let recipe = viewModel.recipes?[indexPath.row].recipe else {
            return UITableViewCell()
        }
        cell.setup(recipe: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
