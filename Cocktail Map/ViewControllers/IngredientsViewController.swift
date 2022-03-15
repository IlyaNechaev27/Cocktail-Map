//
//  IngredientsViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 15.03.2022.
//

import UIKit

class IngredientsViewController: UIViewController {

    @IBOutlet weak var ingredientsLabel: UILabel!
    
    public var drink: Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsLabel.text = """
    \(drink.strIngredient1 ?? "")
    
    \(drink.strIngredient2 ?? "")
    
    \(drink.strIngredient3 ?? "")
    
    \(drink.strIngredient4 ?? "")
    
    \(drink.strIngredient5 ?? "")
    
    \(drink.strIngredient6 ?? "")
    
    \(drink.strIngredient7 ?? "")
    
    \(drink.strIngredient8 ?? "")
    
    \(drink.strIngredient9 ?? "")
    
    \(drink.strIngredient10 ?? "")
    
    \(drink.strIngredient11 ?? "")
    
    \(drink.strIngredient12 ?? "")
    
    \(drink.strIngredient13 ?? "")
    
    \(drink.strIngredient14 ?? "")
    
    \(drink.strIngredient15 ?? "")
    """
    }
    

 

}
