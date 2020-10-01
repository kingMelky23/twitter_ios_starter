//
//  LoginViewController.swift
//  Twitter
//
//  Created by Melchizedek Tetteh on 9/30/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "LogInToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.set(true,forKey:"userLoggedIn")
            
            self.performSegue(withIdentifier: "LogInToHome", sender: self)
        }, failure: { (Error) in
            print("could not log in")
        })
    }
    


}
