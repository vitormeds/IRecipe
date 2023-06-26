//
//  RecipesView.swift
//  IRecipe
//
//  Created by Vitor Mendes on 26/06/23.
//

import UIKit

class RecipesView: UIView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Receita"
        return searchBar
    }()
    
    let recipesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let recipesCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        recipesCollection.translatesAutoresizingMaskIntoConstraints = false
        recipesCollection.backgroundColor = UIColor.gray
        recipesCollection.showsVerticalScrollIndicator = false
        recipesCollection.showsHorizontalScrollIndicator = false
        return recipesCollection
    }()
    
    let recipesTableView: UITableView = {
        let recipesTableView = UITableView()
        recipesTableView.translatesAutoresizingMaskIntoConstraints = false
        recipesTableView.backgroundColor = UIColor.lightGray
        return recipesTableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    
    func setupViews()
    {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(searchBar)
        addSubview(recipesCollection)
        addSubview(recipesTableView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.normalSpacing),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.normalSpacing),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.normalSpacing),
            searchBar.heightAnchor.constraint(equalToConstant: Size.searchBarSize)
        ])
        
        NSLayoutConstraint.activate([
            recipesCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: Spacing.normalSpacing),
            recipesCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.normalSpacing),
            recipesCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.normalSpacing),
            recipesCollection.heightAnchor.constraint(equalToConstant: Size.collectionSize)
        ])
        
        NSLayoutConstraint.activate([
            recipesTableView.topAnchor.constraint(equalTo: recipesCollection.bottomAnchor, constant: Spacing.normalSpacing),
            recipesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.normalSpacing),
            recipesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.normalSpacing),
            recipesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Spacing.normalSpacing)
        ])
        
    }
    
}
