//
//  CocktailData.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 09.03.2022.
//

import Foundation

struct CocktailData: Decodable {
    let drinks: [Drink]?
}

struct Drink: Decodable {
    let strDrink: String?
    let strDrinkThumb: String?
    let idDrink: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String?
}
