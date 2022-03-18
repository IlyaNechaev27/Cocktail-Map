//
//  CockteilCollectionViewCell.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 14.03.2022.
//

import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailImage: CocktailImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with cocktail: Drink) {
        cocktailNameLabel.text = cocktail.strDrink
        cocktailImage.fetchImage(with: cocktail.strDrinkThumb ?? "")
    }
}
