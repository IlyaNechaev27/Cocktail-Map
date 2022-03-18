//
//  CocktailTableViewCell.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 09.03.2022.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
 
    @IBOutlet weak var cocktailImage: CocktailImageView! {
        didSet {
            cocktailImage.contentMode = .scaleAspectFit
            cocktailImage.layer.cornerRadius = cocktailImage.frame.height / 2
        }
    }
    
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }

    func configure(with cocktail: Drink) {
        cocktailNameLabel.text = cocktail.strDrink
        cocktailImage.fetchImage(with: cocktail.strDrinkThumb ?? "")
        activityIndicator.stopAnimating()
    }
}
