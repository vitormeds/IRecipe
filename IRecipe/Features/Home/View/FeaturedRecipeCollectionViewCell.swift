//
//  FeaturedRecipeCollectionViewCell.swift
//  IRecipe
//
//  Created by Vitor Mendes on 26/06/23.
//

import UIKit
import Nuke

class FeaturedRecipeCollectionViewCell: UICollectionViewCell {
    
    let recipeImageView: UIImageView = {
        let recipeImageView = UIImageView()
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        recipeImageView.layer.masksToBounds = true
        recipeImageView.layer.cornerRadius = 15
        return recipeImageView
    }()
    
    let titleBackgroundView: UIView = {
        let titleBackgroundView = UIView()
        titleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        titleBackgroundView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
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
            titleBackgroundView.bottomAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: Spacing.smallerSpacing),
            titleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleBackgroundView.heightAnchor.constraint(equalToConstant: Size.titleSize)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleBackgroundView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleBackgroundView.centerYAnchor)
        ])
    }
    
    func setupCell(title: String, image: String) {
        titleLabel.text = title
        if let urlImg: URL = URL(string: image) {
            let request: ImageRequest? = ImageRequest(urlRequest: URLRequest(url: urlImg))
            Nuke.loadImage(with: request!, into: recipeImageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
