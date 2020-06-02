//
//  CategoriesVC.swift
//  Cocktail
//
//  Created by Metehan kara on 2.06.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesVC: UIViewController {

    // MARK: Variables
    
    var categories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getCategories(){
        
        AF.request(<#T##convertible: URLConvertible##URLConvertible#>)
    }
}
