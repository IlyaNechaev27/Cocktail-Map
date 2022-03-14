//
//  NoAlcoholDrinksViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 14.03.2022.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cockteil"

class NoAlcoholDrinksViewController: UICollectionViewController {
    
    var cocktails: [Drink] = []
    
    private let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cocktails.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CocktailCollectionViewCell
        print(cocktails[indexPath.row])
        cell.configure(with: cocktails[indexPath.row ])
        
        return cell
    }
    
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
        
        // MARK: UICollectionViewDelegate
        
        /*
         // Uncomment this method to specify if the specified item should be highlighted during tracking
         override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment this method to specify if the specified item should be selected
         override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
         override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
         
         }
         */
        
    }

