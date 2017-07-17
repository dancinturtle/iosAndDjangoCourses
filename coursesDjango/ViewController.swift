//
//  ViewController.swift
//  coursesDjango
//
//  Created by Amy Giver on 1/20/17.
//  Copyright © 2017 Amy Giver Squid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeAPICall(url: "http://localhost:8000/")
        // Do any additional setup after loading the view, typically from a nib.
        makePostRequest(url: "http://localhost:8000/create", name: "iOS", desc: "best course")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
              // Dispose of any resources that can be recreated.
    }
    
    func makeAPICall(url: String){
        CoursesModel.getRequests(url: url, completionHandler: {
            data, response, error in
            do {
                if let mydata = data {
                    print("Here's some data", mydata)
                }
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                    print("got the jsonResult", jsonResult[0])
                    if let dictionary = jsonResult[0] as? NSDictionary
                    {
                        print("dictionary", dictionary["fields"] ?? "Nothing in dictionary")
                    }}
                else {
                    print("Couldn't cast as NSDictionary.")
                }
            }
            catch {
                print("Here's the error", error)
            }
        })
    }
    
    func makePostRequest(url: String, name: String, desc: String){
        CoursesModel.postRequests(url: url, name: name, desc: desc, completionHandler: {
            data, response, error in
            do {
                if let mydata = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? Any {
                    print("Posting data", mydata)
                }
            }
            catch {
                print("Problems with posting", error)
            }
        })
        
    }
}

