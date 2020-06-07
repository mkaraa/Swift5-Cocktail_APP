//
//  DetailVC.swift
//  Cocktail
//
//  Created by Metehan kara on 7.06.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class DetailVC: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    var detailTitle: String?
    var id: String?
    var apiURL = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    var selectedUrl: String?
    
    var ingredients: [String] = []
    var ingredient: String?
    var instruction: String?
    var index = 0
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedUrl = apiURL + id!
        
        
        print(id)
        print(selectedUrl)
        getDetailCoctail()
        
    }
    
    // MARK: GetDetailData
    
    func getDetailCoctail(){
        AF.request(selectedUrl!, method: .get).responseJSON { myresponse in
            
            // check result is success or failure
            switch myresponse.result {
            case .success:
                
                // GET data
                let myresult = try? JSON(data: myresponse.data!)
                let resultArray = myresult!
                
                //
                var index: Int? = 0
                
                var i = 0
                
                for item in resultArray["drinks"].arrayValue {
                    if item["idDrink"].stringValue == self.id {
                        // let id = item["idDrink"].string
                        let category = item["strCategory"].string
                        let name = item["strDrink"].string
                        let image = item["strDrinkThumb"].string
                        let alcoholic = item["strAlcoholic"].string
                        let instructions = item["strInstructions"].string
                        //                        let ingredient1 = item["strIngredient1"].string
                        //                        let ingredient2 = item["strIngredient2"].string
                        //                        let ingredient3 = item["strIngredient3"].string
                        //                        let ingredient4 = item["strIngredient4"].string
                        
                        
                        if let isIngredientExist = item["strIngredient\(String(describing: index))"].string {
                            self.ingredients.append(isIngredientExist)
                            index! += 1
                        }
                        
                        if let isIngredientExist = item["strMeasure\(String(describing: index))"].string {
                            self.ingredients.append(isIngredientExist)
                            index! += 1
                        }
                        //
                        //                        self.ingredients.append(ingredient1!)
                        //                        self.ingredients.append(ingredient2!)
                        //                        self.ingredients.append(ingredient3!)
                        //                        self.ingredients.append(ingredient4!)
                        
                        print("Ingredients" , self.ingredients)
                        
                        self.instruction = instructions
                        
                        let imageUrl = URL(string: image!)
                        self.imageView.kf.setImage(with: imageUrl)
                    }
                    
                    i = i + 1
                }
                
            case .failure:
                print("Error")
            }
        }
    }
    
    @IBAction func SegmentControlAction(_ sender: Any) {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            for cocktail in self.ingredients {
                self.textView.text = cocktail
            }
        } else {
            self.textView.text = instruction
        }
    }
    
    // MARK: Save Fav Cocktails to Core Data
    
    @IBAction func SaveCoreData(_ sender: Any) {
    }
}
