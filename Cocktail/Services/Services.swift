//
//  Services.swift
//  Cocktail
//
//  Created by Metehan kara on 31.05.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import Foundation

public class RequestServices {
    
    class func listCategories(){
        let headers = [
               "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
               "x-rapidapi-key": "30660b8450msh5048dfacc23a0acp102ce2jsnbddcb91a0958"
           ]

           let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/list.php?c=list")! as URL,
                                                   cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headers

           let session = URLSession.shared
           let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
               if (error != nil) {
                   print(error)
               } else {
                   let httpResponse = response as? HTTPURLResponse
                   print(httpResponse)
               }
           })

           dataTask.resume()
    }
    
    class func FilterByCategory(name:String){
        
        let headers = [
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
            "x-rapidapi-key": "30660b8450msh5048dfacc23a0acp102ce2jsnbddcb91a0958"
        ]
        
        let tempURL = "https://the-cocktail-db.p.rapidapi.com/filter.php?c="+name
        let request = NSMutableURLRequest(url: NSURL(string: tempURL)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
    
}
