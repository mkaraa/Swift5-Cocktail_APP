//
//  ListCocktailVC.swift
//  Cocktail
//
//  Created by Metehan kara on 3.06.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

struct listOfCocktail {
    let id: String!
    let name: String!
    let image: String!
}

class ListCocktailVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: IBOutlet
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    // MARK: Variable
     
     var apiUrl: URL?
     var categoryTitle: String?
     var listItem = [listOfCocktail]()

    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getList()

        // delegate
        self.mCollectionView.delegate = self
        self.mCollectionView.dataSource = self
        
        self.title = categoryTitle
        self.mCollectionView.reloadData()
    }
    
    func getList(){
        
        AF.request(apiUrl!).responseJSON { myresponse in
            
            // check result is success or failure
            switch myresponse.result {
            case .success:
                
                // GET data
                let myresult = try? JSON(data: myresponse.data!)
                
                let resultArray = myresult!
                
                for item in resultArray["drinks"].arrayValue {
                    
                    let id = item["idDrink"].string
                    let name = item["strDrink"].string
                    let image = item["strDrinkThumb"].string
                    print(id!,name!,image!)
                    self.listItem.insert(listOfCocktail(id: id, name: name, image: image), at: 0)
                }
 
                print("LIST: ",self.listItem.count)
                self.mCollectionView.reloadData()
                
            case .failure:
                
                print("Error while getting list")
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionView
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return self.listItem.count
   }
     
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.cellLabel.text = listItem[indexPath.row].name
        
        let url = URL(string: listItem[indexPath.row].image)
        cell.cellImageView.kf.setImage(with: url)
        
        return cell
        
    }
    

    
    // Our function to find the indexPath of selected cell
    func getIndexPathForSelectedCell() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mCollectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = mCollectionView.indexPathsForSelectedItems![0] as IndexPath
        }
        
        return indexPath
    }
    
}

// MARK: CustomCollectionViewCell - class
class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
