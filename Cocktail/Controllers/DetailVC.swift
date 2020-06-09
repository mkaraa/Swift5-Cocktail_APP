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
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    // fav ids
    var people = [NSManagedObject]()
    
    var detailTitle: String?
    var id: String?
    var apiURL = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    var selectedUrl: String?
    var isFav: Bool? = false
    var ingredients: [String] = []
    var measurements: [String] = []
    var ingredient: String?
    var instruction: String?
    var index = 1
    
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedUrl = apiURL + id!
        
        getDetailCoctail()
        
        imageView.layer.cornerRadius = 25
        imageView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "BodoniSvtyTwoOSITCTT-Book", size: 15),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)

        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "BodoniSvtyTwoOSITCTT-Book", size: 15),
            NSAttributedString.Key.foregroundColor: UIColor.orange
            ], for: .selected)
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
                        
                        for index in 1...15 {
                            
                            if item["strMeasure\(index)"].string != nil {
                                self.measurements.append(item["strMeasure\(index)"].stringValue)
                            }
                            
                        }
                        
                        self.instruction = instructions
                        
                        let imageUrl = URL(string: image!)
                        self.imageView.kf.setImage(with: imageUrl)
                    }
                    
                    i = i + 1
                }
                
                self.updateTextView(type: 0)
                
            case .failure:
                print("Error cannot getDetailCocktail")
            }
        }
        
        
    }
    
    func updateTextView(type: Int) {
        
        // 0 -> ingredients, 1 -> instruction
        var tempIngredients = "\n"
        if type == 0 {
            
            //ing
            for item in ingredients {
                tempIngredients += item + "\n"
            }
            
            // update label
            textView.text = tempIngredients
            
        } else if type == 1 {
            // mea
            for item in measurements {
                tempIngredients += item + "\n"
            }
            textView.text = tempIngredients
            
        }
        else {
            self.textView.text = "\n" + instruction!
        }
        
    }
    
    @IBAction func SegmentControlAction(_ sender: Any) {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            updateTextView(type: 0)
        } else if self.segmentedControl.selectedSegmentIndex == 1 {
            updateTextView(type: 1)
        }
        else {
            updateTextView(type: 2)
        }
    }
    
    // MARK: Save Fav Cocktails to Core Data
    
    @IBAction func SaveCoreData(_ sender: Any) {
        //1
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //2 (Specifying the entity name and preparing to insert data into Core Data)
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //3 (inserting data into Core Data)
        person.setValue(id, forKey: "name")
        
        //4
        do {
            // Saving the data in Core Data
            try managedContext.save()
            people.append(person)
           print("\(id) Cocktail is added as favorite.")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
}
