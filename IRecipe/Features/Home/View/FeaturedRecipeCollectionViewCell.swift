//
//  FeaturedRecipeCollectionViewCell.swift
//  IRecipe
//
//  Created by Vitor Mendes on 26/06/23.
//

import UIKit

class FeaturedRecipeCollectionViewCell: UICollectionViewCell {
    
    let recipeImageView: UIImageView = {
        let recipeImageView = UIImageView()
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        return recipeImageView
    }()
    
    let titleBackgroundView: UIView = {
        let titleBackgroundView = UIView()
        titleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return titleBackgroundView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(recipeImageView)
        addSubview(titleBackgroundView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleBackgroundView.bottomAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 4),
            titleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleBackgroundView.heightAnchor.constraint(equalToConstant: CGFloat(60))
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleBackgroundView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleBackgroundView.centerYAnchor)
        ])
    }
    
    func setupCell(title: String, image: String) {
        titleLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
