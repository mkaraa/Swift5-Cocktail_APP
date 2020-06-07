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
    var ingredients: [String] = []
    var id: String?
    var apiURL = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    var selectedUrl: String?
    
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
                        var instructions = item["strInstructions"].string
                        var ingredient = item["strIngredient1"].string
                       
                        
                        if self.segmentedControl.selectedSegmentIndex == 0 {
                            self.textView.text = ingredient
                        } else {
                            self.textView.text = instructions
                        }
                        
                        print(self.ingredients)
    
                    }

                    i = i + 1
                }

            case .failure:
                print("Error")
            }
        }
    }
    
    // MARK: Save Fav Cocktails to Core Data
    
    @IBAction func SaveCoreData(_ sender: Any) {
    }
}
