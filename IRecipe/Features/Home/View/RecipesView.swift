//
//  RecipesView.swift
//  IRecipe
//
//  Created by Vitor Mendes on 26/06/23.
//

import UIKit
import Lottie

class RecipesView: UIView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Receitas"
        return searchBar
    }()
    
    let loadingView: LottieAnimationView = {
        let loadingView = LottieAnimationView(name: "loading")
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.loopMode = .loop
        loadingView.isHidden = true
        loadingView.play()
        return loadingView
    }()
    
    let recipesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let recipesCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        recipesCollection.translatesAutoresizingMaskIntoConstraints = false
        recipesCollection.showsVerticalScrollIndicator = false
        recipesCollection.showsHorizontalScrollIndicator = false
        return recipesCollection
    }()
    
    let recipesTableView: UITableView = {
        let recipesTableView = UITableView()
        recipesTableView.translatesAutoresizingMaskIntoConstraints = false
        recipesTableView.showsVerticalScrollIndicator = false
        recipesTableView.showsHorizontalScrollIndicator = false
        recipesTableView.separatorStyle = .none
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
        addSubview(loadingView)
        
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
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: Size.loadingSize),
            loadingView.heightAnchor.constraint(equalToConstant: Size.loadingSize)
        ])
    }
    
    func setupLoading(play: Bool) {
        loadingView.isHidden = !play
    }
    
}
