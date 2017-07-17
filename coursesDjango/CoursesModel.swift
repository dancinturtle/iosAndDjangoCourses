//
//  coursesModel.swift
//  coursesDjango
//
//  Created by Amy Giver on 1/20/17.
//  Copyright © 2017 Amy Giver Squid. All rights reserved.
//

import UIKit

class CoursesModel {
    static func getRequests(url: String, completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: url)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func postRequests(url: String, name: String, desc: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let bodyData = "name=\(name)&desc=\(desc)"
            request.httpBody = bodyData.data(using: .utf8)
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            task.resume()
        }
       
        
    }
}

