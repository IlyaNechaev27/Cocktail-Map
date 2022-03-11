//
//  DrinkDescriprionViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 11.03.2022.
//

import UIKit

class DrinkDescriprionViewController: UIViewController {
    private var descriptionURL: String {
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)"
    }
    
    var idDrink: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchData(for: CocktailData.self, from: descriptionURL) { result in
            switch result {
            case .success(let drink):
                print(drink)
            case .failure(let error):
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
