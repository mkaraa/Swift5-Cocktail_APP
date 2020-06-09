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
import AVFoundation

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
    var ids = [Person]()
    
    var audioPlayer: AVAudioPlayer!
    let soundArray = ["note1"]
    var selectedSoundFileName = ""
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataAlAmk()
        
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

    func dataAlAmk(){
        
        //1
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        //3
        do {
            let results = try managedContext.fetch(fetchRequest)
            ids = results as! [Person]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            isFav = false
        }
        
        for item in ids {
            
            if item.name == id {
                isFav = true
            }
            
        }
        
        if isFav! {
            //favButton.image = UIImage(named: "star.fill")
            print("bu zaten fav")
        } else {
            //favButton.image = UIImage(named: "star")
            print("bu zaten degil")
        }
        
    }
    
    // MARK: Core Data - Save
    func saveNewItem(_ name: String) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newItem = Person.createInManagedObjectContext(context, name: name)
        self.dataAlAmk()
        saveData()
        
    }
    
    // MARK: Core Data - Save
    func saveData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try context.save()
            //favButton.image = UIImage(named: "star.fill")
        } catch let error as NSError  {
            Alert.showAlert(message: "Core Data is unavailable!", vc: self)
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    // MARK: Save Fav Cocktails to Core Data
    
    @IBAction func SaveCoreData(_ sender: Any) {

        if isFav! {
            deleteFavId(id: id!)
        } else {
            self.saveNewItem(id!)
            
            playSound()
            Alert.showAlert(message: "This is your favorite cocktail.", vc: self)
            print("\(id) Cocktail is added as favorite.")
             
        }
        
    }
    
    func deleteFavId(id: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        let result = try? context.fetch(request)
        let resultData = result as! [Person]

        for object in resultData {
            if object.name == id {
                context.delete(object)
                //favButton.image = UIImage(named: "star.fill")
            }
        }
        
        saveData()

    }
    
    
    func playSound() {
        
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        
        audioPlayer.play()
    }
}
