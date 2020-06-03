//
//  CategoriesVC.swift
//  Cocktail
//
//  Created by Metehan kara on 2.06.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit


class CategoriesVC: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var ordinaryDrinkBtn: UIButton!
    @IBOutlet weak var cocktailBtn: UIButton!
    @IBOutlet weak var milkFloatShakeBtn: UIButton!
    @IBOutlet weak var cocoaBtn: UIButton!
    @IBOutlet weak var shotBtn: UIButton!
    @IBOutlet weak var coffeeTeaBtn: UIButton!
    @IBOutlet weak var homemadeLiqueurBtn: UIButton!
    @IBOutlet weak var punchPartyDrinkBtn: UIButton!
    @IBOutlet weak var beerBtn: UIButton!
    @IBOutlet weak var softDrinkSodaBtn: UIButton!
    @IBOutlet weak var otherBtn: UIButton!
    
    // MARK: Variable
    
    var apiUrl: String?
    var catTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "sendCategorySegue" {
            let tempDestination = segue.destination as? ListCocktailVC
            if let tempController = tempDestination {
                tempController.apiUrl = apiUrl
                tempController.categoryTitle = catTitle
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func ordinaryDrinkAction(_ sender: Any) {
        apiUrl = Configuration.getOrdinaryDrinkListApiURL
        catTitle = "Ordinary Drink"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func cocktailAction(_ sender: Any) {
        apiUrl = Configuration.getCocktailListApiURL
        catTitle = "Cocktail"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func mfsAction(_ sender: Any) {
        apiUrl = Configuration.getMilkFLoatShakeApiURL
        catTitle = "Milk / Float / Shake"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func cocoaAction(_ sender: Any) {
        apiUrl = Configuration.getCocoaListApiURL
        catTitle = "Cocoa"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func shotAction(_ sender: Any) {
        apiUrl = Configuration.getShotDrinkListApiURL
        catTitle = "Shot"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func coffeeTeaAction(_ sender: Any) {
        apiUrl = Configuration.getCoffeeTeaApiURL
        catTitle = "Coffee / Tea"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func homemadeLiqueurAction(_ sender: Any) {
        apiUrl = Configuration.getHomemadeLiqueurApiURL
        catTitle = "HomemadeLiqueur"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func punchPartyDrinkAction(_ sender: Any) {
        apiUrl = Configuration.getPunchPartyDrinkApiURL
        catTitle = "Punch / Party Drink"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func beerAction(_ sender: Any) {
        apiUrl = Configuration.getBeerApiURL
        catTitle = "Beer"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func softDrinkSodaAction(_ sender: Any) {
        apiUrl = Configuration.getSoftDrinkSodaApiURL
        catTitle = "Soft Drink / Soda"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    @IBAction func otherAction(_ sender: Any) {
        apiUrl = Configuration.getOtherUnkownmApiURL
        catTitle = "Other Cocktails"
        performSegue(withIdentifier: "sendCategorySegue", sender: self)
    }
    
    
}



