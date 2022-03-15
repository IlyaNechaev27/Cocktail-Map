//
//  NoAlcoholDrinksViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 14.03.2022.
//

import UIKit


class NoAlcoholDrinksViewController: UICollectionViewController {
    
    private var cocktails: [Drink] = []
    
    private let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    private let reuseIdentifier = "Cockteil"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionVC = segue.destination as! DrinkDescriprionViewController
        
        guard let sender = sender as? Int else {
            return
        }

        descriptionVC.idDrink = cocktails[sender].idDrink!
        descriptionVC.fetchDataWithAlamofire()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NoAlcoDescription", sender: indexPath.row)
    }
    
    // MARK: - Network Manager
    
    private func fetchData() {
        AlamofireNetworkManager.shared.fetchData(type: CocktailData.self, with: urlString) { result in
            switch result {
            case .success(let cocktailData):
                self.cocktails = cocktailData.drinks!
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Collection View Delegate and Data Source
extension NoAlcoholDrinksViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cocktails.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CocktailCollectionViewCell
        print(cocktails[indexPath.row])
        cell.configure(with: cocktails[indexPath.row ])
        
        return cell
    }
    
  
}

