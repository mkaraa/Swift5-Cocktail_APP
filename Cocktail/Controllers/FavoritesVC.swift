//
//  FavoritesVC.swift
//  Cocktail
//
//  Created by Metehan kara on 31.05.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit
import CoreData

class FavoritesVC: UIViewController {

    // MARK: Variables
    
    var ids = [NSManagedObject]()
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(ids)
    }
    
    // MARK: Fetch CoreData
    
     override func viewWillAppear(_ animated: Bool) {
         //1
         let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
         
         //2
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
         
         //3
         do {
             let results = try managedContext.fetch(fetchRequest)
             ids = results as! [NSManagedObject]
             
         } catch let error as NSError {
             print("Could not fetch \(error), \(error.userInfo)")
         }
     }

}
