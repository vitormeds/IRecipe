//
//  RecipeTableViewCell.swift
//  IRecipe
//
//  Created by Vitor Mendes on 26/06/23.
//

import UIKit
import Nuke

class RecipeTableViewCell: UITableViewCell {
    
    var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints =  false
        return containerView
    }()
    
    var atributesStackView: UIStackView = {
        let atributesStackView = UIStackView()
        atributesStackView.translatesAutoresizingMaskIntoConstraints =  false
        atributesStackView.axis = .vertical
        return atributesStackView
    }()
    
    var recipeImageView: UIImageView = {
        let recipeImageView = UIImageView()
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        recipeImageView.layer.masksToBounds = true
        recipeImageView.layer.cornerRadius = 15
        return recipeImageView
    }()

    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return nameLabel
    }()
    
    var caloriesLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        return nameLabel
    }()
    
    var timeToPrepareLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(containerView)
        addSubview(atributesStackView)
        containerView.addSubview(recipeImageView)
        atributesStackView.addArrangedSubview(nameLabel)
        atributesStackView.addArrangedSubview(caloriesLabel)
        atributesStackView.addArrangedSubview(timeToPrepareLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recipeImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            recipeImageView.widthAnchor.constraint(equalToConstant: Size.recipeSize),
            recipeImageView.heightAnchor.constraint(equalToConstant: Size.recipeSize)
        ])
        
        NSLayoutConstraint.activate([
            atributesStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Spacing.normalSpacing),
            atributesStackView.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: Spacing.normalSpacing),
            atributesStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            atributesStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Spacing.normalSpacing)
        ])
    }
    
    func setup(recipe: Recipe) {
        if let urlImg: URL = URL(string: recipe.image) {
            let request: ImageRequest? = ImageRequest(urlRequest: URLRequest(url: urlImg))
            Nuke.loadImage(with: request!, into: recipeImageView)
        }
        nameLabel.text = recipe.label
        caloriesLabel.text = IRecipeStrings.Home.RecipeCell.calories + String.localizedStringWithFormat("%.2f", recipe.calories)
        timeToPrepareLabel.text = IRecipeStrings.Home.RecipeCell.time + recipe.totalTime.description
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

