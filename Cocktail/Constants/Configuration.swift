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
    
    static let getAlcoholicListApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic")
    static let getNonAlcoholicListURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic")
    
    // MARK:  List the categories, glasses, ingredients or alcoholic filters
    
    static let getCategoriesListApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list")
    static let getGlassesListApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list")
    static let getIngredientsApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
    static let getAlcoholicApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/list.php?a=list")
    
    // MARK: Cocktails from Categories URLs
    
    static let getOrdinaryDrinkListApiURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink")
    static let getCocoaListApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocoa")
    static let getCocktailListApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail")
    static let getShotDrinkListApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Shot")
    static let getMilkFLoatShakeApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Milk_/_Float_/_Shake")
    static let getHomemadeLiqueurApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Homemade_Liqueur")
    static let getOtherUnkownmApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Other/Unknown")
    static let getCoffeeTeaApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Coffee_/_Tea")
    static let getPunchPartyDrinkApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Punch_/_Party_Drink")
    static let getBeerApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Beer")
    static let getSoftDrinkSodaApiURL = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Soft_Drink_/_Soda")
    
    
}
