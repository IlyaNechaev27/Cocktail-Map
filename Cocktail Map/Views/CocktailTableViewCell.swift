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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }

    func configure(with cocktail: Drink) {
        cocktailNameLabel.text = cocktail.strDrink
        
        DispatchQueue.global().async {
            guard let imageData = NetworkManager.shared.fetchImage(with: cocktail.strDrinkThumb) else { return }
            
            DispatchQueue.main.async {
                self.cocktailImage.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
