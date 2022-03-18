//
//  DrinkDescriprionViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 11.03.2022.
//

import UIKit

class DrinkDescriprionViewController: UIViewController {
    @IBOutlet var drinkImage: CocktailImageView! {
        didSet {
            drinkImage.layer.cornerRadius = drinkImage.frame.width / 2
        }
    }

    @IBOutlet var alcoholLabel: UILabel!
    @IBOutlet var glassLabel: UILabel!
    @IBOutlet var instructionLabel: UILabel!
    
    private var descriptionURL: String {
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)"
    }
    
    public var idDrink: String = ""
    
    private var drink: Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupVC() {
        title = drink?.strDrink
        alcoholLabel.text = "\(drink?.strAlcoholic ?? "") cocktail"
        glassLabel.text = "Served in \(drink?.strGlass ?? "")"
        instructionLabel.text = drink?.strInstructions
        
        drinkImage.fetchImage(with: drink.strDrinkThumb ?? "")
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ingredientsVC = segue.destination as! IngredientsViewController
        
        ingredientsVC.drink = drink
    }
    
    // MARK: - Network Manager Methods
    
    public func fetchDataWithURLSession() {
        NetworkManager.shared.fetchData(for: CocktailData.self, from: descriptionURL) { result in
            switch result {
            case .success(let drink):
                self.drink = drink.drinks?.first
                self.setupVC()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func fetchDataWithAlamofire() {
        AlamofireNetworkManager.shared.fetchData(type: CocktailData.self, with: descriptionURL) { result in
            switch result {
            case .success(let drink):
                self.drink = drink.drinks?.first
                self.setupVC()
            case .failure(let error):
                print(error)
            }
        }
    }
}
