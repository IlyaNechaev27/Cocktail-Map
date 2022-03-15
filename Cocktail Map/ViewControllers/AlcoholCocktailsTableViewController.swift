//
//  CocktailsTableViewController.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 09.03.2022.
//

import UIKit

class AlcoholCocktailsTableViewController: UITableViewController {
    private var cocktails: [Drink] = []

    private let alcoholURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Navigation Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idDrink = cocktails[indexPath.row].idDrink
        performSegue(withIdentifier: "AlcoDescription", sender: idDrink)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let drinkDescriprion = segue.destination as! DrinkDescriprionViewController

        drinkDescriprion.idDrink = sender as! String
        drinkDescriprion.fetchDataWithURLSession()
    }

    // MARK: - Network Manager Methods

    private func fetchData() {
        NetworkManager.shared.fetchData(for: CocktailData.self, from: alcoholURL) { result in
            switch result {
            case .success(let cocktails):
                self.cocktails = cocktails.drinks ?? []
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - TableViewDelegate and DataSource Methods

extension AlcoholCocktailsTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktail", for: indexPath) as! CocktailTableViewCell
        cell.configure(with: cocktails[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cocktails.count
    }
}
