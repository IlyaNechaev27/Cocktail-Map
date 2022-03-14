//
//  CockteilCollectionViewCell.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 14.03.2022.
//

import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with cocktail: Drink) {
        cocktailNameLabel.text = cocktail.strDrink
        
        DispatchQueue.global().async {
            guard let imageData = NetworkManager.shared.fetchImage(with: cocktail.strDrinkThumb) else { return }
            
            DispatchQueue.main.async {
                self.cocktailImage.image = UIImage(data: imageData)
            }
        }
    }
}
