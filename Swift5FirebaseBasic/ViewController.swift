//
//  ViewController.swift
//  Swift5FirebaseBasic
//
//  Created by 神崎泰旗 on 2018/11/12.
//  Copyright © 2018年 taiki. All rights reserved.
//

import UIKit
import LineSDK

class ViewController: UIViewController, LineSDKLoginDelegate {
    
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LineSDKLogin.sharedInstance().delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        
        if let displayName = profile?.displayName{
            
            self.displayName = displayName
            
        }
        
        if let pictureURL = profile?.pictureURL{
            
            self.pictureURLString = pictureURL.absoluteString
            
        }
        
        UserDefaults.standard.set(self.displayName, forKey: "displayName")
        UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")

        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        LineSDKLogin.sharedInstance().start()

        
        
    }
    

}

