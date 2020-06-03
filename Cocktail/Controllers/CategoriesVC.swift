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
    
    @IBOutlet var categoriesButtons: [UIButton]!
    
    
    // MARK: Variable
    
    var apiUrl: URL?
    var catTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesButtons = categoriesButtons.sorted() {
            $0.tag < $1.tag
        }
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
    
    @IBAction func categoriesButtonsTapped(_ sender: UIButton) {
       
            if sender.tag == 0 {
                apiUrl = Configuration.getOrdinaryDrinkListApiURL
                catTitle = "Ordinary Drink"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 1 {
                apiUrl = Configuration.getCocktailListApiURL
                catTitle = "Cocktail"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 2 {
                apiUrl = Configuration.getMilkFLoatShakeApiURL
                catTitle = "Milk / Float / Shake"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 3 {
                apiUrl = Configuration.getCocoaListApiURL
                catTitle = "Cocoa"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 4 {
                apiUrl = Configuration.getShotDrinkListApiURL
                catTitle = "Shot"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 5 {
                apiUrl = Configuration.getCoffeeTeaApiURL
                catTitle = "Coffee / Tea"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 6 {
                apiUrl = Configuration.getHomemadeLiqueurApiURL
                catTitle = "Homemade Liqueur"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 7 {
                apiUrl = Configuration.getPunchPartyDrinkApiURL
                catTitle = "Punch / Party Drink"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 8 {
                apiUrl = Configuration.getBeerApiURL
                catTitle = "Beer"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else if sender.tag == 9 {
                apiUrl = Configuration.getSoftDrinkSodaApiURL
                catTitle = "Soft Drink / Soda"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
            else {
                apiUrl = Configuration.getOtherUnkownmApiURL
                catTitle = "Other"
                performSegue(withIdentifier: "sendCategorySegue", sender: self)
                
            }
    }
}



