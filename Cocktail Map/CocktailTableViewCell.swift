//
//  CocktailTableViewCell.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 09.03.2022.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImage: UIImageView! {
        didSet {
            cocktailImage.contentMode = .scaleAspectFit
            cocktailImage.layer.cornerRadius = cocktailImage.frame.height / 2
        }
    }
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with cocktail: Drink) {
        cocktailNameLabel.text = cocktail.strDrink
        
        DispatchQueue.global().async {
            guard let stringURL = cocktail.strDrinkThumb else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.cocktailImage.image = UIImage(data: imageData)
            }
        }
    }
}
