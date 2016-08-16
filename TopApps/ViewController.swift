//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//  Updated by SwiftBook.ru 24/11/2015
import UIKit

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
            // Get #1 app name using SwiftyJSON
            let json = JSON(data: data)
            if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
                print("SwiftyJSON: \(appName)")
            }
        }
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        DataManager.getTopAppsDataFromItunesWithSuccess { (iTunesData) -> Void in
            let json = JSON(data: iTunesData)
            if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
                print("NSURLSession: \(appName)")
            }
            // More soon...
        }
    }
    
    
  }


