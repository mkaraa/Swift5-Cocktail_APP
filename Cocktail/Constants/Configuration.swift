//
//  Configuration.swift
//  Cocktail
//
//  Created by Metehan kara on 2.06.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import Foundation

struct Configuration {
    
    // MARK: Filter list alcoholic or non-alcoholic
    
    static let getAlcoholicListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
    static let getNonAlcoholicListURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    // MARK:  List the categories, glasses, ingredients or alcoholic filters
    
    static let getCategoriesListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
    static let getGlassesListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list"
    static let getIngredientsApiURL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
    static let getAlcoholicApiURL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?a=list"
    
    // MARK: Categories URLs
    
    static let getOrdinaryDrinkListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink"
    static let getCocoaListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocoa"
    static let getCocktailListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
    static let getShotDrinkListApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Shot"
    static let getMilkFLoatShakeApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Milk_/_Float_/_Shake"
    static let getHomemadeLiqueurApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Homemade_Liqueur"
    static let getOtherUnkownmApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Other/Unknown"
    static let getCoffeeTeaApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Coffee_/_Tea"
    static let getPunchPartyDrinkApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Punch_/_Party_Drink"
    static let getBeerApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Beer"
    static let getSoftDrinkSodaApiURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Soft_Drink_/_Soda"
    
    
}
