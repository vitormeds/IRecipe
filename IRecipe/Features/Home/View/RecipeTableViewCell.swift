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
        return recipeImageView
    }()

    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var caloriesLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var timeToPrepareLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
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
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            recipeImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: Spacing.normalSpacing),
            recipeImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            recipeImageView.widthAnchor.constraint(equalToConstant: Size.recipeSize),
            recipeImageView.heightAnchor.constraint(equalToConstant: Size.recipeSize)
        ])
        
        NSLayoutConstraint.activate([
            atributesStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Spacing.normalSpacing),
            atributesStackView.leftAnchor.constraint(equalTo: recipeImageView.rightAnchor, constant: Spacing.normalSpacing),
            atributesStackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Spacing.normalSpacing),
            atributesStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Spacing.normalSpacing)
        ])
    }
    
    func setup(recipe: Recipe) {
        if let urlImg: URL = URL(string: recipe.image) {
            let request: ImageRequest? = ImageRequest(urlRequest: URLRequest(url: urlImg))
            Nuke.loadImage(with: request!, into: recipeImageView)
        }
        nameLabel.text = recipe.label
        caloriesLabel.text = recipe.calories.description
        timeToPrepareLabel.text = recipe.totalTime.description
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

