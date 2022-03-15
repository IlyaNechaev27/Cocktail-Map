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
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
}
