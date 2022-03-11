//
//  DrinkDescriprionViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 11.03.2022.
//

import UIKit

class DrinkDescriprionViewController: UIViewController {
    
    @IBOutlet weak var drinkImage: UIImageView! {
        didSet {
            drinkImage.layer.cornerRadius = drinkImage.frame.width / 2
        }
    }
    
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    private var descriptionURL: String {
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)"
    }
    
    private var drink: Drink?
    
    var idDrink: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem?.tintColor = .white
        fetchData()
        
       
    }

    private func fetchData() {
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
    
    private func setupVC() {
        title = drink?.strDrink
        alcoholLabel.text = "\(drink?.strAlcoholic ?? "") cocktail"
        glassLabel.text = "Served in \(drink?.strGlass ?? "")"
        instructionLabel.text = drink?.strInstructions
        
        DispatchQueue.global().async {
            guard let imageData = NetworkManager.shared.fetchImage(with: self.drink?.strDrinkThumb) else { return }
            
            DispatchQueue.main.async {
                self.drinkImage.image = UIImage(data: imageData)
            }
            
        }
    }
}
