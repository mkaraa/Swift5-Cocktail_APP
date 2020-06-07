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
    var apiURL: URL? = Configuration.getCocktailDetailApiURL
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id as Any)
        print(apiURL as Any)
        
        apiURL?.appendPathComponent(id!)
        
    }
    
    // MARK: GetDetailData
    
    func getDetailCoctail(id: String){
        AF.request(apiURL!, method: .get).responseJSON { myresponse in

            // check result is success or failure
            switch myresponse.result {
            case .success:

                // GET data
                let myresult = try? JSON(data: myresponse.data!)
                let resultArray = myresult!

                //
                var i = 0
                for item in resultArray.arrayValue {
                    if item["idDrink"].stringValue == self.id {
                        let id = item["idDrink"].string
                        let name = item["strDrink"].string
                        let image = item["strDrinkThumb"].string
                        
                        
                        
                    }

                    i = i + 1
                }

            case .failure:
                Alert.showAlert(message: "Bir hata oluştu. Pet Shop Listesi Getiriemedi!", vc: self)
            }
        }
    }
    
    // MARK: Save Fav Cocktails to Core Data
    
    @IBAction func SaveCoreData(_ sender: Any) {
    }
}
