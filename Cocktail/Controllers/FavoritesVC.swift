//
//  FavoritesVC.swift
//  Cocktail
//
//  Created by Metehan kara on 31.05.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON
import Kingfisher

struct listCocktail {
    let id: String!
    let name: String!
    let image: String!
}

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    @IBOutlet weak var table: UITableView!
    // MARK: Variables
    var ids = [Person]()
    
    var apiUrl = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    
    var categoryTitle: String?
    var listItem = [listCocktail]()
    var names = [String]()
    
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        table.dataSource = self
        table.delegate = self

    }
    
    
    // MARK: Fetch CoreData
    override func viewWillAppear(_ animated: Bool) {
        
        ids.removeAll()
        fetchtDataRequest()
        
    }
    
    func fetchtDataRequest(){
        
        //1
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        //3
        do {
            
            let results = try managedContext.fetch(fetchRequest)
            ids = results as! [Person]
            table.reloadData()
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        names.removeAll()
        for item in ids {
            names.append(item.isim!)
            
        }
        table.reloadData()
    }

    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }

        cell?.textLabel?.text = names[indexPath.row]

        return cell!
    }
    

    
   
    
}
