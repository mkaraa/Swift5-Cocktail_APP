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
import CoreData

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
    var measurements: [String] = []
    var ingredient: String?
    var instruction: String?
    var index = 1
    
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

                        for index in 1...15 {
                            
                            if item["strIngredient\(index)"].string != nil {
                                self.ingredients.append(item["strIngredient\(index)"].stringValue)
                            }
                            
                        }
                        
                        self.instruction = instructions
                        
                        let imageUrl = URL(string: image!)
                        self.imageView.kf.setImage(with: imageUrl)
                    }
                    
                    i = i + 1
                }
                
                self.updateTextView(type: 0)
                print("Ingredients" , self.ingredients)
                
            case .failure:
                print("Error")
            }
        }
        
        
    }
    
    func updateTextView(type: Int) {
        
        // 0 -> ingredients, 1 -> instruction
        
        if type == 0 {
            
            //ing
            var tempIngredients = "Ingredients\n"
            for item in ingredients {
                tempIngredients += item + "\n"
            }
            
            // mea
            tempIngredients += "\n\nMeasuremnts\n"
            for item in ingredients {
                tempIngredients += item + "\n"
            }
            
            // update label
            textView.text = tempIngredients
            
        } else {
            self.textView.text = "Prepare\n" + instruction!
        }
        
    }
    
    @IBAction func SegmentControlAction(_ sender: Any) {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            updateTextView(type: 0)
        } else {
            updateTextView(type: 1)
        }
    }
    
    // MARK: Save Fav Cocktails to Core Data
    
    @IBAction func SaveCoreData(_ sender: Any) {
        print("Ingredients" , self.ingredients)
    }
}
